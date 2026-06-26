import '/components/button/button_widget.dart';
import '/components/checkbox/checkbox_widget.dart';
import '/components/tab_item/tab_item_widget.dart';
import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'novo_cliente_endere_o_widget.dart' show NovoClienteEndereOWidget;
import 'package:flutter/material.dart';

class NovoClienteEndereOModel
    extends FlutterFlowModel<NovoClienteEndereOWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Button.
  late ButtonModel buttonModel;
  // Model for TabItem.
  late TabItemModel tabItemModel1;
  // Model for TabItem.
  late TabItemModel tabItemModel2;
  // Model for TabItem.
  late TabItemModel tabItemModel3;
  // Model for TabItem.
  late TabItemModel tabItemModel4;
  // Model for TextField.
  late TextFieldModel textFieldModel1;
  // Model for TextField.
  late TextFieldModel textFieldModel2;
  // Model for TextField.
  late TextFieldModel textFieldModel3;
  // Model for TextField.
  late TextFieldModel textFieldModel4;
  // Model for TextField.
  late TextFieldModel textFieldModel5;
  // State field(s) for Dropdown widget.
  String? dropdownValue;
  FormFieldController<String>? dropdownValueController;
  // Model for TextField.
  late TextFieldModel textFieldModel6;
  // Model for Checkbox.
  late CheckboxModel checkboxModel1;
  // Model for Checkbox.
  late CheckboxModel checkboxModel2;

  @override
  void initState(BuildContext context) {
    buttonModel = createModel(context, () => ButtonModel());
    tabItemModel1 = createModel(context, () => TabItemModel());
    tabItemModel2 = createModel(context, () => TabItemModel());
    tabItemModel3 = createModel(context, () => TabItemModel());
    tabItemModel4 = createModel(context, () => TabItemModel());
    textFieldModel1 = createModel(context, () => TextFieldModel());
    textFieldModel2 = createModel(context, () => TextFieldModel());
    textFieldModel3 = createModel(context, () => TextFieldModel());
    textFieldModel4 = createModel(context, () => TextFieldModel());
    textFieldModel5 = createModel(context, () => TextFieldModel());
    textFieldModel6 = createModel(context, () => TextFieldModel());
    checkboxModel1 = createModel(context, () => CheckboxModel());
    checkboxModel2 = createModel(context, () => CheckboxModel());
  }

  @override
  void dispose() {
    buttonModel.dispose();
    tabItemModel1.dispose();
    tabItemModel2.dispose();
    tabItemModel3.dispose();
    tabItemModel4.dispose();
    textFieldModel1.dispose();
    textFieldModel2.dispose();
    textFieldModel3.dispose();
    textFieldModel4.dispose();
    textFieldModel5.dispose();
    textFieldModel6.dispose();
    checkboxModel1.dispose();
    checkboxModel2.dispose();
  }
}
