import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'opc_clientes_modal_model.dart';
export 'opc_clientes_modal_model.dart';
import '/index.dart';

class OpcClientesModalWidget extends StatefulWidget {
  const OpcClientesModalWidget({super.key});

  @override
  State<OpcClientesModalWidget> createState() => _OpcClientesModalWidgetState();
}

class _OpcClientesModalWidgetState extends State<OpcClientesModalWidget> {
  late OpcClientesModalModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OpcClientesModalModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag Indicator
              Container(
                width: 40.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              const SizedBox(height: 20.0),
              
              // Header
              Text(
                'Opções de Clientes',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      font: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w600,
                      ),
                      fontSize: 18.0,
                    ),
              ),
              const SizedBox(height: 24.0),
              
              // 1. Consultar clientes
              _buildOptionCard(
                context,
                title: 'Consultar clientes',
                subtitle: 'Pesquisar e visualizar clientes cadastrados',
                icon: Icons.people_alt_rounded,
                color: Colors.blue.shade50,
                iconColor: Colors.blue.shade700,
                onTap: () {
                  Navigator.pop(context);
                  context.pushNamed(ClientesPageWidget.routeName);
                },
              ),
              const SizedBox(height: 12.0),
              
              // 2. Rotas / Visitas
              _buildOptionCard(
                context,
                title: 'Rotas / Visitas',
                subtitle: 'Planejar itinerários e visitas do dia',
                icon: Icons.map_rounded,
                color: Colors.green.shade50,
                iconColor: Colors.green.shade700,
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        'Funcionalidade de Rotas e Visitas em desenvolvimento.',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: FlutterFlowTheme.of(context).primary,
                    ),
                  );
                },
              ),
              const SizedBox(height: 12.0),
              
              // 3. Novo cliente
              _buildOptionCard(
                context,
                title: 'Novo cliente',
                subtitle: 'Cadastrar um novo cliente no sistema',
                icon: Icons.person_add_alt_1_rounded,
                color: Colors.orange.shade50,
                iconColor: Colors.orange.shade700,
                onTap: () {
                  Navigator.pop(context);
                  context.pushNamed(
                    FormClientesPageWidget.routeName,
                    queryParameters: {
                      'codigoCliente': serializeParam(0, ParamType.int),
                    }.withoutNulls,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            Container(
              width: 48.0,
              height: 48.0,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 24.0,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    subtitle,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(),
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
            ),
          ],
        ),
      ),
    );
  }
}
