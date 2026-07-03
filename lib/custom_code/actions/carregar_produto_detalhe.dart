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
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';

Future<ProdutoResultStruct?> carregarProdutoDetalhe(
  String? produtoRef,
) async {
  try {
    // 1. Abre o banco utilizando o arquivo local correto
    final dbPath = join(await getDatabasesPath(), 'dbforcacad001.db');
    final exists = await File(dbPath).exists();

    if (!exists) {
      print('DIAGNOSTICO DETALHE: Arquivo do banco de dados nao encontrado.');
      return null;
    }

    final db = await openDatabase(dbPath);
    final String codigoBusca = produtoRef ?? '';

    if (codigoBusca.trim().isEmpty) {
      await db.close();
      return null;
    }

    // 2. Query ajustada com todos os campos que você solicitou
    final String query = '''
      SELECT DISTINCT 
        p.pro00_codigo, 
        p.pro00_descri, 
        p.pro00_unidad,
        p.pro00_codlin,
        p.pro00_codgrp,
        p.pro00_codfab,
        p.pro00_codmar,
        COALESCE(t.pro00_pcosub, 0) AS preco_venda, 
        COALESCE(e.pro00_qtdest, 0) AS estoque_atual, 
        COALESCE(e.pro00_qtdpen, 0) AS estoque_pendente, 
        (COALESCE(e.pro00_qtdest, 0) - COALESCE(e.pro00_qtdpen, 0)) AS saldo 
      FROM cadpro00 p 
      LEFT JOIN estpcopro00 t ON t.pro00_codpro = p.pro00_codigo 
      LEFT JOIN estpro00 e ON e.pro00_codpro = p.pro00_codigo 
      WHERE p.pro00_codigo = ?
      LIMIT 1
    ''';

    final results = await db.rawQuery(query, [codigoBusca.trim()]);
    await db.close();

    double parseDouble(dynamic val) {
      if (val == null) return 0.0;
      if (val is num) return val.toDouble();
      return double.tryParse(val.toString()) ?? 0.0;
    }

    // 3. Retorna o DataType mapeado com as classificações inclusas
    if (results.isNotEmpty) {
      final m = results.first;
      return ProdutoResultStruct(
        codigo: m['pro00_codigo']?.toString() ?? '',
        descricao: m['pro00_descri']?.toString() ?? '',
        unidade: m['pro00_unidad']?.toString() ?? '',
        preco: parseDouble(m['preco_venda']),
        saldoEstoque: parseDouble(m['saldo']),
        estoqueAtual: parseDouble(m['estoque_atual']),
        estoquePendente: parseDouble(m['estoque_pendente']),
        // Certifique-se de que estes campos existem no seu Data Type do FlutterFlow:
        linha: m['pro00_codlin']?.toString() ?? '',
        grupo: m['pro00_codgrp']?.toString() ?? '',
        fabricante: m['pro00_codfab']?.toString() ?? '',
        marca: m['pro00_codmar']?.toString() ?? '',
      );
    }

    print(
        'DIAGNOSTICO DETALHE: Nenhum produto localizado com o codigo: $codigoBusca');
    return null;
  } catch (e) {
    print('DIAGNOSTICO DETALHE: Erro fatal na busca de detalhes: ' +
        e.toString());
    return null;
  }
}
