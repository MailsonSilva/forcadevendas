// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/material.dart';
import '/pages/produtos/busca_produto_page/busca_produto_page_model.dart';
import '/custom_code/actions/busca_produto.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/flutter_flow_util.dart';

Future filtrarProdutos(BuildContext context) async {
  dynamic m;
  (context as Element).visitAncestorElements((element) {
    if (element.runtimeType.toString().contains('BuscaProdutoPage')) {
      if (element is StatefulElement) {
        m = (element.state as dynamic)._model;
        return false;
      }
    }
    return true;
  });
  if (m == null) return;

  m.filtroLinha = m.dropDownModel.dropDownValue ?? '';
  m.filtroGrupo = m.filtroGrupoModel.dropDownValue ?? '';
  m.filtroFabricante = m.filtroFabricanteModel.dropDownValue ?? '';
  m.filtroMarca = m.filtroMarcaModel.dropDownValue ?? '';

  final resultado = await buscaProduto(
    m.buscaProdutoFieldTextController?.text ?? '',
    0,
    m.filtroLinha,
    m.filtroGrupo,
    m.filtroFabricante,
    m.filtroMarca,
    m.filtroEstoque,
    m.filtroPromocao,
    functions.resolverCodFilial(FFAppState().empresa_codigo),
    m.filtroDataEntrada,
  );

  m.listaProdutos = resultado;
  (context as Element).markNeedsBuild();
}
