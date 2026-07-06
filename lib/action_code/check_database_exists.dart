// Automatic FlutterFlow imports
<<<<<<< HEAD
// Imports other custom actions
// Imports custom functions
=======
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

Future<bool> checkDatabaseExists() async {
  final databasesPath = await getDatabasesPath();
  final path = p.join(databasesPath, 'dbforcacad001.db');
  return await File(path).exists();
}
