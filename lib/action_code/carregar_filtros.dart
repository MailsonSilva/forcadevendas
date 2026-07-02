// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports necessários
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<List<ListaPadraoStruct>> carregarFiltros(String tabela) async {
  try {
    final db =
        await openDatabase(join(await getDatabasesPath(), 'dbforcacad001.db'));

    String colCodigo = tabela.contains('lin')
        ? 'lin00_codigo'
        : tabela.contains('gru')
            ? 'gru00_codigo'
            : tabela.contains('for')
                ? 'for00_codigo'
                : 'mar00_codigo';

    String colDescri = tabela.contains('lin')
        ? 'lin00_descri'
        : tabela.contains('gru')
            ? 'gru00_descri'
            : tabela.contains('for')
                ? 'for00_descri'
                : 'mar00_descri';

    final List<Map<String, dynamic>> maps = await db.rawQuery(
        'SELECT $colCodigo, $colDescri FROM $tabela ORDER BY $colDescri');
    await db.close();

    return maps.map((m) {
      final codigo = m[colCodigo].toString();
      final descri = m[colDescri].toString();

      // MANTENHA AQUI OS NOMES EXATOS QUE ESTÃO NO SEU DATA TYPE
      return ListaPadraoStruct(
        descricao: '$codigo - $descri',
        codigo: codigo,
      );
    }).toList();
  } catch (e) {
    return [];
  }
}
