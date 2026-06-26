import '/flutter_flow/flutter_flow_util.dart';
import 'produto_selector_widget.dart' show ProdutoSelectorWidget;
import 'package:flutter/material.dart';

class ProdutoSelectorModel extends FlutterFlowModel<ProdutoSelectorWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for selectorPesquisaField widget.
  FocusNode? selectorPesquisaFieldFocusNode;
  TextEditingController? selectorPesquisaFieldTextController;
  String? Function(BuildContext, String?)?
      selectorPesquisaFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    selectorPesquisaFieldFocusNode?.dispose();
    selectorPesquisaFieldTextController?.dispose();
  }
}
