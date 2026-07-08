// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<ProdutoResultStruct?> carregarProdutoDetalhe(
  String? produtoRef,
) async {
  try {
    final dbPath = join(await getDatabasesPath(), 'dbforcacad001.db');
    if (!await File(dbPath).exists()) return null;

    final db = await openDatabase(dbPath);
    final String codigoBusca = (produtoRef ?? '').trim();
    if (codigoBusca.isEmpty) return null;

    final List<Map<String, dynamic>> maps = await db.rawQuery(
        'SELECT * FROM cadpro00 WHERE TRIM(pro00_codigo) = ? OR CAST(pro00_codigo AS INTEGER) = ?',
        [codigoBusca, int.tryParse(codigoBusca) ?? -1]);

    if (maps.isNotEmpty) {
      final m = maps.first;
      String codigoProd = m['pro00_codigo']?.toString().trim() ?? codigoBusca;
      String baseImgCode = int.tryParse(codigoProd)?.toString() ?? codigoProd;

      final directory = await getApplicationDocumentsDirectory();

      List<String> fotosEncontradas = [];
      List<String> sufixos = ['', '_1', '_2', '_3', '_4', '_5'];

      for (String sufixo in sufixos) {
        String nomeDoArquivo = "$baseImgCode$sufixo.jpg";

        // Caminho relativo amigável para o seu ImagemLocalWidget
        String caminhoRelativo = "images/catalogo_imagens/$nomeDoArquivo";
        String caminhoFisicoParaTeste = "${directory.path}/$caminhoRelativo";

        if (await File(caminhoFisicoParaTeste).exists()) {
          fotosEncontradas.add(caminhoRelativo);
        }
      }

      if (fotosEncontradas.isEmpty) {
        fotosEncontradas.add("$baseImgCode.jpg");
      }

      double parseDouble(dynamic value) {
        if (value == null) return 0.0;
        if (value is num) return value.toDouble();
        if (value is String) return double.tryParse(value) ?? 0.0;
        return 0.0;
      }

      return ProdutoResultStruct(
        codigo: codigoProd,
        descricao: m['pro00_descri']?.toString() ?? '',
        unidade: m['pro00_unidad']?.toString() ?? '',
        preco: parseDouble(m['preco_venda']),
        saldoEstoque: parseDouble(m['saldo']),
        estoqueAtual: parseDouble(m['estoque_atual']),
        estoquePendente: parseDouble(m['estoque_pendente']),
        linha: m['pro00_codlin']?.toString() ?? '',
        grupo: m['pro00_codgrp']?.toString() ?? '',
        fabricante: m['pro00_codfab']?.toString() ?? '',
        marca: m['pro00_codmar']?.toString() ?? '',
        fotosProduto: fotosEncontradas,
      );
    }
  } catch (e) {
    print('Erro: $e');
  }
  return null;
}
