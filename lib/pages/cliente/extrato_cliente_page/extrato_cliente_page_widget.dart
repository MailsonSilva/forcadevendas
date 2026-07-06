import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'extrato_cliente_page_model.dart';
export 'extrato_cliente_page_model.dart';

class ExtratoClientePageWidget extends StatefulWidget {
  const ExtratoClientePageWidget({
    super.key,
    required this.clienteCodigo,
  });

  final String clienteCodigo;

  static String routeName = 'ExtratoClientePage';
  static String routePath = '/clientes/extrato';

  @override
  State<ExtratoClientePageWidget> createState() => _ExtratoClientePageWidgetState();
}

class _ExtratoClientePageWidgetState extends State<ExtratoClientePageWidget> {
  late ExtratoClientePageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExtratoClientePageModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: true,
        title: Text(
          'Extrato do Cliente',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                font: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.bold,
                ),
                color: Colors.white,
                fontSize: 22.0,
              ),
        ),
        elevation: 2.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.receipt_long_rounded,
                  size: 64.0,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Extrato Financeiro',
                  style: FlutterFlowTheme.of(context).headlineMedium,
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Código do cliente selecionado: ${widget.clienteCodigo}',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Esta é uma tela futura de Extrato do Cliente. Os lançamentos e movimentações financeiras integradas estarão disponíveis em breve nesta área.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodySmall,
                ),
                const SizedBox(height: 24.0),
                FFButtonWidget(
                  onPressed: () => Navigator.pop(context),
                  text: 'Voltar ao Detalhe',
                  options: FFButtonOptions(
                    width: 200.0,
                    height: 40.0,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    iconPadding: EdgeInsets.zero,
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.inter(),
                          color: Colors.white,
                        ),
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
