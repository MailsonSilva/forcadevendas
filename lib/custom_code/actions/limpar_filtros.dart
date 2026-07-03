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

Future limparFiltros(BuildContext context) async {
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

  m.dropDownModel.dropDownValueController?.value = null;
  m.dropDownModel.dropDownValue = null;

  m.filtroGrupoModel.dropDownValueController?.value = null;
  m.filtroGrupoModel.dropDownValue = null;

  m.filtroFabricanteModel.dropDownValueController?.value = null;
  m.filtroFabricanteModel.dropDownValue = null;

  m.filtroMarcaModel.dropDownValueController?.value = null;
  m.filtroMarcaModel.dropDownValue = null;

  m.filtroLinha = '';
  m.filtroGrupo = '';
  m.filtroFabricante = '';
  m.filtroMarca = '';
  m.filtroDataEntrada = 'Todas';
  m.filtroEstoque = false;
  m.filtroPromocao = false;

  final resultado = await buscaProduto(
    m.buscaProdutoFieldTextController?.text ?? '',
    0,
    '',
    '',
    '',
    '',
    false,
    false,
    functions.resolverCodFilial(FFAppState().empresa_codigo),
    'Todas',
  );

  m.listaProdutos = resultado;
  (context as Element).markNeedsBuild();
}
