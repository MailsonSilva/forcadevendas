import '/flutter_flow/flutter_flow_util.dart';
import 'detalhe_cliente_page_widget.dart' show DetalheClientePageWidget;
import 'package:flutter/material.dart';

class DetalheClientePageModel extends FlutterFlowModel<DetalheClientePageWidget> {
  // Page state variables.
  bool isLoading = true;
  Map<String, dynamic>? clienteData;
  int qtdTitulos = 0;
  double saldoDevedor = 0.0;
  int titulosVencidos = 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
