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

Future<List<ProdutoResultStruct>> buscaProduto(
  String filtro,
  int offset,
) async {
  try {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'dbforcacad001.db');
    final Database db = await openDatabase(path, readOnly: true);

    String whereClause = '';
    List<dynamic> whereArgs = [];

    if (filtro.trim().isNotEmpty) {
      final filtroLike = '%${filtro.toUpperCase()}%';
      whereClause =
          'WHERE UPPER(pro00_codigo) LIKE ? OR UPPER(pro00_descri) LIKE ?';
      whereArgs = [filtroLike, filtroLike];
    }

    final String query = '''
      SELECT pro00_codigo, pro00_descri, pro00_unidpri, pro00_pcosub, 
      (COALESCE(pro00_qtdest, 0) - COALESCE(pro00_qtdpen, 0)) AS saldo_disponivel, 
      COALESCE(pro00_pcofab, 0) AS preco_custo 
      FROM pro00 
      $whereClause
      ORDER BY pro00_descri 
      LIMIT 100 OFFSET ?
    ''';

    whereArgs.add(offset);

    final List<Map<String, dynamic>> maps = await db.rawQuery(query, whereArgs);
    await db.close();

    // Converte direto para o seu DataType ProdutoResultStruct
    final results = maps
        .map((m) => ProdutoResultStruct(
              codigo: m['pro00_codigo']?.toString() ?? '',
              descricao: m['pro00_descri']?.toString() ?? '',
              unidade: m['pro00_unidpri']?.toString() ?? '',
              preco: (m['pro00_pcosub'] as num?)?.toDouble() ?? 0.0,
              saldoEstoque: (m['saldo_disponivel'] as num?)?.toDouble() ?? 0.0,
              precoCusto: (m['preco_custo'] as num?)?.toDouble() ?? 0.0,
            ))
        .toList();

    return results;
  } catch (e) {
    print('Erro ao pesquisar produto: $e');
    return []; // Retorna lista vazia em caso de erro
  }
}
