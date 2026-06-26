// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
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
