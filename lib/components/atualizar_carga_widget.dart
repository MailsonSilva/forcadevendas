import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
<<<<<<< HEAD
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
=======
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/actions/sincronizar_imagens.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'atualizar_carga_model.dart';
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
import 'atualizar_carga_model.dart';
export 'atualizar_carga_model.dart';

class AtualizarCargaWidget extends StatefulWidget {
  const AtualizarCargaWidget({
    super.key,
<<<<<<< HEAD
    required this.titulo,
    required this.descricao,
    required this.tipo,
=======
    this.titulo,
    this.descricao,
    this.tipo,
    this.tipoAtualizacao,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
  });

  final String? titulo;
  final String? descricao;
  final String? tipo;
<<<<<<< HEAD
=======
  final String? tipoAtualizacao;
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)

  @override
  State<AtualizarCargaWidget> createState() => _AtualizarCargaWidgetState();
}

class _AtualizarCargaWidgetState extends State<AtualizarCargaWidget> {
  late AtualizarCargaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AtualizarCargaModel());
<<<<<<< HEAD
=======
    ImageSyncProgress.progressNotifier.addListener(_onSyncProgress);
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
  }

  @override
  void dispose() {
<<<<<<< HEAD
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
=======
    ImageSyncProgress.progressNotifier.removeListener(_onSyncProgress);
    _model.maybeDispose();
    super.dispose();
  }

  void _onSyncProgress() {
    final progress = ImageSyncProgress.progressNotifier.value;
    if (progress != null && mounted) {
      final String? progressModo = progress['modo'];
      final resolvedTipo = widget.tipoAtualizacao ?? widget.tipo;
      if (resolvedTipo == 'imagens') {
        safeSetState(() {
          _model.isDownloading = (progress['status'] == 'baixando');
          _model.carregando = (progress['status'] == 'baixando');
          _model.tipocargaImagen = progressModo;
          if (progressModo == 'parcial') {
            _model.dados = progress;
          } else {
            _model.dadosTotais = progress;
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    final resolvedTipo = widget.tipoAtualizacao ?? widget.tipo;
    final isImagens = (resolvedTipo == 'imagens');

    final String displayTitulo = isImagens
        ? 'Imagens dos Produtos'
        : 'Carga de Dados';
    final String displayDescricao = isImagens
        ? 'Parcial atualização rápida. Total baixa tudo e apaga a pasta local'
        : 'Sincronização de dados com o servidor.';

    final String btn1Text = isImagens ? 'Atualização Parcial' : 'Baixar Carga';
    final String btn2Text = isImagens ? 'Atualização Total' : 'Subir carga';

>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 230.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
<<<<<<< HEAD
                    Icons.storage_outlined,
=======
                    isImagens ? Icons.image_outlined : Icons.storage_outlined,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                  Expanded(
                    child: Text(
<<<<<<< HEAD
                      valueOrDefault<String>(
                        widget.titulo,
                        'Título',
                      ),
=======
                      displayTitulo,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
<<<<<<< HEAD
                                .bodyMedium
                                .fontStyle,
=======
                                  .bodyMedium
                                  .fontStyle,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                          ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: Color(0xFFE0E3E7),
                    borderRadius: 12.0,
                    borderWidth: 1.0,
                    buttonSize: 36.0,
                    icon: Icon(
                      Icons.close_rounded,
                      color: Color(0xFF14181B),
                      size: 18.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ].divide(SizedBox(width: 8.0)),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 18.0),
                  child: Text(
<<<<<<< HEAD
                    valueOrDefault<String>(
                      widget.descricao,
                      'Descrição',
                    ),
=======
                    displayDescricao,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
                    maxLines: 2,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              ),
<<<<<<< HEAD
              FFButtonWidget(
                onPressed: () async {
                  if (widget.tipo == 'imagens') {
                    _model.dados = await actions.sincronizarImagens(
                      'parcial',
                    );
                    _model.tipocargaImagen = 'parcial';
                    _model.carregando = true;
                    safeSetState(() {});
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Atualizando'),
                          content:
                              Text('\"Sinconização concluída: \"${getJsonField(
                            _model.dados,
                            r'''$.ok''',
                          ).toString()}\" de \"${getJsonField(
                            _model.dados,
                            r'''$.total''',
                          ).toString()}'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                  }

                  safeSetState(() {});
                },
                text: widget.tipo == 'imagens' ? 'Imgens' : 'Dados',
                icon: Icon(
                  Icons.cloud_download_outlined,
                  size: 24.0,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.plusJakartaSans(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  if (widget.tipo == 'imagens') {
                    _model.dadosTotais = await actions.sincronizarImagens(
                      'total',
                    );
                    _model.tipocargaImagen = 'total';
                    _model.carregando = true;
                    safeSetState(() {});
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Atualizando'),
                          content:
                              Text('\"Sinconização concluída: \"${getJsonField(
                            _model.dadosTotais,
                            r'''$.ok''',
                          ).toString()}\" de \"${getJsonField(
                            _model.dadosTotais,
                            r'''$.total''',
                          ).toString()}'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                    _model.carregando = false;
                    safeSetState(() {});
                  }

                  safeSetState(() {});
                },
                text: 'Subir',
                icon: Icon(
                  Icons.cloud_upload_outlined,
                  size: 24.0,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Colors.white,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.plusJakartaSans(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              if (_model.carregando)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: LinearPercentIndicator(
                    percent: _model.tipocargaImagen == 'parcial'
                        ? getJsonField(
                            _model.dados,
                            r'''$.ok''',
                          )
                        : getJsonField(
                            _model.dadosTotais,
                            r'''$.ok''',
                          ),
                    width: 120.0,
                    lineHeight: 16.0,
                    animation: true,
                    animateFromLastPercent: true,
                    progressColor: FlutterFlowTheme.of(context).primary,
                    backgroundColor: FlutterFlowTheme.of(context).accent4,
                    center: Text(
                      valueOrDefault<String>(
                        (_model.tipocargaImagen == 'parcial'
                                ? getJsonField(
                                    _model.dados,
                                    r'''$.ok''',
                                  )
                                : getJsonField(
                                    _model.dadosTotais,
                                    r'''$.ok''',
                                  ))
                            .toString(),
                        '00',
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                font: GoogleFonts.plusJakartaSans(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                                fontSize: 10.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontStyle,
                              ),
                    ),
                    barRadius: Radius.circular(8.0),
                    padding: EdgeInsets.zero,
                  ),
                ),
            ].divide(SizedBox(height: 8.0)),
=======
              if (!_model.isDownloading)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        safeSetState(() {
                          _model.isDownloading = true;
                          _model.carregando = true;
                          _model.tipocargaImagen = 'parcial';
                        });
                        
                        if (isImagens) {
                          ImageSyncProgress.progressNotifier.value = {
                            'status': 'baixando',
                            'ok': 0,
                            'total': 0,
                            'modo': 'parcial',
                          };
                          
                          final result = await actions.sincronizarImagens('parcial');
                          
                          safeSetState(() {
                            _model.isDownloading = false;
                            _model.carregando = false;
                          });
                          
                          final total = result['total'] ?? 0;
                          final ok = result['ok'] ?? 0;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Sincronização concluída: $ok de $total imagens salvas!"),
                            ),
                          );
                        } else {
                          final result = await actions.downloadDatabaseFromFtp(
                            FFAppState().empresa_codigo,
                            FFAppState().vendedor_codigo.toString(),
                          );
                          safeSetState(() {
                            _model.isDownloading = false;
                            _model.carregando = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(result.success ? "Carga baixada com sucesso!" : "Falha ao baixar carga: ${result.message}"),
                            ),
                          );
                        }
                      },
                      text: btn1Text,
                      icon: Icon(
                        Icons.cloud_download_outlined,
                        size: 24.0,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                              font: GoogleFonts.plusJakartaSans(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle:
                                    FlutterFlowTheme.of(context).titleSmall.fontStyle,
                              ),
                              color: Colors.white,
                              letterSpacing: 0.0,
                              fontWeight:
                                  FlutterFlowTheme.of(context).titleSmall.fontWeight,
                              fontStyle:
                                  FlutterFlowTheme.of(context).titleSmall.fontStyle,
                            ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    FFButtonWidget(
                      onPressed: () async {
                        safeSetState(() {
                          _model.isDownloading = true;
                          _model.carregando = true;
                          _model.tipocargaImagen = 'total';
                        });
                        
                        if (isImagens) {
                          ImageSyncProgress.progressNotifier.value = {
                            'status': 'baixando',
                            'ok': 0,
                            'total': 0,
                            'modo': 'total',
                          };
                          
                          final result = await actions.sincronizarImagens('total');
                          
                          safeSetState(() {
                            _model.isDownloading = false;
                            _model.carregando = false;
                          });
                          
                          final total = result['total'] ?? 0;
                          final ok = result['ok'] ?? 0;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Sincronização concluída: $ok de $total imagens salvas!"),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Sincronização reversa iniciada..."),
                            ),
                          );
                          final result = await actions.uploadDatabaseToFtp(
                            FFAppState().vendedor_codigo.toString(),
                          );
                          safeSetState(() {
                            _model.isDownloading = false;
                            _model.carregando = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(result.success
                                  ? "Sincronização reversa concluída: base local sincronizada com o servidor!"
                                  : "Falha na sincronização reversa: ${result.message}"),
                            ),
                          );
                        }
                      },
                      text: btn2Text,
                      icon: Icon(
                        Icons.cloud_upload_outlined,
                        size: 24.0,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Colors.white,
                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                              font: GoogleFonts.plusJakartaSans(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle:
                                    FlutterFlowTheme.of(context).titleSmall.fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primary,
                              letterSpacing: 0.0,
                              fontWeight:
                                  FlutterFlowTheme.of(context).titleSmall.fontWeight,
                              fontStyle:
                                  FlutterFlowTheme.of(context).titleSmall.fontStyle,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              if (_model.isDownloading)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LinearPercentIndicator(
                        percent: () {
                          final progressData = _model.tipocargaImagen == 'parcial'
                              ? _model.dados
                              : _model.dadosTotais;
                          if (progressData == null) return 0.0;
                          final total = getJsonField(progressData, r'''$.total''');
                          final ok = getJsonField(progressData, r'''$.ok''');
                          if (total == null || total is! num || total == 0) return 0.0;
                          if (ok == null || ok is! num) return 0.0;
                          double pct = ok.toDouble() / total.toDouble();
                          return pct.clamp(0.0, 1.0);
                        }(),
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        lineHeight: 24.0,
                        animation: true,
                        animateFromLastPercent: true,
                        progressColor: FlutterFlowTheme.of(context).primary,
                        backgroundColor: FlutterFlowTheme.of(context).accent4,
                        center: Text(
                          () {
                            final progressData = _model.tipocargaImagen == 'parcial'
                                ? _model.dados
                                : _model.dadosTotais;
                            if (progressData == null) return '0%';
                            final total = getJsonField(progressData, r'''$.total''');
                            final ok = getJsonField(progressData, r'''$.ok''');
                            if (total == null || ok == null) {
                              return isImagens ? 'Baixando...' : 'Sincronizando...';
                            }
                            return "$ok / $total";
                          }(),
                          style:
                              FlutterFlowTheme.of(context).headlineSmall.override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    fontSize: 12.0,
                                    color: Colors.white,
                                  ),
                        ),
                        barRadius: Radius.circular(8.0),
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        isImagens ? 'Sincronizando fotos...' : 'Sincronizando banco de dados...',
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              font: GoogleFonts.inter(),
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                      ),
                    ],
                  ),
                ),
            ],
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
          ),
        ),
      ),
    );
  }
}
