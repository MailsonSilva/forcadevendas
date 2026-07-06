// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
<<<<<<< HEAD

Future<dynamic> sincronizarImagens(String modo) async {
  final String baseUrl = "http://heh08x312dp.sn.mynetname.net:8080/catalogo";
  final String subdir = "images/catalogo_imagens";
=======
import 'dart:isolate';
import 'dart:async';

class ImageSyncProgress {
  static final ValueNotifier<Map<String, dynamic>?> progressNotifier = ValueNotifier(null);
}

class _SyncTaskArgs {
  final SendPort sendPort;
  final String modo;
  final String baseUrl;
  final String documentsDirPath;
  final String subdir;

  _SyncTaskArgs({
    required this.sendPort,
    required this.modo,
    required this.baseUrl,
    required this.documentsDirPath,
    required this.subdir,
  });
}

void _downloadIsolateEntryPoint(_SyncTaskArgs args) async {
  final sendPort = args.sendPort;
  final modo = args.modo;
  final baseUrl = args.baseUrl;
  final documentsDirPath = args.documentsDirPath;
  final subdir = args.subdir;
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)

  int total = 0;
  int ok = 0;
  List<String> falhas = [];

  try {
    // 1. Define qual arquivo de lista ler com base na escolha do usuário no front-end
    final String arquivoLista =
        (modo.trim().toLowerCase() == 'parcial') ? '_partial.txt' : '_full.txt';

    final String urlLista = "$baseUrl/$arquivoLista";
<<<<<<< HEAD
    print('[SYNC IMAGENS] Buscando lista em: $urlLista');
=======
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)

    // 2. Baixa o arquivo de texto com a relação de imagens
    final responseLista = await http.get(Uri.parse(urlLista));
    if (responseLista.statusCode != 200) {
<<<<<<< HEAD
      throw Exception(
          "Erro HTTP ${responseLista.statusCode} ao obter a lista do servidor.");
=======
      sendPort.send({
        'status': 'error',
        'modo': modo,
        'message': "Erro HTTP ${responseLista.statusCode} ao obter a lista do servidor.",
      });
      return;
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
    }

    // Processa as linhas do arquivo de texto
    final List<String> arquivos = LineSplitter.split(responseLista.body)
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .toList();

    total = arquivos.length;
<<<<<<< HEAD
    print('[SYNC IMAGENS] Total de arquivos mapeados na lista: $total');

    if (total == 0) {
      return {"total": 0, "ok": 0, "modo": modo, "falhas": []};
    }

    // 3. Define e garante a existência do diretório local no Android/iOS
    final directory = await getApplicationDocumentsDirectory();
    final String caminhoPastaImagens = "${directory.path}/$subdir";
    final Directory pastaDestino = Directory(caminhoPastaImagens);

    // Se o modo for total, limpa a pasta antes de começar (conforme lógica original)
    if (modo.trim().toLowerCase() == 'total' && await pastaDestino.exists()) {
      print('[SYNC IMAGENS] Modo total selecionado. Limpando pasta local...');
=======
    sendPort.send({
      'status': 'baixando',
      'total': total,
      'ok': 0,
      'modo': modo,
      'falhas': [],
    });

    if (total == 0) {
      sendPort.send({
        'status': 'complete',
        'total': 0,
        'ok': 0,
        'modo': modo,
        'falhas': [],
      });
      return;
    }

    // 3. Define e garante a existência do diretório local no Android/iOS
    final String caminhoPastaImagens = "$documentsDirPath/$subdir";
    final Directory pastaDestino = Directory(caminhoPastaImagens);

    // Se o modo for total, limpa a pasta antes de começar
    if (modo.trim().toLowerCase() == 'total' && await pastaDestino.exists()) {
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
      await pastaDestino.delete(recursive: true);
    }

    if (!await pastaDestino.exists()) {
      await pastaDestino.create(recursive: true);
    }

    // 4. Executa o download iterativo das imagens
    for (int i = 0; i < total; i++) {
      final String nomeArquivo = arquivos[i];
      final String urlRemota = "$baseUrl/$nomeArquivo";
      final String caminhoLocalArquivo = "$caminhoPastaImagens/$nomeArquivo";

      try {
<<<<<<< HEAD
        print('[SYNC IMAGENS] Baixando ${i + 1} de $total: $nomeArquivo');
=======
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
        final responseImagem = await http.get(Uri.parse(urlRemota));

        if (responseImagem.statusCode == 200) {
          final File arquivoLocal = File(caminhoLocalArquivo);
          await arquivoLocal.writeAsBytes(responseImagem.bodyBytes);
          ok++;
        } else {
<<<<<<< HEAD
          print(
              '[SYNC IMAGENS] Falha HTTP ${responseImagem.statusCode} no arquivo: $nomeArquivo');
          falhas.add(nomeArquivo);
        }
      } catch (err) {
        print(
            '[SYNC IMAGENS] Erro ao baixar arquivo individual ($nomeArquivo): $err');
        falhas.add(nomeArquivo);
      }
    }

    // 5. Retorna o JSON de resumo da operação para o FlutterFlow tratar no front
    return {"total": total, "ok": ok, "modo": modo, "falhas": falhas};
  } catch (e) {
    print('[SYNC IMAGENS] Erro fatal na rotina de sincronizacao: $e');
    return {
      "total": total,
      "ok": ok,
      "modo": modo,
      "erro_fatal": e.toString(),
      "falhas": falhas
    };
  }
}
=======
          falhas.add(nomeArquivo);
        }
      } catch (err) {
        falhas.add(nomeArquivo);
      }

      // Send progress update
      sendPort.send({
        'status': 'baixando',
        'total': total,
        'ok': ok,
        'modo': modo,
        'falhas': falhas,
      });
    }

    // 5. Retorna o resumo completo da operação
    sendPort.send({
      'status': 'complete',
      'total': total,
      'ok': ok,
      'modo': modo,
      'falhas': falhas,
    });
  } catch (e) {
    sendPort.send({
      'status': 'error',
      'total': total,
      'ok': ok,
      'modo': modo,
      'erro_fatal': e.toString(),
      'falhas': falhas,
    });
  }
}

Future<dynamic> sincronizarImagens(String modo) async {
  final String baseUrl = "http://heh08x312dp.sn.mynetname.net:8080/catalogo";
  final String subdir = "images/catalogo_imagens";

  final directory = await getApplicationDocumentsDirectory();
  final documentsDirPath = directory.path;

  final receivePort = ReceivePort();
  final completer = Completer<dynamic>();

  final args = _SyncTaskArgs(
    sendPort: receivePort.sendPort,
    modo: modo,
    baseUrl: baseUrl,
    documentsDirPath: documentsDirPath,
    subdir: subdir,
  );

  receivePort.listen((message) {
    if (message is Map<String, dynamic>) {
      final status = message['status'];

      // Atualiza o progresso global para a UI
      ImageSyncProgress.progressNotifier.value = message;

      if (status == 'complete' || status == 'error') {
        receivePort.close();
        completer.complete(message);
      }
    }
  });

  await Isolate.spawn(_downloadIsolateEntryPoint, args);

  return completer.future;
}

>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
