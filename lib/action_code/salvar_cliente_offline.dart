// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

String _stripMask(String? value) {
  if (value == null) return '';
  return value.replaceAll(RegExp(r'[^0-9]'), '');
}

Future<ClienteResultStruct> salvarClienteOffline(
  String? nome,
  String? cpfCnpj,
  String? ie,
  String? rg,
  String? endereco,
  String? numero,
  String? bairro,
  String? cidade,
  String? uf,
  String? cep,
  String? telefone,
  String? email,
  String? tipoPessoa,
  String? codigoEditar,
) async {
  if (nome == null || nome.trim().isEmpty) {
    return ClienteResultStruct.fromMap({
      'success': false,
      'message': 'Razao Social e obrigatoria.',
      'codigo': '',
      'nome': '',
      'tipo': '',
      'cpfCnpj': '',
      'ie': '',
      'rg': '',
      'endereco': '',
      'numero': '',
      'bairro': '',
      'cidade': '',
      'uf': '',
      'cep': '',
      'telefone': '',
      'email': '',
    });
  }

  try {
    final db =
        await openDatabase(join(await getDatabasesPath(), 'dbforcacad001.db'));

    final cpfCnpjLimpo = _stripMask(cpfCnpj);
    final telefoneLimpo = _stripMask(telefone);
    final cepLimpo = _stripMask(cep);
    final pessoa = (tipoPessoa ?? 'F') == 'J' ? 'J' : 'F';
    final isEdit = codigoEditar != null && codigoEditar.trim().isNotEmpty;

    if (isEdit) {
      await db.rawUpdate(
        'UPDATE cadcli00 SET '
        'cli00_descri = ?, cli00_pessoa = ?, cli00_cpfcnp = ?, '
        'cli00_insest = ?, cli00_rg = ?, cli00_endere = ?, '
        'cli00_endnum = ?, cli00_bairro = ?, cli00_ciddes = ?, '
        'cli00_estsgl = ?, cli00_endcep = ?, cli00_fonnum = ?, '
        'cli00_observ = ? WHERE cli00_codigo = ?',
        [
          nome.trim(),
          pessoa,
          cpfCnpjLimpo,
          ie?.trim() ?? '',
          rg?.trim() ?? '',
          endereco?.trim() ?? '',
          numero?.trim() ?? '',
          bairro?.trim() ?? '',
          cidade?.trim() ?? '',
          uf?.trim() ?? '',
          cepLimpo,
          telefoneLimpo,
          email?.trim() ?? '',
          int.tryParse(codigoEditar.trim()) ?? 0,
        ],
      );

      await db.close();
      return ClienteResultStruct.fromMap({
        'success': true,
        'message': 'Cliente atualizado com sucesso.',
        'codigo': codigoEditar.trim(),
        'nome': nome.trim(),
        'tipo': pessoa,
        'cpfCnpj': cpfCnpjLimpo,
        'ie': ie?.trim() ?? '',
        'rg': rg?.trim() ?? '',
        'endereco': endereco?.trim() ?? '',
        'numero': numero?.trim() ?? '',
        'bairro': bairro?.trim() ?? '',
        'cidade': cidade?.trim() ?? '',
        'uf': uf?.trim() ?? '',
        'cep': cepLimpo,
        'telefone': telefoneLimpo,
        'email': email?.trim() ?? '',
      });
    } else {
      final nextResult = await db.rawQuery(
        'SELECT IFNULL(MAX(cli00_codigo), 0) + 1 AS next FROM cadcli00',
      );
      final nextCode = (nextResult.first['next'] as int?) ?? 1;

      await db.rawInsert(
        'INSERT INTO cadcli00 (cli00_codigo, cli00_descri, cli00_pessoa, cli00_cpfcnp, '
        'cli00_insest, cli00_rg, cli00_endere, cli00_endnum, '
        'cli00_bairro, cli00_ciddes, cli00_estsgl, cli00_endcep, '
        "cli00_fonnum, cli00_observ, cli00_active, cli00_datcad, cli00_crelim, cli00_creatu) "
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1, datetime('now'), 0, 0)",
        [
          nextCode,
          nome.trim(),
          pessoa,
          cpfCnpjLimpo,
          ie?.trim() ?? '',
          rg?.trim() ?? '',
          endereco?.trim() ?? '',
          numero?.trim() ?? '',
          bairro?.trim() ?? '',
          cidade?.trim() ?? '',
          uf?.trim() ?? '',
          cepLimpo,
          telefoneLimpo,
          email?.trim() ?? '',
        ],
      );

      await db.close();
      return ClienteResultStruct.fromMap({
        'success': true,
        'message': 'Cliente cadastrado com sucesso.',
        'codigo': nextCode.toString(),
        'nome': nome.trim(),
        'tipo': pessoa,
        'cpfCnpj': cpfCnpjLimpo,
        'ie': ie?.trim() ?? '',
        'rg': rg?.trim() ?? '',
        'endereco': endereco?.trim() ?? '',
        'numero': numero?.trim() ?? '',
        'bairro': bairro?.trim() ?? '',
        'cidade': cidade?.trim() ?? '',
        'uf': uf?.trim() ?? '',
        'cep': cepLimpo,
        'telefone': telefoneLimpo,
        'email': email?.trim() ?? '',
      });
    }
  } catch (err) {
    print('Erro SalvarClienteOffline: ' + err.toString());
    return ClienteResultStruct.fromMap({
      'success': false,
      'message': 'Erro ao salvar: ' + err.toString(),
      'codigo': '',
      'nome': '',
      'tipo': '',
      'cpfCnpj': '',
      'ie': '',
      'rg': '',
      'endereco': '',
      'numero': '',
      'bairro': '',
      'cidade': '',
      'uf': '',
      'cep': '',
      'telefone': '',
      'email': '',
    });
  }
}
