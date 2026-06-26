// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<String> pesquisaProduto(String filtro) async {
  try {
    if (filtro.trim().isEmpty) return '[]';
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'dbforcacad001.db');
    final Database db = await openDatabase(path, readOnly: true);
    final filtroLike = '%${filtro.toUpperCase()}%';
    final List<Map<String, dynamic>> maps = await db.rawQuery(
      'SELECT pro00_codigo, pro00_descri, pro00_unidpri, pro00_pcosub, '
      '(COALESCE(pro00_qtdest, 0) - COALESCE(pro00_qtdpen, 0)) AS saldo_disponivel, '
      'COALESCE(pro00_pcofab, 0) AS preco_custo '
      'FROM pro00 WHERE UPPER(pro00_codigo) LIKE ? OR UPPER(pro00_descri) LIKE ? '
      'ORDER BY pro00_descri LIMIT 100',
      [filtroLike, filtroLike],
    );
    await db.close();
    final results = maps
        .map((m) => {
              'codigo': m['pro00_codigo']?.toString() ?? '',
              'descricao': m['pro00_descri']?.toString() ?? '',
              'unidade': m['pro00_unidpri']?.toString() ?? '',
              'preco': (m['pro00_pcosub'] as num?)?.toDouble() ?? 0.0,
              'saldo_estoque':
                  (m['saldo_disponivel'] as num?)?.toDouble() ?? 0.0,
              'preco_custo': (m['preco_custo'] as num?)?.toDouble() ?? 0.0,
            })
        .toList();
    return jsonEncode(results);
  } catch (e) {
    print('Erro ao pesquisar produto: $e');
    return '[]';
  }
}
