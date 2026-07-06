import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
=======
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
import 'button_model.dart';
export 'button_model.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({
    super.key,
    this.icon,
    bool? iconPresent,
    this.iconEnd,
    bool? iconEndPresent,
    String? content,
    String? variant,
    String? size,
    bool? fullWidth,
    bool? loading,
    bool? disabled,
  })  : this.iconPresent = iconPresent ?? true,
        this.iconEndPresent = iconEndPresent ?? false,
        this.content = content ?? 'SALVAR',
        this.variant = variant ?? 'secondary',
        this.size = size ?? 'small',
        this.fullWidth = fullWidth ?? false,
        this.loading = loading ?? false,
        this.disabled = disabled ?? false;

  final Widget? icon;
  final bool iconPresent;
  final Widget? iconEnd;
  final bool iconEndPresent;
  final String content;
  final String variant;
  final String size;
  final bool fullWidth;
  final bool loading;
  final bool disabled;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  late ButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: valueOrDefault<double>(
        valueOrDefault<bool>(
<<<<<<< HEAD
          widget.disabled,
=======
          widget!.disabled,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
          false,
        )
            ? 0.55
            : 1.0,
        1.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            () {
              if (valueOrDefault<String>(
<<<<<<< HEAD
                    widget.variant,
=======
                    widget!.variant,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                    'secondary',
                  ) ==
                  'secondary') {
                return FlutterFlowTheme.of(context).secondary;
              } else if (valueOrDefault<String>(
<<<<<<< HEAD
                    widget.variant,
=======
                    widget!.variant,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                    'secondary',
                  ) ==
                  'outline') {
                return Colors.transparent;
              } else if (valueOrDefault<String>(
<<<<<<< HEAD
                    widget.variant,
=======
                    widget!.variant,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                    'secondary',
                  ) ==
                  'ghost') {
                return Colors.transparent;
              } else if (valueOrDefault<String>(
<<<<<<< HEAD
                    widget.variant,
=======
                    widget!.variant,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                    'secondary',
                  ) ==
                  'destructive') {
                return FlutterFlowTheme.of(context).error;
              } else {
                return FlutterFlowTheme.of(context).primary;
              }
            }(),
            FlutterFlowTheme.of(context).secondary,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(valueOrDefault<double>(
              () {
                if (valueOrDefault<String>(
<<<<<<< HEAD
                      widget.size,
=======
                      widget!.size,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                      'small',
                    ) ==
                    'small') {
                  return 4.0;
                } else if (valueOrDefault<String>(
<<<<<<< HEAD
                      widget.size,
=======
                      widget!.size,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                      'small',
                    ) ==
                    'large') {
                  return 12.0;
                } else {
                  return 8.0;
                }
              }(),
              4.0,
            )),
            topRight: Radius.circular(valueOrDefault<double>(
              () {
                if (valueOrDefault<String>(
<<<<<<< HEAD
                      widget.size,
=======
                      widget!.size,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                      'small',
                    ) ==
                    'small') {
                  return 4.0;
                } else if (valueOrDefault<String>(
<<<<<<< HEAD
                      widget.size,
=======
                      widget!.size,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                      'small',
                    ) ==
                    'large') {
                  return 12.0;
                } else {
                  return 8.0;
                }
              }(),
              4.0,
            )),
            bottomLeft: Radius.circular(valueOrDefault<double>(
              () {
                if (valueOrDefault<String>(
<<<<<<< HEAD
                      widget.size,
=======
                      widget!.size,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                      'small',
                    ) ==
                    'small') {
                  return 4.0;
                } else if (valueOrDefault<String>(
<<<<<<< HEAD
                      widget.size,
=======
                      widget!.size,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                      'small',
                    ) ==
                    'large') {
                  return 12.0;
                } else {
                  return 8.0;
                }
              }(),
              4.0,
            )),
            bottomRight: Radius.circular(valueOrDefault<double>(
              () {
                if (valueOrDefault<String>(
<<<<<<< HEAD
                      widget.size,
=======
                      widget!.size,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                      'small',
                    ) ==
                    'small') {
                  return 4.0;
                } else if (valueOrDefault<String>(
<<<<<<< HEAD
                      widget.size,
=======
                      widget!.size,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                      'small',
                    ) ==
                    'large') {
                  return 12.0;
                } else {
                  return 8.0;
                }
              }(),
              4.0,
            )),
          ),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: valueOrDefault<Color>(
              valueOrDefault<String>(
<<<<<<< HEAD
                        widget.variant,
=======
                        widget!.variant,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                        'secondary',
                      ) ==
                      'outline'
                  ? FlutterFlowTheme.of(context).alternate
                  : Colors.transparent,
              Colors.transparent,
            ),
            width: valueOrDefault<double>(
              valueOrDefault<String>(
<<<<<<< HEAD
                        widget.variant,
=======
                        widget!.variant,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                        'secondary',
                      ) ==
                      'outline'
                  ? 1.0
                  : 0.0,
              0.0,
            ),
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional(0.0, 0.0),
          children: [
            Opacity(
              opacity: valueOrDefault<double>(
                valueOrDefault<bool>(
<<<<<<< HEAD
                  widget.loading,
=======
                  widget!.loading,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                  false,
                )
                    ? 0.0
                    : 1.0,
                1.0,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    valueOrDefault<double>(
                      () {
                        if (valueOrDefault<String>(
<<<<<<< HEAD
                              widget.size,
=======
                              widget!.size,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                              'small',
                            ) ==
                            'small') {
                          return 16.0;
                        } else if (valueOrDefault<String>(
<<<<<<< HEAD
                              widget.size,
=======
                              widget!.size,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                              'small',
                            ) ==
                            'large') {
                          return 32.0;
                        } else {
                          return 24.0;
                        }
                      }(),
                      16.0,
                    ),
                    valueOrDefault<double>(
                      () {
                        if (valueOrDefault<String>(
<<<<<<< HEAD
                              widget.size,
=======
                              widget!.size,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                              'small',
                            ) ==
                            'small') {
                          return 4.0;
                        } else if (valueOrDefault<String>(
<<<<<<< HEAD
                              widget.size,
=======
                              widget!.size,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                              'small',
                            ) ==
                            'large') {
                          return 16.0;
                        } else {
                          return 8.0;
                        }
                      }(),
                      4.0,
                    ),
                    valueOrDefault<double>(
                      () {
                        if (valueOrDefault<String>(
<<<<<<< HEAD
                              widget.size,
=======
                              widget!.size,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                              'small',
                            ) ==
                            'small') {
                          return 16.0;
                        } else if (valueOrDefault<String>(
<<<<<<< HEAD
                              widget.size,
=======
                              widget!.size,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                              'small',
                            ) ==
                            'large') {
                          return 32.0;
                        } else {
                          return 24.0;
                        }
                      }(),
                      16.0,
                    ),
                    valueOrDefault<double>(
                      () {
                        if (valueOrDefault<String>(
<<<<<<< HEAD
                              widget.size,
=======
                              widget!.size,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                              'small',
                            ) ==
                            'small') {
                          return 4.0;
                        } else if (valueOrDefault<String>(
<<<<<<< HEAD
                              widget.size,
=======
                              widget!.size,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                              'small',
                            ) ==
                            'large') {
                          return 16.0;
                        } else {
                          return 8.0;
                        }
                      }(),
                      4.0,
                    )),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (valueOrDefault<bool>(
<<<<<<< HEAD
                      widget.iconPresent,
                      true,
                    ))
                      widget.icon!,
                    Text(
                      valueOrDefault<String>(
                        widget.content,
=======
                      widget!.iconPresent,
                      true,
                    ))
                      widget!.icon!,
                    Text(
                      valueOrDefault<String>(
                        widget!.content,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                        'SALVAR',
                      ),
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontStyle,
                            ),
                            color: valueOrDefault<Color>(
                              () {
                                if (valueOrDefault<String>(
<<<<<<< HEAD
                                      widget.variant,
=======
                                      widget!.variant,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                                      'secondary',
                                    ) ==
                                    'secondary') {
                                  return FlutterFlowTheme.of(context)
                                      .onSecondary;
                                } else if (valueOrDefault<String>(
<<<<<<< HEAD
                                      widget.variant,
=======
                                      widget!.variant,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                                      'secondary',
                                    ) ==
                                    'outline') {
                                  return FlutterFlowTheme.of(context)
                                      .primaryText;
                                } else if (valueOrDefault<String>(
<<<<<<< HEAD
                                      widget.variant,
=======
                                      widget!.variant,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                                      'secondary',
                                    ) ==
                                    'ghost') {
                                  return FlutterFlowTheme.of(context).primary;
                                } else if (valueOrDefault<String>(
<<<<<<< HEAD
                                      widget.variant,
=======
                                      widget!.variant,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                                      'secondary',
                                    ) ==
                                    'destructive') {
                                  return FlutterFlowTheme.of(context).onError;
                                } else {
                                  return FlutterFlowTheme.of(context).onPrimary;
                                }
                              }(),
                              FlutterFlowTheme.of(context).onSecondary,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontStyle,
                            lineHeight: 1.38,
                          ),
                      overflow: TextOverflow.clip,
                    ),
                    if (valueOrDefault<bool>(
<<<<<<< HEAD
                      widget.iconEndPresent,
                      false,
                    ))
                      widget.iconEnd!,
=======
                      widget!.iconEndPresent,
                      false,
                    ))
                      widget!.iconEnd!,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                  ].divide(SizedBox(width: 8.0)),
                ),
              ),
            ),
            if (valueOrDefault<bool>(
              valueOrDefault<bool>(
<<<<<<< HEAD
                widget.loading,
=======
                widget!.loading,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                false,
              )
                  ? true
                  : false,
              false,
            ))
              CircularPercentIndicator(
                percent: 0.0,
                radius: 7.0,
                lineWidth: 2.0,
                animation: true,
                animateFromLastPercent: true,
                progressColor: valueOrDefault<Color>(
                  () {
                    if (valueOrDefault<String>(
<<<<<<< HEAD
                          widget.variant,
=======
                          widget!.variant,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                          'secondary',
                        ) ==
                        'secondary') {
                      return FlutterFlowTheme.of(context).onSecondary;
                    } else if (valueOrDefault<String>(
<<<<<<< HEAD
                          widget.variant,
=======
                          widget!.variant,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                          'secondary',
                        ) ==
                        'outline') {
                      return FlutterFlowTheme.of(context).primaryText;
                    } else if (valueOrDefault<String>(
<<<<<<< HEAD
                          widget.variant,
=======
                          widget!.variant,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                          'secondary',
                        ) ==
                        'ghost') {
                      return FlutterFlowTheme.of(context).primary;
                    } else if (valueOrDefault<String>(
<<<<<<< HEAD
                          widget.variant,
=======
                          widget!.variant,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                          'secondary',
                        ) ==
                        'destructive') {
                      return FlutterFlowTheme.of(context).onError;
                    } else {
                      return FlutterFlowTheme.of(context).onPrimary;
                    }
                  }(),
                  FlutterFlowTheme.of(context).onSecondary,
                ),
                backgroundColor: FlutterFlowTheme.of(context).alternate,
              ),
          ],
        ),
      ),
    );
  }
}
