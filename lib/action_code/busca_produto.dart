// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<List<ProdutoResultStruct>> buscaProduto(
  String filtro,
  int offset,
) async {
  try {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'dbforcacad001.db');
    final Database db = await openDatabase(path, readOnly: true);

    String whereClause = '';
    List<dynamic> whereArgs = [];

    if (filtro.trim().isNotEmpty) {
      final filtroLike = '%${filtro.toUpperCase()}%';
      // Ajustado para os campos corretos da cadpro00
      whereClause =
          'WHERE UPPER(pro00_codigo) LIKE ? OR UPPER(pro00_descri) LIKE ?';
      whereArgs = [filtroLike, filtroLike];
    }

    // Query atualizada: Tabela cadpro00 e valores zerados provisórios para preço/estoque
    final String query = '''
      SELECT 
        pro00_codigo, 
        pro00_descri, 
        pro00_unidad, 
        0 AS preco_venda, 
        0 AS saldo_disponivel, 
        0 AS preco_custo 
      FROM cadpro00 
      $whereClause
      ORDER BY pro00_descri 
      LIMIT 100 OFFSET ?
    ''';

    whereArgs.add(offset);

    final List<Map<String, dynamic>> maps = await db.rawQuery(query, whereArgs);
    await db.close();

    // Converte os resultados para o DataType da sua tela
    final results = maps
        .map((m) => ProdutoResultStruct(
              codigo: m['pro00_codigo']?.toString() ?? '',
              descricao: m['pro00_descri']?.toString() ?? '',
              unidade: m['pro00_unidad']?.toString() ?? '',
              preco: (m['preco_venda'] as num?)?.toDouble() ?? 0.0,
              saldoEstoque: (m['saldo_disponivel'] as num?)?.toDouble() ?? 0.0,
              precoCusto: (m['preco_custo'] as num?)?.toDouble() ?? 0.0,
            ))
        .toList();

    return results;
  } catch (e) {
    print('Erro ao pesquisar produto: $e');
    return [];
  }
}
