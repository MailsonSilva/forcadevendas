import '/components/form_field/form_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'novo_cliente_principal_widget.dart' show NovoClientePrincipalWidget;
import 'package:flutter/material.dart';

class NovoClientePrincipalModel
    extends FlutterFlowModel<NovoClientePrincipalWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for FormField.
  late FormFieldModel formFieldModel1;
  // Model for FormField.
  late FormFieldModel formFieldModel2;
  // Model for FormField.
  late FormFieldModel formFieldModel3;
  // Model for FormField.
  late FormFieldModel formFieldModel4;
  // Model for FormField.
  late FormFieldModel formFieldModel5;
  // Model for FormField.
  late FormFieldModel formFieldModel6;
  // Model for FormField.
  late FormFieldModel formFieldModel7;
  // Model for FormField.
  late FormFieldModel formFieldModel8;

  @override
  void initState(BuildContext context) {
    formFieldModel1 = createModel(context, () => FormFieldModel());
    formFieldModel2 = createModel(context, () => FormFieldModel());
    formFieldModel3 = createModel(context, () => FormFieldModel());
    formFieldModel4 = createModel(context, () => FormFieldModel());
    formFieldModel5 = createModel(context, () => FormFieldModel());
    formFieldModel6 = createModel(context, () => FormFieldModel());
    formFieldModel7 = createModel(context, () => FormFieldModel());
    formFieldModel8 = createModel(context, () => FormFieldModel());
  }

  @override
  void dispose() {
    formFieldModel1.dispose();
    formFieldModel2.dispose();
    formFieldModel3.dispose();
    formFieldModel4.dispose();
    formFieldModel5.dispose();
    formFieldModel6.dispose();
    formFieldModel7.dispose();
    formFieldModel8.dispose();
  }
}
