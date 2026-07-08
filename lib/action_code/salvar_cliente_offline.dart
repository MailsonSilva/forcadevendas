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
  String? codigoEditar, [
  String? fantas,
  double? limiteCredito,
  String? observacoes,
]) async {
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

    final columnsResult = await db.rawQuery('PRAGMA table_info(cadcli00)');
    final columnNames = columnsResult.map((c) => c['name'] as String).toList();
    final cpfCnpjLimpo = _stripMask(cpfCnpj);
    final telefoneLimpo = _stripMask(telefone);
    final cepLimpo = _stripMask(cep);
    final pessoa = (tipoPessoa ?? 'F') == 'J' ? 'J' : 'F';
    final isEdit = codigoEditar != null && codigoEditar.trim().isNotEmpty;

    final Map<String, dynamic> rowData = {};
    if (columnNames.contains('cli00_descri'))
      rowData['cli00_descri'] = nome.trim();
    if (columnNames.contains('cli00_fantas'))
      rowData['cli00_fantas'] = (fantas ?? '').trim();
    if (columnNames.contains('cli00_pessoa')) rowData['cli00_pessoa'] = pessoa;
    if (columnNames.contains('cli00_cpfcnp'))
      rowData['cli00_cpfcnp'] = cpfCnpjLimpo;
    if (columnNames.contains('cli00_insest'))
      rowData['cli00_insest'] = ie?.trim() ?? '';
    if (columnNames.contains('cli00_rg'))
      rowData['cli00_rg'] = rg?.trim() ?? '';
    if (columnNames.contains('cli00_endere'))
      rowData['cli00_endere'] = endereco?.trim() ?? '';
    if (columnNames.contains('cli00_endnum'))
      rowData['cli00_endnum'] = numero?.trim() ?? '';
    if (columnNames.contains('cli00_bairro'))
      rowData['cli00_bairro'] = bairro?.trim() ?? '';
    if (columnNames.contains('cli00_ciddes'))
      rowData['cli00_ciddes'] = cidade?.trim() ?? '';
    if (columnNames.contains('cli00_estsgl'))
      rowData['cli00_estsgl'] = uf?.trim() ?? '';
    if (columnNames.contains('cli00_endcep'))
      rowData['cli00_endcep'] = cepLimpo;
    if (columnNames.contains('cli00_fonnum'))
      rowData['cli00_fonnum'] = telefoneLimpo;
    if (columnNames.contains('cli00_crelim'))
      rowData['cli00_crelim'] = limiteCredito ?? 0.0;
    if (columnNames.contains('cli00_email'))
      rowData['cli00_email'] = email?.trim() ?? '';

    // Observações mapping
    if (columnNames.contains('cli00_observ')) {
      rowData['cli00_observ'] = (observacoes ?? '').trim().isNotEmpty
          ? observacoes!.trim()
          : (email?.trim() ?? '');
    }

    if (isEdit) {
      final query =
          'UPDATE cadcli00 SET cli00_descri = ?, cli00_fantas = ?, cli00_cpfcnp = ?, cli00_endere = ?, cli00_bairro = ?, cli00_ciddes = ?, cli00_estsgl = ?, cli00_observ = ? WHERE cli00_codigo = ?';
      final binds = [
        nome.trim(),
        (fantas ?? '').trim(),
        cpfCnpjLimpo,
        endereco?.trim() ?? '',
        bairro?.trim() ?? '',
        cidade?.trim() ?? '',
        uf?.trim() ?? '',
        (observacoes ?? '').trim(),
        int.tryParse(codigoEditar.trim()) ?? 0
      ];
      await db.rawUpdate(query, binds);
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

      rowData['cli00_codigo'] = nextCode;
      if (columnNames.contains('cli00_active')) rowData['cli00_active'] = 1;
      if (columnNames.contains('cli00_datcad')) {
        rowData['cli00_datcad'] = DateTime.now().toIso8601String();
      }

      final columns = rowData.keys.join(', ');
      final placeholders = List.filled(rowData.length, '?').join(', ');
      await db.rawInsert(
        'INSERT INTO cadcli00 ($columns) VALUES ($placeholders)',
        rowData.values.toList(),
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
