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

import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

Future<LoginResultStruct> offlineLogin(String vendedorCodigo) async {
  try {
    final codigo = int.tryParse(vendedorCodigo.trim());
    if (codigo == null) {
      return LoginResultStruct.fromMap({
        'success': false,
        'vendedor_codigo': 0,
        'vendedor_nome': '',
      });
    }

    final databasesPath = await getDatabasesPath();
    final db = await openDatabase(
      p.join(databasesPath, 'dbforcacad001.db'),
      readOnly: true,
    );
    final rows = await db.rawQuery(
      'SELECT ven00_codigo, ven00_descri FROM cadrep00 WHERE ven00_codigo = ?',
      [codigo],
    );
    await db.close();

    if (rows.isEmpty) {
      return LoginResultStruct.fromMap({
        'success': false,
        'vendedor_codigo': 0,
        'vendedor_nome': '',
      });
    }

    final row = rows.first;
    return LoginResultStruct.fromMap({
      'success': true,
      'vendedor_codigo': (row['ven00_codigo'] as num?)?.toInt() ?? codigo,
      'vendedor_nome': row['ven00_descri']?.toString() ?? '',
    });
  } catch (e) {
    return LoginResultStruct.fromMap({
      'success': false,
      'vendedor_codigo': 0,
      'vendedor_nome': '',
    });
  }
}
