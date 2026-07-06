// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
<<<<<<< HEAD
// Imports other custom actions
// Imports custom functions
=======
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future<FirstAccessResultStruct> firstAccessLogin(
  String empresaCodigo,
  String vendedorCodigo,
) async {
  FtpClient? ftp;
  try {
    if (kIsWeb) {
      return FirstAccessResultStruct.fromMap({
        'success': false,
        'message':
            'O download via FTP não funciona na Web. Teste no celular (APK) ou emulador.',
      });
    }

    final empresa = empresaCodigo.trim().toUpperCase();
    final vendedor = vendedorCodigo.trim();
    if (empresa.isEmpty || vendedor.isEmpty) {
      return FirstAccessResultStruct.fromMap({
        'success': false,
        'message': 'Informe empresa e vendedor.',
      });
    }

    ftp = await FtpClient.connect(
      host: 'ftp.suportware.com.br',
      user: 'suportware8',
      password: 'sw@660031',
    );

    // Ajustado para remover a barra inicial se necessário e usar acesso.json
    await ftp.cwd('/config/');
    final acessoBytes = await ftp.retr('acesso');
    final acessoText = utf8.decode(acessoBytes);
    final decoded = jsonDecode(acessoText);

    if (decoded is! Map<String, dynamic>) {
      return FirstAccessResultStruct.fromMap({
        'success': false,
        'message': 'Arquivo acesso invalido.',
      });
    }

    final configRaw = decoded[empresa];
    if (configRaw is! Map<String, dynamic>) {
      return FirstAccessResultStruct.fromMap({
        'success': false,
        'message': 'Empresa nao encontrada no acesso.',
      });
    }
// Pega as configurações do JSON
    String pastaDownload = configRaw['pasta_download']?.toString() ?? '';
    final nomeArquivoDb = configRaw['nome_arquivo_db']?.toString() ?? '';

    if (pastaDownload.isEmpty || nomeArquivoDb.isEmpty) {
      return FirstAccessResultStruct.fromMap({
        'success': false,
        'message': 'Configuracao de download incompleta.',
      });
    }

    final carga = '$nomeArquivoDb$vendedor.crg';

    // 1. Volta para a raiz absoluta do servidor
    await ftp.cwd('/');

    // 2. Navegação progressiva (Bulletproof para FTPs restritos)
    // Isso divide "/diniz/download/" em partes e entra uma por uma
    final pastas = pastaDownload.split('/').where((p) => p.trim().isNotEmpty);
    for (String pasta in pastas) {
      await ftp.cwd(pasta.trim());
    }

    // 3. Baixa o arquivo da carga
    final dbBytes = await ftp.retr(carga);
    final databasesPath = await getDatabasesPath();
    final tempFile = File(p.join(databasesPath, 'temp_carga.crg'));
    await tempFile.parent.create(recursive: true);
    await tempFile.writeAsBytes(dbBytes, flush: true);

    List<int> sqliteBuffer = [];

    // --- INÍCIO DA EXTRAÇÃO MULTICAMADA ---
    try {
      final compressedBytes = await tempFile.readAsBytes();

      if (compressedBytes.length < 5) {
        throw Exception(
            'Arquivo muito pequeno: ${compressedBytes.length} bytes');
      }

      // 1. Pula a primeira assinatura/cabeçalho de 4 bytes
      final camada1 = compressedBytes.sublist(4);

      // 2. Primeiro Inflate (Camada 1)
      List<int> descompactado1 = zlib.decode(camada1);

      // 3. Checa o cabeçalho para ver se já é o banco SQLite puro
      final header1 =
          utf8.decode(descompactado1.take(16).toList(), allowMalformed: true);

      if (header1.contains('SQLite format 3')) {
        sqliteBuffer = descompactado1;
      } else {
        // 4. Se não for, pula os próximos 4 bytes do cabeçalho da segunda camada
        if (descompactado1.length < 5) {
          throw Exception('Segunda camada muito pequena.');
        }
        final camada2 = descompactado1.sublist(4);

        // 5. Segundo Inflate (Camada 2)
        sqliteBuffer = zlib.decode(camada2);
      }

      // 6. Validação final para garantir que o resultado é um SQLite válido
      final finalHeader =
          utf8.decode(sqliteBuffer.take(16).toList(), allowMalformed: true);
      if (!finalHeader.contains('SQLite format 3')) {
        throw Exception('Banco SQLite final invalido ou corrompido.');
      }
    } catch (e) {
      if (await tempFile.exists()) {
        await tempFile.delete();
      }
      return FirstAccessResultStruct.fromMap({
        'success': false,
        'message': 'Falha na descompressao do .crg: ${e.toString()}',
      });
    }
    // --- FIM DA EXTRAÇÃO MULTICAMADA ---

    final dbFile = File(p.join(databasesPath, 'dbforcacad001.db'));
    await dbFile.writeAsBytes(sqliteBuffer, flush: true);

    if (await tempFile.exists()) {
      await tempFile.delete();
    }

    return FirstAccessResultStruct.fromMap({
      'success': true,
      'message': 'Base local atualizada.',
    });
  } catch (e) {
    return FirstAccessResultStruct.fromMap({
      'success': false,
      'message': 'Falha ao baixar carga: $e',
    });
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
    final socket =
        await Socket.connect(host, 21, timeout: const Duration(seconds: 20));
    final lines = StreamIterator(
      socket
          .cast<List<int>>()
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

    // Tratamento ajustado para fechar o socket corretamente ao finalizar
    dataSocket.listen(
      buffer.addAll,
      onError: completer.completeError,
      onDone: () {
        dataSocket.destroy();
        completer.complete(buffer);
      },
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
    final match = RegExp(r'\((\d+),(\d+),(\d+),(\d+),(\d+),(\d+)\)')
        .firstMatch(reply.message);
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
