import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'novo_cliente_propriet_rio4_widget.dart'
    show NovoClienteProprietRio4Widget;
import 'package:flutter/material.dart';

class NovoClienteProprietRio4Model
    extends FlutterFlowModel<NovoClienteProprietRio4Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for TextField.
  late TextFieldModel textFieldModel1;
  // Model for TextField.
  late TextFieldModel textFieldModel2;
  // Model for TextField.
  late TextFieldModel textFieldModel3;
  // Model for TextField.
  late TextFieldModel textFieldModel4;
  // State field(s) for Dropdown widget.
  String? dropdownValue;
  FormFieldController<String>? dropdownValueController;
  // Model for TextField.
  late TextFieldModel textFieldModel5;
  // Model for TextField.
  late TextFieldModel textFieldModel6;
  // Model for TextField.
  late TextFieldModel textFieldModel7;
  // Model for TextField.
  late TextFieldModel textFieldModel8;

  @override
  void initState(BuildContext context) {
    textFieldModel1 = createModel(context, () => TextFieldModel());
    textFieldModel2 = createModel(context, () => TextFieldModel());
    textFieldModel3 = createModel(context, () => TextFieldModel());
    textFieldModel4 = createModel(context, () => TextFieldModel());
    textFieldModel5 = createModel(context, () => TextFieldModel());
    textFieldModel6 = createModel(context, () => TextFieldModel());
    textFieldModel7 = createModel(context, () => TextFieldModel());
    textFieldModel8 = createModel(context, () => TextFieldModel());
  }

  @override
  void dispose() {
    textFieldModel1.dispose();
    textFieldModel2.dispose();
    textFieldModel3.dispose();
    textFieldModel4.dispose();
    textFieldModel5.dispose();
    textFieldModel6.dispose();
    textFieldModel7.dispose();
    textFieldModel8.dispose();
  }
}
