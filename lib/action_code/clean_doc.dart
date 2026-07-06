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

Future<String> cleanDoc(String input) async {
  return (input ?? '').replaceAll(RegExp(r'\D'), '');
}
