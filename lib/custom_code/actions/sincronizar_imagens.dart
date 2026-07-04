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

Future<dynamic> sincronizarImagens(String modo) async {
  final String baseUrl = "http://heh08x312dp.sn.mynetname.net:8080/catalogo";
  final String subdir = "images/catalogo_imagens";

  int total = 0;
  int ok = 0;
  List<String> falhas = [];

  try {
    // 1. Define qual arquivo de lista ler com base na escolha do usuário no front-end
    final String arquivoLista =
        (modo.trim().toLowerCase() == 'parcial') ? '_partial.txt' : '_full.txt';

    final String urlLista = "$baseUrl/$arquivoLista";
    print('[SYNC IMAGENS] Buscando lista em: $urlLista');

    // 2. Baixa o arquivo de texto com a relação de imagens
    final responseLista = await http.get(Uri.parse(urlLista));
    if (responseLista.statusCode != 200) {
      throw Exception(
          "Erro HTTP ${responseLista.statusCode} ao obter a lista do servidor.");
    }

    // Processa as linhas do arquivo de texto
    final List<String> arquivos = LineSplitter.split(responseLista.body)
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .toList();

    total = arquivos.length;
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
        print('[SYNC IMAGENS] Baixando ${i + 1} de $total: $nomeArquivo');
        final responseImagem = await http.get(Uri.parse(urlRemota));

        if (responseImagem.statusCode == 200) {
          final File arquivoLocal = File(caminhoLocalArquivo);
          await arquivoLocal.writeAsBytes(responseImagem.bodyBytes);
          ok++;
        } else {
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
