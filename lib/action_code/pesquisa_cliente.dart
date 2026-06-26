// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import 'dart:convert';

Future<String> pesquisaCliente(String filtro) async {
  try {
    final databasesPath = await getDatabasesPath();
    final db = await openDatabase(p.join(databasesPath, 'dbforcacad001.db'),
        readOnly: true);
    final query = filtro.trim();

    List<Map<String, dynamic>> rows;
    if (query.isEmpty) {
      rows = await db.rawQuery(
          'SELECT cli00_codigo, cli00_nome, cli00_cpfcnpj, cli00_cidade, cli00_uf FROM cadcli00 LIMIT 50');
    } else {
      rows = await db.rawQuery(
        'SELECT cli00_codigo, cli00_nome, cli00_cpfcnpj, cli00_cidade, cli00_uf FROM cadcli00 WHERE cli00_nome LIKE ? OR cli00_codigo LIKE ? OR cli00_cpfcnpj LIKE ? LIMIT 50',
        ['%$query%', '%$query%', '%$query%'],
      );
    }
    await db.close();

    final mapped = rows
        .map((row) => {
              'codigo': row['cli00_codigo']?.toString() ?? '',
              'nome': row['cli00_nome']?.toString() ?? '',
              'cpfCnpj': row['cli00_cpfcnpj']?.toString() ?? '',
              'cidade': row['cli00_cidade']?.toString() ?? '',
              'uf': row['cli00_uf']?.toString() ?? '',
            })
        .toList();

    return jsonEncode(mapped);
  } catch (e) {
    return '[]';
  }
}
