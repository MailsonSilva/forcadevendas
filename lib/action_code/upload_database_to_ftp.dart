// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

Future<FirstAccessResultStruct> uploadDatabaseToFtp(
  String vendedorCodigo,
) async {
  FtpClient? ftp;
  try {
    final vendedor = vendedorCodigo.trim();
    if (vendedor.isEmpty) {
      return FirstAccessResultStruct.fromMap({
        'success': false,
        'message': 'Codigo do vendedor nao informado.',
      });
    }

    final databasesPath = await getDatabasesPath();
    final dbFile = File(p.join(databasesPath, 'dbforcacad001.db'));
    if (!await dbFile.exists()) {
      return FirstAccessResultStruct.fromMap({
        'success': false,
        'message': 'Banco de dados local nao encontrado.',
      });
    }

    final dbBytes = await dbFile.readAsBytes();

    // Função auxiliar para comprimir e adicionar cabeçalho de 4 bytes com o tamanho original
    List<int> compressLayer(List<int> data) {
      final compressed = zlib.encode(data);
      final len = data.length;
      final header = [
        (len >> 24) & 0xFF,
        (len >> 16) & 0xFF,
        (len >> 8) & 0xFF,
        len & 0xFF,
      ];
      return [...header, ...compressed];
    }

    // Compressão de duas camadas
    final layer1 = compressLayer(dbBytes);
    final crgBytes = compressLayer(layer1);

    ftp = await FtpClient.connect(
      host: 'ftp.suportware.com.br',
      user: 'suportware8',
      password: 'sw@660031',
    );

    // 1. Navega para a raiz
    await ftp.cwd('/');

    // 2. Entra no destino diniz/upload progressivamente
    final targetPath = '/diniz/upload/';
    final pastas = targetPath.split('/').where((p) => p.trim().isNotEmpty);
    for (String pasta in pastas) {
      await ftp.cwd(pasta.trim());
    }

    final nomeArquivoUpload = 'ven$vendedor.crg';
    await ftp.stor(nomeArquivoUpload, crgBytes);

    return FirstAccessResultStruct.fromMap({
      'success': true,
      'message': 'Banco de dados enviado com sucesso.',
    });
  } catch (e) {
    return FirstAccessResultStruct.fromMap({
      'success': false,
      'message': 'Falha ao subir carga: $e',
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

  Future<void> stor(String fileName, List<int> bytes) async {
    final dataSocket = await _openPassiveDataSocket();
    _write('STOR $fileName');
    final preliminary = await _readReply();
    if (preliminary.code != 125 && preliminary.code != 150) {
      dataSocket.destroy();
      throw StateError('FTP STOR recusado: ${preliminary.message}');
    }
    dataSocket.add(bytes);
    await dataSocket.flush();
    await dataSocket.close();
    await _expect([226, 250]);
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
