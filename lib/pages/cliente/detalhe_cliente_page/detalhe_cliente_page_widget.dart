import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'detalhe_cliente_page_model.dart';
export 'detalhe_cliente_page_model.dart';

class DetalheClientePageWidget extends StatefulWidget {
  const DetalheClientePageWidget({
    super.key,
    required this.codigoCliente,
  });

  final int codigoCliente;

  static String routeName = 'DetalheClientePage';
  static String routePath = '/clientes/detalhe';

  @override
  State<DetalheClientePageWidget> createState() => _DetalheClientePageWidgetState();
}

class _DetalheClientePageWidgetState extends State<DetalheClientePageWidget> {
  late DetalheClientePageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetalheClientePageModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _carregarDados();
    });
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<void> _carregarDados() async {
    setState(() {
      _model.isLoading = true;
    });
    try {
      final db = await openDatabase(p.join(await getDatabasesPath(), 'dbforcacad001.db'));
      
      // Query 1: Dados Cadastrais
      int idBusca = widget.codigoCliente;
      final resultsCli = await db.rawQuery(
        'SELECT * FROM cadcli00 WHERE cli00_codigo = ?',
        [idBusca],
      );

      if (resultsCli.isNotEmpty) {
        _model.clienteData = resultsCli.first;
      } else {
        _model.clienteData = null;
      }

      // Query 2: Subquery de Títulos e Saldo Devedor
      try {
        final resultsFin = await db.rawQuery(
          'SELECT COUNT(*) AS qtd_titulos, SUM(dup00_valori - dup00_valpag) AS saldo_devedor, SUM(CASE WHEN dup00_datven < DATE(\'now\') AND dup00_valpag = 0 THEN 1 ELSE 0 END) AS titulos_vencidos FROM finrecdup00 WHERE dup00_codcli = ?',
          [idBusca],
        );
        if (resultsFin.isNotEmpty) {
          final row = resultsFin.first;
          _model.qtdTitulos = (row['qtd_titulos'] as num?)?.toInt() ?? 0;
          _model.saldoDevedor = (row['saldo_devedor'] as num?)?.toDouble() ?? 0.0;
          _model.titulosVencidos = (row['titulos_vencidos'] as num?)?.toInt() ?? 0;
        }
      } catch (e) {
        print('Erro na Query 2 (Subquery de Títulos): $e');
        _model.qtdTitulos = 0;
        _model.saldoDevedor = 0.0;
        _model.titulosVencidos = 0;
      }

      await db.close();
    } catch (e) {
      print('Erro ao carregar cliente do SQLite: $e');
    }
    setState(() {
      _model.isLoading = false;
    });
  }

  String formatCpfCnpj(String? value) {
    if (value == null) return '';
    final digits = value.replaceAll(RegExp(r'\D'), '');
    if (digits.length == 11) {
      return '${digits.substring(0, 3)}.${digits.substring(3, 6)}.${digits.substring(6, 9)}-${digits.substring(9)}';
    } else if (digits.length == 14) {
      return '${digits.substring(0, 2)}.${digits.substring(2, 5)}.${digits.substring(5, 8)}/${digits.substring(8, 12)}-${digits.substring(12)}';
    }
    return value;
  }

  String formatTelefone(String? value) {
    if (value == null) return '';
    final digits = value.replaceAll(RegExp(r'\D'), '');
    if (digits.length == 10) {
      return '(${digits.substring(0, 2)}) ${digits.substring(2, 6)}-${digits.substring(6)}';
    } else if (digits.length == 11) {
      return '(${digits.substring(0, 2)}) ${digits.substring(2, 7)}-${digits.substring(7)}';
    }
    return value;
  }

  String formatCep(String? value) {
    if (value == null) return '';
    final digits = value.replaceAll(RegExp(r'\D'), '');
    if (digits.length == 8) {
      return '${digits.substring(0, 5)}-${digits.substring(5)}';
    }
    return value;
  }

  String formatDateStr(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return 'Sem registro';
    try {
      final date = DateTime.parse(dateStr);
      return DateFormat('dd/MM/yyyy').format(date);
    } catch (_) {
      return dateStr;
    }
  }

  bool comprouMaisDe30Dias(String? datcomStr) {
    if (datcomStr == null || datcomStr.isEmpty) return true;
    try {
      final date = DateTime.parse(datcomStr);
      final diff = DateTime.now().difference(date).inDays;
      return diff > 30;
    } catch (_) {
      return true;
    }
  }

  String _getInitials(String? descri, String? fantas) {
    String text = (descri != null && descri.trim().isNotEmpty)
        ? descri.trim()
        : (fantas != null && fantas.trim().isNotEmpty ? fantas.trim() : 'CL');
    final words = text.split(RegExp(r'\s+'));
    if (words.length >= 2) {
      return (words[0][0] + words[1][0]).toUpperCase();
    } else if (text.length >= 2) {
      return text.substring(0, 2).toUpperCase();
    }
    return text.toUpperCase();
  }

  Widget _buildSkeletonCard() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      elevation: 1.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120.0,
              height: 16.0,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            const SizedBox(height: 12.0),
            Container(
              width: double.infinity,
              height: 12.0,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              width: 200.0,
              height: 12.0,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value, {Color? valueColor, FontWeight? valueWeight}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18.0, color: FlutterFlowTheme.of(context).secondaryText),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        font: GoogleFonts.inter(),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 12.0,
                      ),
                ),
                const SizedBox(height: 2.0),
                Text(
                  value.isNotEmpty ? value : '--',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(),
                        fontWeight: valueWeight ?? FontWeight.normal,
                        color: valueColor ?? FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_model.isLoading) {
      return Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Carregando Detalhes...',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold),
                  color: Colors.white,
                  fontSize: 20.0,
                ),
          ),
          elevation: 2.0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: List.generate(4, (_) => _buildSkeletonCard()),
            ),
          ),
        ),
      );
    }

    if (_model.clienteData == null) {
      return Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline_rounded,
                    size: 72.0,
                    color: FlutterFlowTheme.of(context).error,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Cliente não localizado no banco de dados local',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          font: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold),
                        ),
                  ),
                  const SizedBox(height: 24.0),
                  FFButtonWidget(
                    onPressed: () => Navigator.pop(context),
                    text: 'Voltar para Listagem',
                    options: FFButtonOptions(
                      width: 220.0,
                      height: 46.0,
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

    final row = _model.clienteData!;
    final int codigo = (row['cli00_codigo'] as num?)?.toInt() ?? widget.codigoCliente;
    final String descri = row['cli00_descri']?.toString() ?? '';
    final String fantas = row['cli00_fantas']?.toString() ?? '';
    final String cpfCnpj = row['cli00_cpfcnp']?.toString() ?? '';
    final String rg = row['cli00_rg']?.toString() ?? '';
    final String pessoaType = row['cli00_pessoa']?.toString() ?? 'F';
    
    final String endereco = row['cli00_endere']?.toString() ?? '';
    final String numero = row['cli00_endnum']?.toString() ?? '';
    final String bairro = row['cli00_bairro']?.toString() ?? '';
    final String cidade = row['cli00_ciddes']?.toString() ?? '';
    final String uf = row['cli00_estsgl']?.toString() ?? '';
    final String cep = row['cli00_endcep']?.toString() ?? '';
    final String telefone = row['cli00_fonnum']?.toString() ?? '';
    final String email = row['cli00_email']?.toString() ?? '';

    final double creLim = (row['cli00_crelim'] as num?)?.toDouble() ?? 0.0;
    final double creAtu = (row['cli00_creatu'] as num?)?.toDouble() ?? 0.0;

    final String datCad = row['cli00_datcad']?.toString() ?? '';
    final String datCom = row['cli00_datcom']?.toString() ?? '';
    final int active = (row['cli00_active'] as num?)?.toInt() ?? 0;

    // Credit calculations
    double pctUtilizado = 0.0;
    if (creLim > 0) {
      pctUtilizado = (_model.saldoDevedor / creLim).clamp(0.0, 1.0);
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Detalhes do Cliente',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                font: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold),
                color: Colors.white,
                fontSize: 20.0,
              ),
        ),
        elevation: 2.0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // FASE 2: HEADER DINÂMICO
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 4.0,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
                    radius: 28.0,
                    child: Text(
                      _getInitials(descri, fantas),
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fantas.isNotEmpty ? fantas : descri,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                                fontSize: 18.0,
                              ),
                        ),
                        const SizedBox(height: 2.0),
                        Text(
                          descri,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(),
                                color: FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 14.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Badge de Situação
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: active == 1 ? const Color(0xFFE8F5E9) : const Color(0xFFECEFF1),
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: active == 1 ? const Color(0xFF81C784) : const Color(0xFFB0BEC5),
                            width: 1.0,
                          ),
                        ),
                        child: Text(
                          active == 1 ? 'Ativo' : 'Inativo',
                          style: TextStyle(
                            color: active == 1 ? const Color(0xFF2E7D32) : const Color(0xFF455A64),
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      IconButton(
                        icon: Icon(Icons.edit_rounded, color: FlutterFlowTheme.of(context).primary, size: 22.0),
                        onPressed: () async {
                          final result = await context.pushNamed(
                            FormClientesPageWidget.routeName,
                            queryParameters: {
                              'codigoCliente': serializeParam(codigo, ParamType.int),
                            }.withoutNulls,
                          );
                          if (result == true) {
                            await _carregarDados();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // FASE 3: CARDS VERTICAIS (BODY)
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(12.0),
                children: [
                  // Card 1: Dados Cadastrais
                  Card(
                    margin: const EdgeInsets.only(bottom: 12.0),
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dados Cadastrais',
                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                  font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                          ),
                          const Divider(height: 16.0, thickness: 1.0),
                          _buildDetailRow(Icons.business_rounded, 'Razão Social', descri),
                          _buildDetailRow(Icons.storefront_rounded, 'Nome Fantasia', fantas),
                          _buildDetailRow(Icons.badge_outlined, 'CPF / CNPJ', formatCpfCnpj(cpfCnpj)),
                          _buildDetailRow(Icons.perm_identity_rounded, 'RG', rg),
                          _buildDetailRow(Icons.people_alt_outlined, 'Tipo de Pessoa', pessoaType == 'J' ? 'Jurídica' : 'Física'),
                        ],
                      ),
                    ),
                  ),

                  // Card 2: Endereço e Contato
                  Card(
                    margin: const EdgeInsets.only(bottom: 12.0),
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Endereço e Contato',
                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                  font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                          ),
                          const Divider(height: 16.0, thickness: 1.0),
                          _buildDetailRow(Icons.location_on_outlined, 'Endereço', '$endereco, $numero'),
                          _buildDetailRow(Icons.location_city_outlined, 'Bairro', bairro),
                          _buildDetailRow(Icons.map_outlined, 'Cidade - UF', '$cidade - $uf'),
                          _buildDetailRow(Icons.markunread_mailbox_outlined, 'CEP', formatCep(cep)),
                          _buildDetailRow(Icons.phone_outlined, 'Telefone', formatTelefone(telefone)),
                          _buildDetailRow(Icons.alternate_email_rounded, 'E-mail', email),
                        ],
                      ),
                    ),
                  ),

                  // Card 3: Limites de Crédito
                  Card(
                    margin: const EdgeInsets.only(bottom: 12.0),
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Limites de Crédito',
                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                  font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                          ),
                          const Divider(height: 16.0, thickness: 1.0),
                          _buildDetailRow(
                            Icons.attach_money_rounded,
                            'Limite Original',
                            NumberFormat.simpleCurrency(locale: 'pt_BR').format(creLim),
                          ),
                          _buildDetailRow(
                            Icons.monetization_on_outlined,
                            'Limite Atual',
                            NumberFormat.simpleCurrency(locale: 'pt_BR').format(creAtu),
                          ),
                          _buildDetailRow(
                            Icons.account_balance_wallet_outlined,
                            'Saldo Devedor total',
                            NumberFormat.simpleCurrency(locale: 'pt_BR').format(_model.saldoDevedor),
                            valueColor: _model.saldoDevedor > 0 ? FlutterFlowTheme.of(context).error : null,
                          ),
                          const SizedBox(height: 12.0),
                          Text(
                            'Limite Utilizado: ${(pctUtilizado * 100).toStringAsFixed(1)}%',
                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                  font: GoogleFonts.inter(),
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                ),
                          ),
                          const SizedBox(height: 6.0),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: LinearProgressIndicator(
                              value: pctUtilizado,
                              minHeight: 8.0,
                              backgroundColor: Colors.grey.shade200,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                pctUtilizado > 0.8
                                    ? FlutterFlowTheme.of(context).error
                                    : pctUtilizado > 0.5
                                        ? Colors.orange
                                        : FlutterFlowTheme.of(context).success,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Card 4: Datas Relevantes
                  Card(
                    margin: const EdgeInsets.only(bottom: 12.0),
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Datas Relevantes',
                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                  font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                          ),
                          const Divider(height: 16.0, thickness: 1.0),
                          _buildDetailRow(Icons.calendar_today_rounded, 'Data de Cadastro', formatDateStr(datCad)),
                          _buildDetailRow(Icons.cake_outlined, 'Data de Nascimento', 'Não cadastrado'),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.shopping_bag_outlined, size: 18.0, color: FlutterFlowTheme.of(context).secondaryText),
                                const SizedBox(width: 12.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Última Compra',
                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                              font: GoogleFonts.inter(),
                                              color: FlutterFlowTheme.of(context).secondaryText,
                                              fontSize: 12.0,
                                            ),
                                      ),
                                      const SizedBox(height: 2.0),
                                      Row(
                                        children: [
                                          Text(
                                            formatDateStr(datCom),
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  font: GoogleFonts.inter(),
                                                  color: comprouMaisDe30Dias(datCom)
                                                      ? Colors.amber.shade900
                                                      : FlutterFlowTheme.of(context).primaryText,
                                                  fontWeight: comprouMaisDe30Dias(datCom)
                                                      ? FontWeight.bold
                                                      : FontWeight.normal,
                                                ),
                                          ),
                                          if (comprouMaisDe30Dias(datCom)) ...[
                                            const SizedBox(width: 8.0),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFFFF3E0),
                                                borderRadius: BorderRadius.circular(8.0),
                                                border: Border.all(color: Colors.amber, width: 1.0),
                                              ),
                                              child: Text(
                                                'Inativo > 30d',
                                                style: TextStyle(
                                                  color: Colors.amber.shade900,
                                                  fontSize: 10.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Card 5: Títulos Financeiros
                  Card(
                    margin: const EdgeInsets.only(bottom: 12.0),
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Títulos Financeiros',
                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                  font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                          ),
                          const Divider(height: 16.0, thickness: 1.0),
                          _buildDetailRow(Icons.format_list_numbered_rounded, 'Quantidade Total de Títulos', _model.qtdTitulos.toString()),
                          _buildDetailRow(
                            Icons.monetization_on_rounded,
                            'Saldo Devedor Total',
                            NumberFormat.simpleCurrency(locale: 'pt_BR').format(_model.saldoDevedor),
                            valueColor: _model.saldoDevedor > 0 ? FlutterFlowTheme.of(context).error : null,
                            valueWeight: _model.saldoDevedor > 0 ? FontWeight.bold : null,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.warning_amber_rounded, size: 18.0, color: FlutterFlowTheme.of(context).secondaryText),
                                const SizedBox(width: 12.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Quantidade de Títulos Vencidos',
                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                              font: GoogleFonts.inter(),
                                              color: FlutterFlowTheme.of(context).secondaryText,
                                              fontSize: 12.0,
                                            ),
                                      ),
                                      const SizedBox(height: 2.0),
                                      Row(
                                        children: [
                                          Text(
                                            _model.titulosVencidos.toString(),
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  font: GoogleFonts.inter(),
                                                  color: _model.titulosVencidos > 0
                                                      ? FlutterFlowTheme.of(context).error
                                                      : FlutterFlowTheme.of(context).primaryText,
                                                  fontWeight: _model.titulosVencidos > 0
                                                      ? FontWeight.bold
                                                      : FontWeight.normal,
                                                ),
                                          ),
                                          if (_model.titulosVencidos > 0) ...[
                                            const SizedBox(width: 8.0),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFFFEBEE),
                                                borderRadius: BorderRadius.circular(8.0),
                                                border: Border.all(color: FlutterFlowTheme.of(context).error, width: 1.0),
                                              ),
                                              child: Text(
                                                'Vencido(s)',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(context).error,
                                                  fontSize: 10.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // FASE 4: BOTÕES DE AÇÃO FIXOS NO RODAPÉ
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10.0,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Row(
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          PedidoContext().injectCliente(
                            codigo: codigo,
                            nome: descri,
                            cpfCnpj: cpfCnpj,
                            limiteCredito: creLim,
                            saldoDevedor: _model.saldoDevedor,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Cliente $descri injetado no PedidoContext!'),
                              backgroundColor: FlutterFlowTheme.of(context).success,
                            ),
                          );
                          // Redireciona para digitação de pedidos
                          await context.pushNamed(PedidosRascunhosPageWidget.routeName);
                        },
                        text: 'Iniciar Pedido',
                        options: FFButtonOptions(
                          height: 48.0,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          iconPadding: EdgeInsets.zero,
                          color: FlutterFlowTheme.of(context).success,
                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                                color: Colors.white,
                              ),
                          elevation: 2.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
