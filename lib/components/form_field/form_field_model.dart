import '/components/text_field/text_field_widget.dart';
<<<<<<< HEAD
import '/flutter_flow/flutter_flow_util.dart';
import 'form_field_widget.dart' show FormFieldWidget;
import 'package:flutter/material.dart';
=======
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'form_field_widget.dart' show FormFieldWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)

class FormFieldModel extends FlutterFlowModel<FormFieldWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for TextField.
  late TextFieldModel textFieldModel;

  @override
  void initState(BuildContext context) {
    textFieldModel = createModel(context, () => TextFieldModel());
  }

  @override
  void dispose() {
    textFieldModel.dispose();
  }
}
