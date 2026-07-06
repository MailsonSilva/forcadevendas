import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
=======
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
import 'form_field_model.dart';
export 'form_field_model.dart';

class FormFieldWidget extends StatefulWidget {
  const FormFieldWidget({
    super.key,
    bool? expanded,
    String? hint,
    String? label,
  })  : this.expanded = expanded ?? true,
        this.hint = hint ?? 'Razão Social',
        this.label = label ?? 'Razão Social';

  final bool expanded;
  final String hint;
  final String label;

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  late FormFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormFieldModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          valueOrDefault<String>(
<<<<<<< HEAD
            widget.label,
=======
            widget!.label,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
            'Razão Social',
          ),
          style: FlutterFlowTheme.of(context).labelMedium.override(
                font: GoogleFonts.inter(
                  fontWeight:
                      FlutterFlowTheme.of(context).labelMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).secondaryText,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                lineHeight: 1.38,
              ),
        ),
        wrapWithModel(
          model: _model.textFieldModel,
          updateCallback: () => safeSetState(() {}),
          child: TextFieldWidget(
            label: '',
            labelPresent: false,
            helper: '',
            helperPresent: false,
            leadingIconPresent: false,
            trailingIconPresent: false,
            hint: valueOrDefault<String>(
<<<<<<< HEAD
              widget.hint,
=======
              widget!.hint,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
              'Razão Social',
            ),
            value: '',
            onChange: '',
            onSubmit: '',
            variant: 'outlined',
            error: false,
          ),
        ),
      ].divide(SizedBox(height: 4.0)),
    );
  }
}
