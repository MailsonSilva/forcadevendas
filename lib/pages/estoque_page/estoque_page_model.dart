import '/flutter_flow/flutter_flow_util.dart';
import 'estoque_page_widget.dart' show EstoquePageWidget;
import 'package:flutter/material.dart';

class EstoquePageModel extends FlutterFlowModel<EstoquePageWidget> {
  ///  Local state fields for this page.

  String? resultadosJson = '[]';

  ///  State fields for stateful widgets in this page.

  // State field(s) for BuscaProdutoField widget.
  FocusNode? buscaProdutoFieldFocusNode;
  TextEditingController? buscaProdutoFieldTextController;
  String? Function(BuildContext, String?)?
      buscaProdutoFieldTextControllerValidator;
  // Stores action output result for [Custom Action - PesquisaProduto] action in BuscaProdutoField widget.
  String? resultadosBusca;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    buscaProdutoFieldFocusNode?.dispose();
    buscaProdutoFieldTextController?.dispose();
  }
}
