import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
<<<<<<< HEAD
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
=======
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
import 'drop_down_model.dart';
export 'drop_down_model.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({
    super.key,
    required this.titulo,
    required this.placeHolder,
    this.listaFiltro,
  });

  final String? titulo;
  final String? placeHolder;
  final List<ListaPadraoStruct>? listaFiltro;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  late DropDownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropDownModel());
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          valueOrDefault<String>(
<<<<<<< HEAD
            widget.titulo,
=======
            widget!.titulo,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
            'titulo',
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
        FlutterFlowDropDown<String>(
          controller: _model.dropDownValueController ??=
              FormFieldController<String>(
            _model.dropDownValue ??=
<<<<<<< HEAD
                widget.listaFiltro != null && (widget.listaFiltro)!.isNotEmpty
                    ? widget.placeHolder
                    : '\"\"',
          ),
          options: List<String>.from(
              widget.listaFiltro!.map((e) => e.codigo).toList()),
          optionLabels: widget.listaFiltro!.map((e) => e.descricao).toList(),
=======
                widget!.listaFiltro != null && (widget!.listaFiltro)!.isNotEmpty
                    ? widget!.placeHolder
                    : '\"\"',
          ),
          options: List<String>.from(
              widget!.listaFiltro!.map((e) => e.codigo).toList()),
          optionLabels: widget!.listaFiltro!.map((e) => e.descricao).toList(),
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
          onChanged: (val) => safeSetState(() => _model.dropDownValue = val),
          width: 250.0,
          height: 40.0,
          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.inter(
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
<<<<<<< HEAD
          hintText: widget.placeHolder,
=======
          hintText: widget!.placeHolder,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 24.0,
          ),
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          elevation: 2.0,
          borderColor: FlutterFlowTheme.of(context).secondaryText,
          borderWidth: 1.0,
          borderRadius: 8.0,
          margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
          hidesUnderline: true,
          isOverButton: false,
          isSearchable: false,
          isMultiSelect: false,
        ),
      ].divide(SizedBox(height: 4.0)),
    );
  }
}
