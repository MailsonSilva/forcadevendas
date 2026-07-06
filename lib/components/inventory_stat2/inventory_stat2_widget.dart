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
import 'inventory_stat2_model.dart';
export 'inventory_stat2_model.dart';

class InventoryStat2Widget extends StatefulWidget {
  const InventoryStat2Widget({
    super.key,
    Color? bgTint,
    String? label,
    Color? textColor,
    String? value,
    Color? bg,
    Color? color,
  })  : this.bgTint = bgTint ?? const Color(0x00000000),
        this.label = label ?? 'Atual',
        this.textColor = textColor ?? const Color(0x00000000),
        this.value = value ?? '1',
        this.bg = bg ?? const Color(0x1A5D65AB),
        this.color = color ?? const Color(0xFF1A1C2E);

  final Color bgTint;
  final String label;
  final Color textColor;
  final String value;
  final Color bg;
  final Color color;

  @override
  State<InventoryStat2Widget> createState() => _InventoryStat2WidgetState();
}

class _InventoryStat2WidgetState extends State<InventoryStat2Widget> {
  late InventoryStat2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InventoryStat2Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
<<<<<<< HEAD
          widget.bgTint,
=======
          widget!.bgTint,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
          FlutterFlowTheme.of(context).primary,
        ),
        borderRadius: BorderRadius.circular(12.0),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                valueOrDefault<String>(
<<<<<<< HEAD
                  widget.label,
=======
                  widget!.label,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                  'Atual',
                ),
                style: FlutterFlowTheme.of(context).labelSmall.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).labelSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).labelSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      lineHeight: 1.2,
                    ),
              ),
              Text(
                valueOrDefault<String>(
<<<<<<< HEAD
                  widget.value,
=======
                  widget!.value,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                  '1',
                ),
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      font: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleLarge.fontStyle,
                      ),
                      color: valueOrDefault<Color>(
<<<<<<< HEAD
                        widget.textColor,
=======
                        widget!.textColor,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                        Color(0x00000000),
                      ),
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleLarge.fontStyle,
                      lineHeight: 1.3,
                    ),
              ),
            ].divide(SizedBox(height: 4.0)),
          ),
        ),
      ),
    );
  }
}
