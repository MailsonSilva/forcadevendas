// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

Future<ClienteResultStruct> carregarClienteOffline(String clienteCodigo) async {
  try {
    final databasesPath = await getDatabasesPath();
    final db = await openDatabase(
      p.join(databasesPath, 'dbforcacad001.db'),
      readOnly: true,
    );
    final rows = await db.rawQuery(
      'SELECT cli00_codigo, cli00_nome, cli00_cpfcnpj, cli00_ie, cli00_rg, cli00_email, cli00_endere, cli00_numero, cli00_bairro, cli00_cidade, cli00_uf, cli00_cep, cli00_telefo, cli00_tipo FROM cadcli00 WHERE cli00_codigo = ?',
      [clienteCodigo],
    );
    await db.close();

    if (rows.isEmpty) {
      return ClienteResultStruct(
        success: false,
        message: 'Cliente nao encontrado localmente.',
      );
    }

    final row = rows.first;
    return ClienteResultStruct(
      success: true,
      message: '',
      codigo: row['cli00_codigo']?.toString() ?? '',
      nome: row['cli00_nome']?.toString() ?? '',
      cpfCnpj: row['cli00_cpfcnpj']?.toString() ?? '',
      ie: row['cli00_ie']?.toString() ?? '',
      rg: row['cli00_rg']?.toString() ?? '',
      email: row['cli00_email']?.toString() ?? '',
      endereco: row['cli00_endere']?.toString() ?? '',
      numero: row['cli00_numero']?.toString() ?? '',
      bairro: row['cli00_bairro']?.toString() ?? '',
      cidade: row['cli00_cidade']?.toString() ?? '',
      uf: row['cli00_uf']?.toString() ?? '',
      cep: row['cli00_cep']?.toString() ?? '',
      telefone: row['cli00_telefo']?.toString() ?? '',
      tipo: row['cli00_tipo']?.toString() ?? 'F',
    );
  } catch (e) {
    return ClienteResultStruct(
      success: false,
      message: 'Erro ao carregar cliente: $e',
    );
  }
}
