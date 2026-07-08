// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<List<ClienteResultStruct>> pesquisaCliente(
  String? filtro,
  int? offset,
) async {
  try {
    final db =
        await openDatabase(join(await getDatabasesPath(), 'dbforcacad001.db'));
    final String busca = filtro?.trim() ?? '';
    final int currentOffset = offset ?? 0;
    String whereClause = '';
    List<dynamic> binds = [];
    if (busca.isNotEmpty) {
      final String termo = '%' + busca.toUpperCase() + '%';
      whereClause =
          'WHERE UPPER(cli00_descri) LIKE ? OR UPPER(cli00_fantas) LIKE ?';
      binds = [termo, termo];
    } else {
      whereClause = 'WHERE cli00_active = 1';
    }
    final String query = 'SELECT CAST(cli00_codigo AS TEXT) AS codigo, '
            'TRIM(cli00_descri) AS nome, '
            'TRIM(COALESCE(cli00_fantas, \'\')) AS tipo, '
            'TRIM(COALESCE(cli00_cpfcnp, \'\')) AS cpfCnpj, '
            'TRIM(COALESCE(cli00_insest, \'\')) AS ie, '
            'TRIM(COALESCE(cli00_rg, \'\')) AS rg, '
            'TRIM(COALESCE(cli00_endere, \'\')) AS endereco, '
            'TRIM(COALESCE(cli00_endnum, \'\')) AS numero, '
            'TRIM(COALESCE(cli00_bairro, \'\')) AS bairro, '
            'TRIM(COALESCE(cli00_ciddes, \'\')) AS cidade, '
            'TRIM(COALESCE(cli00_estsgl, \'\')) AS uf, '
            'TRIM(COALESCE(cli00_endcep, \'\')) AS cep, '
            'TRIM(COALESCE(cli00_fonnum, \'\')) AS telefone, '
            'TRIM(COALESCE(cli00_observ, \'\')) AS email '
            'FROM cadcli00 ' +
        whereClause +
        ' ORDER BY cli00_descri LIMIT 50 OFFSET ?';
    binds.add(currentOffset);
    final results = await db.rawQuery(query, binds);
    await db.close();
    return results
        .map((m) => ClienteResultStruct.fromMap({
              'codigo': m['codigo']?.toString() ?? '',
              'nome': m['nome']?.toString() ?? '',
              'tipo': m['tipo']?.toString() ?? '',
              'cpfCnpj': m['cpfCnpj']?.toString() ?? '',
              'ie': m['ie']?.toString() ?? '',
              'rg': m['rg']?.toString() ?? '',
              'endereco': m['endereco']?.toString() ?? '',
              'numero': m['numero']?.toString() ?? '',
              'bairro': m['bairro']?.toString() ?? '',
              'cidade': m['cidade']?.toString() ?? '',
              'uf': m['uf']?.toString() ?? '',
              'cep': m['cep']?.toString() ?? '',
              'telefone': m['telefone']?.toString() ?? '',
              'email': m['email']?.toString() ?? '',
              'message': '',
              'success': true,
            }))
        .toList();
  } catch (e) {
    print('Erro PesquisaCliente: ' + e.toString());
    return [];
  }
}
