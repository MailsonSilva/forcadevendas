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
    // 1. Abre o banco local com segurança
    final dbPath = join(await getDatabasesPath(), 'dbforcacad001.db');
    if (!await File(dbPath).exists()) {
      return null;
    }

    final db = await openDatabase(dbPath);
    final String codigoBusca = (produtoRef ?? '').trim();
    if (codigoBusca.isEmpty) return null;

    // 2. QUERY BLINDADA CONTRA ESPAÇOS EM BRANCO NO BANCO DE DADOS
    // O comando TRIM no LEFT JOIN garante que "10586 " cruze perfeitamente com "10586"
    final String query = '''
      SELECT DISTINCT 
        p.pro00_codigo, 
        p.pro00_descri, 
        p.pro00_unidad,
        p.pro00_codlin,
        p.pro00_codgrp,
        p.pro00_codfab,
        p.pro00_codmar,
        p.pro00_codbar,
        COALESCE(t.pro00_pcosub, 0) AS preco_venda, 
        COALESCE(e.pro00_qtdest, 0) AS estoque_atual, 
        COALESCE(e.pro00_qtdpen, 0) AS estoque_pendente, 
        (COALESCE(e.pro00_qtdest, 0) - COALESCE(e.pro00_qtdpen, 0)) AS saldo 
      FROM cadpro00 p 
      LEFT JOIN estpcopro00 t ON TRIM(CAST(t.pro00_codpro AS TEXT)) = TRIM(CAST(p.pro00_codigo AS TEXT))
      LEFT JOIN estpro00 e ON TRIM(CAST(e.pro00_codpro AS TEXT)) = TRIM(CAST(p.pro00_codigo AS TEXT))
      WHERE TRIM(p.pro00_codigo) = ? OR CAST(p.pro00_codigo AS INTEGER) = ?
      LIMIT 1
    ''';

    final intValue = int.tryParse(codigoBusca) ?? -1;
    final results = await db.rawQuery(query, [codigoBusca, intValue]);
    await db.close();

    if (results.isNotEmpty) {
      final m = results.first;
      String codigoProd = m['pro00_codigo']?.toString().trim() ?? codigoBusca;

      // Código base limpo para encontrar os arquivos físicos
      String baseImgCode = int.tryParse(codigoProd)?.toString() ?? codigoProd;

      final directory = await getApplicationDocumentsDirectory();
      final String pastaImagensPath =
          "${directory.path}/images/catalogo_imagens";

      List<String> fotosEncontradas = [];
      List<String> sufixos = [
        '',
        '_1',
        '_2',
        '_3',
        '_4',
        '_5',
        '_6',
        '_7',
        '_8'
      ];

      for (String sufixo in sufixos) {
        String nomeArquivo = "$baseImgCode$sufixo.jpg";
        String caminhoFisicoParaTeste = "$pastaImagensPath/$nomeArquivo";

        if (await File(caminhoFisicoParaTeste).exists()) {
          // Passa o caminho exato que o widget sabe ler
          fotosEncontradas.add("images/catalogo_imagens/$nomeArquivo");
        }
      }

      if (fotosEncontradas.isEmpty) {
        fotosEncontradas.add("images/catalogo_imagens/$baseImgCode.jpg");
      }

      double parseDouble(dynamic value) {
        if (value == null) return 0.0;
        if (value is num) return value.toDouble();
        if (value is String)
          return double.tryParse(value.replaceAll(',', '.')) ?? 0.0;
        return 0.0;
      }

      // 3. Retorna populando a propriedade correta (fotosProduto)
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
        codbar: m['pro00_codbar']?.toString() ?? '',
        fotosProduto: fotosEncontradas,
      );
    }
  } catch (e) {
    print('Erro em carregarProdutoDetalhe: $e');
  }
  return null;
}
