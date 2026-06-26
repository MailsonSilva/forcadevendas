// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

Future<FirstAccessResultStruct> downloadDatabaseFromFtp(
  String empresaCodigo,
  String vendedorCodigo,
) async {
  FtpClient? ftp;
  try {
    final empresa = empresaCodigo.trim().toUpperCase();
    final vendedor = vendedorCodigo.trim();
    if (empresa.isEmpty || vendedor.isEmpty) {
      final result = {
        'success': false,
        'message': 'Informe empresa e vendedor.',
      };
      return FirstAccessResultStruct.fromMap(result);
    }

    ftp = await FtpClient.connect(
      host: 'ftp.suportware.com.br',
      user: 'suportware8',
      password: 'sw@660031',
    );

    await ftp.cwd('/config/');
    final acessoBytes = await ftp.retr('acesso');
    final acessoText = utf8.decode(acessoBytes);
    final decoded = jsonDecode(acessoText);
    if (decoded is! Map<String, dynamic>) {
      final result = {
        'success': false,
        'message': 'Arquivo acesso invalido.',
      };
      return FirstAccessResultStruct.fromMap(result);
    }

    final configRaw = decoded[empresa];
    if (configRaw is! Map<String, dynamic>) {
      final result = {
        'success': false,
        'message': 'Empresa nao encontrada no acesso.',
      };
      return FirstAccessResultStruct.fromMap(result);
    }

    final pastaDownload = configRaw['pasta_download']?.toString() ?? '';
    final nomeArquivoDb = configRaw['nome_arquivo_db']?.toString() ?? '';
    if (pastaDownload.isEmpty || nomeArquivoDb.isEmpty) {
      final result = {
        'success': false,
        'message': 'Configuracao de download incompleta.',
      };
      return FirstAccessResultStruct.fromMap(result);
    }

    final carga = '$nomeArquivoDb$vendedor.crg';
    await ftp.cwd(pastaDownload);
    final dbBytes = await ftp.retr(carga);

    final databasesPath = await getDatabasesPath();
    final dbFile = File(p.join(databasesPath, 'dbforcacad001.db'));
    await dbFile.parent.create(recursive: true);
    await dbFile.writeAsBytes(dbBytes, flush: true);

    final result = {
      'success': true,
      'message': 'Base local atualizada.',
    };
    return FirstAccessResultStruct.fromMap(result);
  } catch (e) {
    final result = {
      'success': false,
      'message': 'Falha ao baixar carga: $e',
    };
    return FirstAccessResultStruct.fromMap(result);
  } finally {
    await ftp?.quit();
  }
}

class FtpClient {
  FtpClient._(this._socket, this._lines);

  final Socket _socket;
  final StreamIterator<String> _lines;

  static Future<FtpClient> connect({
    required String host,
    required String user,
    required String password,
  }) async {
    final socket = await Socket.connect(
      host,
      21,
      timeout: const Duration(seconds: 20),
    );
    final lines = StreamIterator(
      socket
          .map<List<int>>((chunk) => chunk)
          .transform(utf8.decoder)
          .transform(const LineSplitter()),
    );
    final client = FtpClient._(socket, lines);
    await client._expect([220]);
    await client._cmd('USER $user', [230, 331]);
    await client._cmd('PASS $password', [230]);
    await client._cmd('TYPE I', [200]);
    return client;
  }

  Future<void> cwd(String path) => _cmd('CWD $path', [250]);

  Future<List<int>> retr(String fileName) async {
    final dataSocket = await _openPassiveDataSocket();
    _write('RETR $fileName');
    final preliminary = await _readReply();
    if (preliminary.code != 125 && preliminary.code != 150) {
      dataSocket.destroy();
      throw StateError('FTP RETR recusado: ${preliminary.message}');
    }
    final completer = Completer<List<int>>();
    final buffer = <int>[];
    dataSocket.listen(
      buffer.addAll,
      onError: completer.completeError,
      onDone: () => completer.complete(buffer),
      cancelOnError: true,
    );
    final bytes = await completer.future.timeout(const Duration(seconds: 60));
    await _expect([226, 250]);
    return bytes;
  }

  Future<void> quit() async {
    try {
      await _cmd('QUIT', [221]);
    } catch (_) {
      // Ignore disconnect errors during cleanup.
    }
    await _lines.cancel();
    await _socket.close();
  }

  Future<Socket> _openPassiveDataSocket() async {
    final reply = await _cmd('PASV', [227]);
    final match = RegExp(
      r'\((\d+),(\d+),(\d+),(\d+),(\d+),(\d+)\)',
    ).firstMatch(reply.message);
    if (match == null) {
      throw StateError('Resposta PASV invalida: ${reply.message}');
    }
    final parts = List<int>.generate(6, (i) => int.parse(match.group(i + 1)!));
    final host = '${parts[0]}.${parts[1]}.${parts[2]}.${parts[3]}';
    final port = parts[4] * 256 + parts[5];
    return Socket.connect(host, port, timeout: const Duration(seconds: 20));
  }

  Future<_FtpReply> _cmd(String command, List<int> expected) async {
    _write(command);
    return _expect(expected);
  }

  Future<_FtpReply> _expect(List<int> expected) async {
    final reply = await _readReply();
    if (!expected.contains(reply.code)) {
      throw StateError('FTP ${reply.code}: ${reply.message}');
    }
    return reply;
  }

  void _write(String command) {
    _socket.write('$command\r\n');
  }

  Future<_FtpReply> _readReply() async {
    if (!await _lines.moveNext()) {
      throw const SocketException('Conexao FTP encerrada.');
    }
    final first = _lines.current;
    if (first.length < 3) {
      throw StateError('Resposta FTP invalida: $first');
    }
    final code = int.parse(first.substring(0, 3));
    final messages = <String>[first];
    if (first.length > 3 && first[3] == '-') {
      while (await _lines.moveNext()) {
        final line = _lines.current;
        messages.add(line);
        if (line.startsWith('$code ')) break;
      }
    }
    return _FtpReply(code, messages.join('\n'));
  }
}

class _FtpReply {
  const _FtpReply(this.code, this.message);
  final int code;
  final String message;
}
