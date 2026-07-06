<<<<<<< HEAD
import '/flutter_flow/flutter_flow_util.dart';
import 'quantity_modal_widget.dart' show QuantityModalWidget;
import 'package:flutter/material.dart';
=======
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'quantity_modal_widget.dart' show QuantityModalWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)

class QuantityModalModel extends FlutterFlowModel<QuantityModalWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - AjustarQuantidade] action in DecrementarButton widget.
  int? novaQtdMinus;
  // Stores action output result for [Custom Action - AjustarQuantidade] action in IncrementarButton widget.
  int? novaQtdPlus;
  // Stores action output result for [Custom Action - SalvarItemPedido] action in ConfirmarPedidoButton widget.
  bool? itemSalvo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
