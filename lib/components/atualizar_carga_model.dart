<<<<<<< HEAD
import '/flutter_flow/flutter_flow_util.dart';
import 'atualizar_carga_widget.dart' show AtualizarCargaWidget;
import 'package:flutter/material.dart';
=======
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'atualizar_carga_widget.dart' show AtualizarCargaWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)

class AtualizarCargaModel extends FlutterFlowModel<AtualizarCargaWidget> {
  ///  Local state fields for this component.

  String? tipocargaImagen;

  bool carregando = false;

<<<<<<< HEAD
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - sincronizarImagens] action in BtnBaixar widget.
  dynamic dados;
  // Stores action output result for [Custom Action - sincronizarImagens] action in BtnSubir widget.
  dynamic dadosTotais;
=======
  bool isDownloading = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - sincronizarImagens] action in BtnBaixar widget.
  dynamic? dados;
  // Stores action output result for [Custom Action - sincronizarImagens] action in BtnSubir widget.
  dynamic? dadosTotais;
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
