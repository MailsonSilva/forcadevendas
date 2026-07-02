// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<ClienteResultStruct> carregarClienteOffline(String? codigo) async {
  if (codigo == null || codigo.trim().isEmpty) {
    return ClienteResultStruct.fromMap({
      'success': false,
      'message': 'Codigo invalido.',
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
    final results = await db.rawQuery(
      'SELECT * FROM cadcli00 WHERE cli00_codigo = ?',
      [int.tryParse(codigo.trim()) ?? 0],
    );

    if (results.isEmpty) {
      await db.close();
      return ClienteResultStruct.fromMap({
        'success': false,
        'message': 'Cliente nao encontrado.',
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

    final row = results.first;
    await db.close();
    return ClienteResultStruct.fromMap({
      'success': true,
      'message': 'Cliente carregado com sucesso.',
      'codigo': row['cli00_codigo'].toString(),
      'nome': row['cli00_descri']?.toString() ?? '',
      'tipo': row['cli00_pessoa']?.toString() ?? 'F',
      'cpfCnpj': row['cli00_cpfcnp']?.toString() ?? '',
      'ie': row['cli00_insest']?.toString() ?? '',
      'rg': row['cli00_rg']?.toString() ?? '',
      'endereco': row['cli00_endere']?.toString() ?? '',
      'numero': row['cli00_endnum']?.toString() ?? '',
      'bairro': row['cli00_bairro']?.toString() ?? '',
      'cidade': row['cli00_ciddes']?.toString() ?? '',
      'uf': row['cli00_estsgl']?.toString() ?? '',
      'cep': row['cli00_endcep']?.toString() ?? '',
      'telefone': row['cli00_fonnum']?.toString() ?? '',
      'email': row['cli00_observ']?.toString() ?? '',
    });
  } catch (err) {
    print('Erro CarregarClienteOffline: ' + err.toString());
    return ClienteResultStruct.fromMap({
      'success': false,
      'message': 'Erro ao carregar: ' + err.toString(),
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
