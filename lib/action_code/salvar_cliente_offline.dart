// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

Future<bool> salvarClienteOffline(
  String? codigo,
  String? nome,
  String? cpfCnpj,
  String? ie,
  String? rg,
  String? email,
  String? endereco,
  String? numero,
  String? bairro,
  String? cidade,
  String? uf,
  String? cep,
  String? telefone,
  String? tipo,
) async {
  try {
    final cleanNome = nome?.trim() ?? '';
    final cleanCpfCnpj = (cpfCnpj ?? '').replaceAll(RegExp(r'\D'), '');
    final cleanIe = (ie ?? '').replaceAll(RegExp(r'\D'), '');
    final cleanRg = (rg ?? '').replaceAll(RegExp(r'\D'), '');
    final cleanEmail = email?.trim() ?? '';
    final cleanEndereco = endereco?.trim() ?? '';
    final cleanNumero = numero?.trim() ?? '';
    final cleanBairro = bairro?.trim() ?? '';
    final cleanCidade = cidade?.trim() ?? '';
    final cleanUf = uf?.trim() ?? 'SP';
    final cleanCep = (cep ?? '').replaceAll(RegExp(r'\D'), '');
    final cleanTelefone = (telefone ?? '').replaceAll(RegExp(r'\D'), '');
    final cleanTipo = tipo?.trim() ?? 'F';

    if (cleanNome.isEmpty) return false;

    final databasesPath = await getDatabasesPath();
    final db = await openDatabase(
      p.join(databasesPath, 'dbforcacad001.db'),
    );

    if (codigo != null && codigo.trim().isNotEmpty) {
      // EDIT: Update existing client
      await db.rawUpdate(
        'UPDATE cadcli00 SET cli00_nome = ?, cli00_cpfcnpj = ?, cli00_ie = ?, cli00_rg = ?, cli00_email = ?, cli00_endere = ?, cli00_numero = ?, cli00_bairro = ?, cli00_cidade = ?, cli00_uf = ?, cli00_cep = ?, cli00_telefo = ?, cli00_tipo = ? WHERE cli00_codigo = ?',
        [
          cleanNome,
          cleanCpfCnpj,
          cleanIe,
          cleanRg,
          cleanEmail,
          cleanEndereco,
          cleanNumero,
          cleanBairro,
          cleanCidade,
          cleanUf,
          cleanCep,
          cleanTelefone,
          cleanTipo,
          codigo
        ],
      );
    } else {
      // INSERT: Create new client
      final rows = await db.rawQuery(
          'SELECT MAX(CAST(cli00_codigo AS INTEGER)) as max_code FROM cadcli00');
      int nextCode = 1;
      if (rows.isNotEmpty && rows.first['max_code'] != null) {
        nextCode = (rows.first['max_code'] as int) + 1;
      }
      final newCodigo = nextCode.toString();

      await db.rawInsert(
        'INSERT INTO cadcli00 (cli00_codigo, cli00_nome, cli00_cpfcnpj, cli00_ie, cli00_rg, cli00_email, cli00_endere, cli00_numero, cli00_bairro, cli00_cidade, cli00_uf, cli00_cep, cli00_telefo, cli00_tipo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [
          newCodigo,
          cleanNome,
          cleanCpfCnpj,
          cleanIe,
          cleanRg,
          cleanEmail,
          cleanEndereco,
          cleanNumero,
          cleanBairro,
          cleanCidade,
          cleanUf,
          cleanCep,
          cleanTelefone,
          cleanTipo
        ],
      );
    }

    await db.close();
    return true;
  } catch (e) {
    print('Erro ao salvar cliente offline: $e');
    return false;
  }
}
