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
  String? filtro,
  int? offset,
  String? filtroLinha,
  String? filtroGrupo,
  String? filtroFabricante,
  String? filtroMarca,
  bool? apenasEstoque,
  bool? apenasPromocao,
  int? codFilial,
) async {
  try {
    final db =
        await openDatabase(join(await getDatabasesPath(), 'dbforcacad001.db'));

    // Tratamento preventivo de nulos para evitar falhas na interface do FlutterFlow
    final String busca = filtro ?? '';
    final int currentOffset = offset ?? 0;
    final String linha = filtroLinha ?? '';
    final String grupo = filtroGrupo ?? '';
    final String fab = filtroFabricante ?? '';
    final String marca = filtroMarca ?? '';
    final bool estoqueOpt = apenasEstoque ?? false;

    // Garante filial 1 caso venha zerada ou nula da sessão inicial
    final int filial = (codFilial == null || codFilial == 0) ? 1 : codFilial;

    List<String> condicoes = [];
    List<dynamic> whereBinds = [];

    // 1. Filtro de Busca Textual (Nome/Código)
    if (busca.trim().isNotEmpty) {
      final termo = '%${busca.toUpperCase()}%';
      condicoes.add(
          '(UPPER(p.pro00_codigo) LIKE ? OR UPPER(p.pro00_descri) LIKE ?)');
      whereBinds.addAll([termo, termo]);
    }

    // 2. Filtros Avançados de Categorias
    if (linha.isNotEmpty) {
      condicoes.add('p.pro00_codlin = ?');
      whereBinds.add(int.parse(linha));
    }
    if (grupo.isNotEmpty) {
      condicoes.add('p.pro00_codgrp = ?');
      whereBinds.add(int.parse(grupo));
    }
    if (fab.isNotEmpty) {
      condicoes.add('p.pro00_codfab = ?');
      whereBinds.add(int.parse(fab));
    }
    if (marca.isNotEmpty) {
      condicoes.add('p.pro00_codmar = ?');
      whereBinds.add(int.parse(marca));
    }

    // 3. Filtros Lógicos de Saldo
    if (estoqueOpt) {
      condicoes.add(
          '(COALESCE(e.pro00_qtdest, 0) - COALESCE(e.pro00_qtdpen, 0)) > 0');
    }

    String whereClause =
        condicoes.isNotEmpty ? 'WHERE ' + condicoes.join(' AND ') : '';

    // CORREÇÃO DA ORDEM DOS BINDS:
    // 1º: Código da Filial (usado na cláusula do LEFT JOIN)
    // 2º: Argumentos das condições dinâmicas (WHERE)
    // 3º: O valor do Offset (usado no fim da query)
    List<dynamic> finalBinds = [filial, ...whereBinds, currentOffset];

    final String query = '''
      SELECT DISTINCT p.pro00_codigo, p.pro00_descri, p.pro00_unidad,
             COALESCE(t.pro00_pcosub, 0) AS preco_venda,
             (COALESCE(e.pro00_qtdest, 0) - COALESCE(e.pro00_qtdpen, 0)) AS saldo
      FROM cadpro00 p
      LEFT JOIN estpcopro00 t ON t.pro00_codpro = p.pro00_codigo
      LEFT JOIN estpro00 e ON e.pro00_codpro = p.pro00_codigo AND e.pro00_codfil = ?
      $whereClause
      ORDER BY p.pro00_descri
      LIMIT 100 OFFSET ?
    ''';

    final results = await db.rawQuery(query, finalBinds);
    await db.close();

    return results
        .map((m) => ProdutoResultStruct(
              codigo: m['pro00_codigo'].toString(),
              descricao: m['pro00_descri'].toString(),
              unidade: m['pro00_unidad']?.toString() ?? '',
              preco: (m['preco_venda'] as num).toDouble(),
              saldoEstoque: (m['saldo'] as num).toDouble(),
            ))
        .toList();
  } catch (e) {
    print('Erro fatal na busca do SQLite: $e');
    return [];
  }
}
