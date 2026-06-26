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

// Adicione estes argumentos na sua Action:
// filtro (String), offset (int), linha (String), grupo (String),
// fabricante (String), marca (String), apenasEstoque (bool), apenasPromocao (bool)

Future<List<ProdutoResultStruct>> buscaProduto(
  String filtro,
  int offset,
  String filtroLinha,
  String filtroGrupo,
  String filtroFabricante,
  String filtroMarca,
  bool apenasEstoque,
  bool apenasPromocao,
  int codFilial,
) async {
  try {
    final db =
        await openDatabase(join(await getDatabasesPath(), 'dbforcacad001.db'));

    List<String> condicoes = [];
    List<dynamic> binds = [];

    // 1. Filtro de Busca (Nome/Código)
    if (filtro.trim().isNotEmpty) {
      final termo = '%${filtro.toUpperCase()}%';
      condicoes.add(
          '(UPPER(p.pro00_codigo) LIKE ? OR UPPER(p.pro00_descri) LIKE ?)');
      binds.addAll([termo, termo]);
    }

    // 2. Filtros Selecionados na Tela
    if (filtroLinha.isNotEmpty) {
      condicoes.add('p.pro00_codlin = ?');
      binds.add(int.parse(filtroLinha));
    }
    if (filtroGrupo.isNotEmpty) {
      condicoes.add('p.pro00_codgrp = ?');
      binds.add(int.parse(filtroGrupo));
    }
    if (filtroFabricante.isNotEmpty) {
      condicoes.add('p.pro00_codfab = ?');
      binds.add(int.parse(filtroFabricante));
    }
    if (filtroMarca.isNotEmpty) {
      condicoes.add('p.pro00_codmar = ?');
      binds.add(int.parse(filtroMarca));
    }

    // 3. Filtros Lógicos (Estoque e Promoção)
    if (apenasEstoque) {
      condicoes.add(
          '(COALESCE(e.pro00_qtdest, 0) - COALESCE(e.pro00_qtdpen, 0)) > 0');
    }

    // Filtro de Filial para o Estoque
    String estoqueJoin =
        "LEFT JOIN estpro00 e ON e.pro00_codpro = p.pro00_codigo AND e.pro00_codfil = ?";
    binds.add(codFilial);

    String whereClause =
        condicoes.isNotEmpty ? 'WHERE ' + condicoes.join(' AND ') : '';

    final String query = '''
      SELECT DISTINCT p.pro00_codigo, p.pro00_descri, p.pro00_unidad,
             COALESCE(t.pro00_pcosub, 0) AS preco_venda,
             (COALESCE(e.pro00_qtdest, 0) - COALESCE(e.pro00_qtdpen, 0)) AS saldo
      FROM cadpro00 p
      LEFT JOIN estpcopro00 t ON t.pro00_codpro = p.pro00_codigo
      $estoqueJoin
      $whereClause
      ORDER BY p.pro00_descri
      LIMIT 100 OFFSET ?
    ''';

    binds.add(offset);
    final results = await db.rawQuery(query, binds);
    await db.close();

    return results
        .map((m) => ProdutoResultStruct(
              codigo: m['pro00_codigo'].toString(),
              descricao: m['pro00_descri'].toString(),
              preco: (m['preco_venda'] as num).toDouble(),
              saldoEstoque: (m['saldo'] as num).toDouble(),
            ))
        .toList();
  } catch (e) {
    return [];
  }
}
