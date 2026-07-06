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
import 'classification_row2_model.dart';
export 'classification_row2_model.dart';

class ClassificationRow2Widget extends StatefulWidget {
  const ClassificationRow2Widget({
    super.key,
    String? label,
    String? value,
  })  : this.label = label ?? 'Linha',
        this.value = value ?? 'LINHA GERAL';

  final String label;
  final String value;

  @override
  State<ClassificationRow2Widget> createState() =>
      _ClassificationRow2WidgetState();
}

class _ClassificationRow2WidgetState extends State<ClassificationRow2Widget> {
  late ClassificationRow2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClassificationRow2Model());
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                valueOrDefault<String>(
<<<<<<< HEAD
                  widget.label,
=======
                  widget!.label,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                  'Linha',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      lineHeight: 1.5,
                    ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  valueOrDefault<String>(
<<<<<<< HEAD
                    widget.value,
=======
                    widget!.value,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                    'LINHA GERAL',
                  ),
                  textAlign: TextAlign.end,
                  maxLines: 2,
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelLarge.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelLarge.fontStyle,
                        lineHeight: 1.2,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
          child: Container(
            child: Divider(
              height: 16.0,
              thickness: 1.0,
              indent: 0.0,
              endIndent: 0.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
          ),
        ),
      ],
    );
  }
}
