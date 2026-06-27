import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'drop_down_widget.dart' show DropDownWidget;
import 'package:flutter/material.dart';

class DropDownModel extends FlutterFlowModel<DropDownWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - carregarFiltros] action in DropDown widget.
  List<ListaPadraoStruct>? retornoFiltro;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
