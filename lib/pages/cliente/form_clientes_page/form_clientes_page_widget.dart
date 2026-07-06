import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
<<<<<<< HEAD
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'form_clientes_page_model.dart';
export 'form_clientes_page_model.dart';

/// Formulario de inclusao e edicao de clientes offline.
class FormClientesPageWidget extends StatefulWidget {
  const FormClientesPageWidget({
    super.key,
    String? clienteCodigo,
  }) : this.clienteCodigo = clienteCodigo ?? ' ';

  final String clienteCodigo;
=======
import '/index.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'form_clientes_page_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:go_router/go_router.dart';
export 'form_clientes_page_model.dart';

class FormClientesPageWidget extends StatefulWidget {
  const FormClientesPageWidget({
    super.key,
    int? codigoCliente,
  }) : codigoCliente = codigoCliente ?? 0;

  final int codigoCliente;
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)

  static String routeName = 'FormClientesPage';
  static String routePath = '/clientes/form';

  @override
  State<FormClientesPageWidget> createState() => _FormClientesPageWidgetState();
}

<<<<<<< HEAD
class _FormClientesPageWidgetState extends State<FormClientesPageWidget> {
  late FormClientesPageModel _model;

=======
class _FormClientesPageWidgetState extends State<FormClientesPageWidget> with SingleTickerProviderStateMixin {
  late FormClientesPageModel _model;
  late TabController _tabController;
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormClientesPageModel());
<<<<<<< HEAD

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.clienteCodigo == '') {
        _model.pageTitle = 'Novo Cliente';
        safeSetState(() {});
        _model.isEdit = false;
        safeSetState(() {});
        _model.tipoPessoa = 'F';
        safeSetState(() {});
      } else {
        _model.pageTitle = 'Editar Cliente';
        safeSetState(() {});
        _model.isEdit = true;
        safeSetState(() {});
        _model.dadosCliente = await actions.carregarClienteOffline(
          widget.clienteCodigo,
        );
        _model.cliNome = _model.dadosCliente?.nome;
        safeSetState(() {});
        _model.cliCpfCnpj = _model.dadosCliente?.cpfCnpj;
        safeSetState(() {});
        _model.cliIe = _model.dadosCliente?.ie;
        safeSetState(() {});
        _model.cliRg = _model.dadosCliente?.rg;
        safeSetState(() {});
        _model.cliEndereco = _model.dadosCliente?.endereco;
        safeSetState(() {});
        _model.cliNumero = _model.dadosCliente?.numero;
        safeSetState(() {});
        _model.cliBairro = _model.dadosCliente?.bairro;
        safeSetState(() {});
        _model.cidade = _model.dadosCliente?.cidade;
        safeSetState(() {});
        _model.uf = _model.dadosCliente?.uf;
        safeSetState(() {});
        _model.cliCep = _model.dadosCliente?.cep;
        safeSetState(() {});
        _model.cliTelefone = _model.dadosCliente?.telefone;
        safeSetState(() {});
        _model.cliEmail = _model.dadosCliente?.email;
        safeSetState(() {});
        _model.tipoPessoa = _model.dadosCliente?.tipo;
        safeSetState(() {});
      }
    });

    _model.nomeFieldTextController ??= TextEditingController();
    _model.nomeFieldFocusNode ??= FocusNode();

=======
    _tabController = TabController(length: 4, vsync: this);

    // Initial controllers initialization
    _model.nomeFieldTextController ??= TextEditingController();
    _model.nomeFieldFocusNode ??= FocusNode();

    _model.nomeFantasiaFieldTextController ??= TextEditingController();
    _model.nomeFantasiaFieldFocusNode ??= FocusNode();

>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
    _model.cpfCnpjFieldTextController ??= TextEditingController();
    _model.cpfCnpjFieldFocusNode ??= FocusNode();

    _model.ieFieldTextController ??= TextEditingController();
    _model.ieFieldFocusNode ??= FocusNode();

    _model.rgFieldTextController ??= TextEditingController();
    _model.rgFieldFocusNode ??= FocusNode();

    _model.emailFieldTextController ??= TextEditingController();
    _model.emailFieldFocusNode ??= FocusNode();

<<<<<<< HEAD
    _model.enderecoFieldTextController ??= TextEditingController();
    _model.enderecoFieldFocusNode ??= FocusNode();

    _model.bairroFieldTextController ??= TextEditingController();
    _model.bairroFieldFocusNode ??= FocusNode();
=======
    _model.ramoFieldTextController ??= TextEditingController();
    _model.ramoFieldFocusNode ??= FocusNode();

    _model.limiteCreditoFieldTextController ??= TextEditingController();
    _model.limiteCreditoFieldFocusNode ??= FocusNode();
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)

    _model.cepFieldTextController ??= TextEditingController();
    _model.cepFieldFocusNode ??= FocusNode();

    _model.numeroFieldTextController ??= TextEditingController();
    _model.numeroFieldFocusNode ??= FocusNode();

<<<<<<< HEAD
=======
    _model.enderecoFieldTextController ??= TextEditingController();
    _model.enderecoFieldFocusNode ??= FocusNode();

    _model.bairroFieldTextController ??= TextEditingController();
    _model.bairroFieldFocusNode ??= FocusNode();

>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
    _model.cidadeFieldTextController ??= TextEditingController();
    _model.cidadeFieldFocusNode ??= FocusNode();

    _model.telefoneFieldTextController ??= TextEditingController();
    _model.telefoneFieldFocusNode ??= FocusNode();
<<<<<<< HEAD
=======

    _model.propNomeFieldTextController ??= TextEditingController();
    _model.propNomeFieldFocusNode ??= FocusNode();

    _model.propEnderecoFieldTextController ??= TextEditingController();
    _model.propEnderecoFieldFocusNode ??= FocusNode();

    _model.propBairroFieldTextController ??= TextEditingController();
    _model.propBairroFieldFocusNode ??= FocusNode();

    _model.propCidadeFieldTextController ??= TextEditingController();
    _model.propCidadeFieldFocusNode ??= FocusNode();

    _model.propRgFieldTextController ??= TextEditingController();
    _model.propRgFieldFocusNode ??= FocusNode();

    _model.propCpfFieldTextController ??= TextEditingController();
    _model.propCpfFieldFocusNode ??= FocusNode();

    _model.conjNomeFieldTextController ??= TextEditingController();
    _model.conjNomeFieldFocusNode ??= FocusNode();

    _model.conjRgFieldTextController ??= TextEditingController();
    _model.conjRgFieldFocusNode ??= FocusNode();

    _model.conjCpfFieldTextController ??= TextEditingController();
    _model.conjCpfFieldFocusNode ??= FocusNode();

    _model.obsFieldTextController ??= TextEditingController();
    _model.obsFieldFocusNode ??= FocusNode();

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.codigoCliente == 0) {
        _model.pageTitle = 'Novo Cliente';
        _model.isEdit = false;
        _model.tipoPessoa = 'F';
        safeSetState(() {});
      } else {
        _model.pageTitle = 'Editar Cliente';
        _model.isEdit = true;
        safeSetState(() {});
        
        final db = await openDatabase(p.join(await getDatabasesPath(), 'dbforcacad001.db'));
        final int idBusca = int.parse(widget.codigoCliente.toString());
        final List<Map<String, dynamic>> clienteResult = await db.rawQuery(
          'SELECT * FROM cadcli00 WHERE cli00_codigo = ?',
          [idBusca],
        );
        
        if (clienteResult.isNotEmpty) {
          final row = clienteResult.first;
          _model.cliNome = row['cli00_descri']?.toString() ?? '';
          _model.cliCpfCnpj = row['cli00_cpfcnp']?.toString() ?? '';
          _model.cliIe = row['cli00_insest']?.toString() ?? '';
          _model.cliRg = row['cli00_rg']?.toString() ?? '';
          _model.cliEndereco = row['cli00_endere']?.toString() ?? '';
          _model.cliNumero = row['cli00_endnum']?.toString() ?? '';
          _model.cliBairro = row['cli00_bairro']?.toString() ?? '';
          _model.cidade = row['cli00_ciddes']?.toString() ?? '';
          _model.uf = row['cli00_estsgl']?.toString() ?? '';
          _model.cliCep = row['cli00_endcep']?.toString() ?? '';
          _model.cliTelefone = row['cli00_fonnum']?.toString() ?? '';
          _model.cliEmail = row['cli00_email']?.toString() ?? '';
          _model.tipoPessoa = row['cli00_pessoa']?.toString() ?? 'F';
          final String fantas = row['cli00_fantas']?.toString() ?? '';
          final String observacao = row['cli00_observ']?.toString() ?? '';

          // Populate controllers with formatted masks
          _model.nomeFieldTextController?.text = _model.cliNome ?? '';
          _model.nomeFantasiaFieldTextController?.text = fantas;
          _model.cpfCnpjFieldTextController?.text = formatCpfCnpj(_model.cliCpfCnpj ?? '');
          _model.ieFieldTextController?.text = _model.cliIe ?? '';
          _model.rgFieldTextController?.text = formatRG(_model.cliRg ?? '');
          _model.emailFieldTextController?.text = _model.cliEmail ?? '';
          _model.enderecoFieldTextController?.text = _model.cliEndereco ?? '';
          _model.numeroFieldTextController?.text = _model.cliNumero ?? '';
          _model.bairroFieldTextController?.text = _model.cliBairro ?? '';
          _model.cidadeFieldTextController?.text = _model.cidade ?? '';
          _model.cepFieldTextController?.text = formatCEP(_model.cliCep ?? '');
          _model.telefoneFieldTextController?.text = formatTelefone(_model.cliTelefone ?? '');
          _model.obsFieldTextController?.text = observacao;
          
          _model.ufDropdownValue = _model.uf;
          _model.ufDropdownValueController?.value = _model.uf;

          safeSetState(() {});
        }
        await db.close();
      }
    });
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
  }

  @override
  void dispose() {
<<<<<<< HEAD
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
=======
    _tabController.dispose();
    _model.dispose();
    super.dispose();
  }

  String formatCpfCnpj(String val) {
    final clean = val.replaceAll(RegExp(r'\D'), '');
    if (clean.length <= 11) {
      final buffer = StringBuffer();
      for (int i = 0; i < clean.length; i++) {
        if (i == 3 || i == 6) buffer.write('.');
        if (i == 9) buffer.write('-');
        buffer.write(clean[i]);
      }
      return buffer.toString();
    } else {
      final buffer = StringBuffer();
      final len = clean.length > 14 ? 14 : clean.length;
      for (int i = 0; i < len; i++) {
        if (i == 2 || i == 5) buffer.write('.');
        if (i == 8) buffer.write('/');
        if (i == 12) buffer.write('-');
        buffer.write(clean[i]);
      }
      return buffer.toString();
    }
  }

  String formatRG(String val) {
    final clean = val.replaceAll(RegExp(r'\D'), '');
    final len = clean.length > 9 ? 9 : clean.length;
    final buffer = StringBuffer();
    for (int i = 0; i < len; i++) {
      if (i == 2 || i == 5) buffer.write('.');
      if (i == 8) buffer.write('-');
      buffer.write(clean[i]);
    }
    return buffer.toString();
  }

  String formatCEP(String val) {
    final clean = val.replaceAll(RegExp(r'\D'), '');
    final len = clean.length > 8 ? 8 : clean.length;
    final buffer = StringBuffer();
    for (int i = 0; i < len; i++) {
      if (i == 5) buffer.write('-');
      buffer.write(clean[i]);
    }
    return buffer.toString();
  }

  String formatTelefone(String val) {
    final clean = val.replaceAll(RegExp(r'\D'), '');
    final len = clean.length > 11 ? 11 : clean.length;
    final buffer = StringBuffer();
    if (len > 0) buffer.write('(');
    for (int i = 0; i < len; i++) {
      if (i == 2) buffer.write(') ');
      if (i == 6 && len <= 10) buffer.write('-');
      if (i == 7 && len > 10) buffer.write('-');
      buffer.write(clean[i]);
    }
    return buffer.toString();
  }

  void _applyMask(TextEditingController controller, String Function(String) formatter, String val) {
    final clean = val.replaceAll(RegExp(r'\D'), '');
    final formatted = formatter(clean);
    controller.value = TextEditingValue(
      text: formatted,
      selection: TextSelection.fromPosition(
        TextPosition(offset: formatted.length),
      ),
    );
  }

  String stripMask(String v) => v.replaceAll(RegExp(r'[^0-9]'), '');

  Widget _buildTextField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
    TextInputAction textInputAction = TextInputAction.next,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        maxLines: maxLines,
        textInputAction: textInputAction,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.inter(),
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).alternate,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).primary,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        validator: validator,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
<<<<<<< HEAD
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: true,
          title: Text(
            _model.pageTitle!,
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.plusJakartaSans(
                    fontWeight:
                        FlutterFlowTheme.of(context).titleLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).titleLarge.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tipo de Pessoa',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Stack(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                children: [
                                  if (_model.tipoPessoa == 'F')
                                    FFButtonWidget(
                                      onPressed: () async {
                                        _model.tipoPessoa = 'F';
                                        safeSetState(() {});
                                      },
                                      text: 'Física',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  if (!(_model.tipoPessoa == 'F'))
                                    FFButtonWidget(
                                      onPressed: () async {
                                        _model.tipoPessoa = 'F';
                                        safeSetState(() {});
                                      },
                                      text: 'Física',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        textStyle: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Stack(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                children: [
                                  if (_model.tipoPessoa == 'J')
                                    FFButtonWidget(
                                      onPressed: () async {
                                        _model.tipoPessoa = 'J';
                                        safeSetState(() {});
                                      },
                                      text: 'Jurídica',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  if (!(_model.tipoPessoa == 'J'))
                                    FFButtonWidget(
                                      onPressed: () async {
                                        _model.tipoPessoa = 'J';
                                        safeSetState(() {});
                                      },
                                      text: 'Jurídica',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        textStyle: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                    TextFormField(
                      controller: _model.nomeFieldTextController,
                      focusNode: _model.nomeFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.nomeFieldTextController',
                        Duration(milliseconds: 2000),
                        () async {
                          _model.cliNome = _model.nomeFieldTextController.text;
                          safeSetState(() {});
                        },
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Nome / Razão Social',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        filled: true,
                      ),
                      style: TextStyle(),
                      maxLines: null,
                      validator: _model.nomeFieldTextControllerValidator
                          .asValidator(context),
                    ),
                    TextFormField(
                      controller: _model.cpfCnpjFieldTextController,
                      focusNode: _model.cpfCnpjFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.cpfCnpjFieldTextController',
                        Duration(milliseconds: 2000),
                        () async {
                          _model.cliCpfCnpj =
                              _model.cpfCnpjFieldTextController.text;
                          safeSetState(() {});
                        },
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'CPF / CNPJ',
                        hintText: 'Apenas numeros',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        filled: true,
                      ),
                      style: TextStyle(),
                      maxLines: null,
                      validator: _model.cpfCnpjFieldTextControllerValidator
                          .asValidator(context),
                    ),
                    TextFormField(
                      controller: _model.ieFieldTextController,
                      focusNode: _model.ieFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.ieFieldTextController',
                        Duration(milliseconds: 2000),
                        () async {
                          _model.cliIe = _model.ieFieldTextController.text;
                          safeSetState(() {});
                        },
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Inscrição Estadual',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        filled: true,
                      ),
                      style: TextStyle(),
                      maxLines: null,
                      validator: _model.ieFieldTextControllerValidator
                          .asValidator(context),
                    ),
                    TextFormField(
                      controller: _model.rgFieldTextController,
                      focusNode: _model.rgFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.rgFieldTextController',
                        Duration(milliseconds: 2000),
                        () async {
                          _model.cliRg = _model.rgFieldTextController.text;
                          safeSetState(() {});
                        },
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'RG',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        filled: true,
                      ),
                      style: TextStyle(),
                      maxLines: null,
                      validator: _model.rgFieldTextControllerValidator
                          .asValidator(context),
                    ),
                    TextFormField(
                      controller: _model.emailFieldTextController,
                      focusNode: _model.emailFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.emailFieldTextController',
                        Duration(milliseconds: 2000),
                        () async {
                          _model.cliEmail =
                              _model.emailFieldTextController.text;
                          safeSetState(() {});
                        },
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        filled: true,
                      ),
                      style: TextStyle(),
                      maxLines: null,
                      validator: _model.emailFieldTextControllerValidator
                          .asValidator(context),
                    ),
                    TextFormField(
                      controller: _model.enderecoFieldTextController,
                      focusNode: _model.enderecoFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.enderecoFieldTextController',
                        Duration(milliseconds: 2000),
                        () async {
                          _model.cliEndereco =
                              _model.enderecoFieldTextController.text;
                          safeSetState(() {});
                        },
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Endereço',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        filled: true,
                      ),
                      style: TextStyle(),
                      maxLines: null,
                      validator: _model.enderecoFieldTextControllerValidator
                          .asValidator(context),
                    ),
                    TextFormField(
                      controller: _model.bairroFieldTextController,
                      focusNode: _model.bairroFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.bairroFieldTextController',
                        Duration(milliseconds: 2000),
                        () async {
                          _model.cliBairro =
                              _model.bairroFieldTextController.text;
                          safeSetState(() {});
                        },
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Bairro',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        filled: true,
                      ),
                      style: TextStyle(),
                      maxLines: null,
                      validator: _model.bairroFieldTextControllerValidator
                          .asValidator(context),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            controller: _model.cepFieldTextController,
                            focusNode: _model.cepFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.cepFieldTextController',
                              Duration(milliseconds: 2000),
                              () async {
                                _model.cliCep =
                                    _model.cepFieldTextController.text;
                                safeSetState(() {});
                              },
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'CEP',
                              hintText: '00000-000',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              filled: true,
                            ),
                            style: TextStyle(),
                            maxLines: null,
                            validator: _model.cepFieldTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            controller: _model.numeroFieldTextController,
                            focusNode: _model.numeroFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.numeroFieldTextController',
                              Duration(milliseconds: 2000),
                              () async {
                                _model.cliNumero =
                                    _model.numeroFieldTextController.text;
                                safeSetState(() {});
                              },
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Número',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              filled: true,
                            ),
                            style: TextStyle(),
                            maxLines: null,
                            validator: _model.numeroFieldTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: _model.cidadeFieldTextController,
                            focusNode: _model.cidadeFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.cidadeFieldTextController',
                              Duration(milliseconds: 2000),
                              () async {
                                _model.cidade =
                                    _model.cidadeFieldTextController.text;
                                safeSetState(() {});
                              },
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Cidade',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              filled: true,
                            ),
                            style: TextStyle(),
                            maxLines: null,
                            validator: _model.cidadeFieldTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: FlutterFlowDropDown<String>(
                            controller: _model.ufDropdownValueController ??=
                                FormFieldController<String>(
                              _model.ufDropdownValue ??= _model.uf,
                            ),
                            options: [
                              'AC',
                              'AL',
                              'AP',
                              'AM',
                              'BA',
                              'CE',
                              'DF',
                              'ES',
                              'GO',
                              'MA',
                              'MT',
                              'MS',
                              'MG',
                              'PA',
                              'PB',
                              'PR',
                              'PE',
                              'PI',
                              'RJ',
                              'RN',
                              'RS',
                              'RO',
                              'RR',
                              'SC',
                              'SP',
                              'SE',
                              'TO'
                            ],
                            onChanged: (val) async {
                              safeSetState(() => _model.ufDropdownValue = val);
                              _model.uf = _model.ufDropdownValue;
                              safeSetState(() {});
                            },
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 1.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            hidesUnderline: true,
                            isOverButton: false,
                            isSearchable: false,
                            isMultiSelect: false,
                            labelText: 'UF',
                            labelTextStyle: TextStyle(),
                          ),
                        ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                    TextFormField(
                      controller: _model.telefoneFieldTextController,
                      focusNode: _model.telefoneFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.telefoneFieldTextController',
                        Duration(milliseconds: 2000),
                        () async {
                          _model.cliTelefone =
                              _model.telefoneFieldTextController.text;
                          safeSetState(() {});
                        },
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Telefone',
                        hintText: '(00) 00000-0000',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        filled: true,
                      ),
                      style: TextStyle(),
                      maxLines: null,
                      validator: _model.telefoneFieldTextControllerValidator
                          .asValidator(context),
                    ),
                    Container(
                      height: 20.0,
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        if (_model.nomeFieldTextController.text == '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Razão Social é obrigatória.',
                                style: TextStyle(),
                              ),
                              duration: Duration(milliseconds: 4000),
                            ),
                          );
                        } else {
                          _model.resultadoSalvar =
                              await actions.salvarClienteOffline(
                            _model.nomeFieldTextController.text,
                            _model.cpfCnpjFieldTextController.text,
                            _model.ieFieldTextController.text,
                            _model.rgFieldTextController.text,
                            _model.enderecoFieldTextController.text,
                            _model.numeroFieldTextController.text,
                            _model.bairroFieldTextController.text,
                            _model.cidadeFieldTextController.text,
                            _model.uf,
                            _model.cepFieldTextController.text,
                            _model.telefoneFieldTextController.text,
                            _model.emailFieldTextController.text,
                            _model.tipoPessoa,
                            widget.clienteCodigo,
                          );
                          if (_model.resultadoSalvar?.success == true) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Cliente salvo com sucesso!',
                                  style: TextStyle(),
                                ),
                                duration: Duration(milliseconds: 4000),
                              ),
                            );
                            context.pop();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  _model.resultadoSalvar!.message,
                                  style: TextStyle(),
                                ),
                                duration: Duration(milliseconds: 4000),
                              ),
                            );
                          }
                        }

                        safeSetState(() {});
                      },
                      text: 'SALVAR CLIENTE',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF5CB85C),
                        textStyle: TextStyle(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),
              ),
            ),
=======
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            _model.pageTitle ?? 'Cliente',
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w600,
                  ),
                  color: Colors.white,
                  fontSize: 20.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: const [
              Tab(text: 'Principal'),
              Tab(text: 'Endereço'),
              Tab(text: 'Proprietário'),
              Tab(text: 'Bancos e Obs'),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            controller: _tabController,
            children: [
              // ABA 1: Principal
              SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildTextField(
                          controller: _model.nomeFieldTextController!,
                          focusNode: _model.nomeFieldFocusNode!,
                          label: 'Razão Social',
                        ),
                        _buildTextField(
                          controller: _model.nomeFantasiaFieldTextController!,
                          focusNode: _model.nomeFantasiaFieldFocusNode!,
                          label: 'Nome Fantasia',
                        ),
                        // Tipo Pessoa ChoiceChips/Toggle
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tipo de Pessoa',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.inter(),
                                      color: FlutterFlowTheme.of(context).secondaryText,
                                    ),
                              ),
                              const SizedBox(height: 8.0),
                              Row(
                                children: [
                                  Expanded(
                                    child: ChoiceChip(
                                      label: const Center(child: Text('Física')),
                                      selected: _model.tipoPessoa == 'F',
                                      onSelected: (val) {
                                        if (val) {
                                          safeSetState(() {
                                            _model.tipoPessoa = 'F';
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 12.0),
                                  Expanded(
                                    child: ChoiceChip(
                                      label: const Center(child: Text('Jurídica')),
                                      selected: _model.tipoPessoa == 'J',
                                      onSelected: (val) {
                                        if (val) {
                                          safeSetState(() {
                                            _model.tipoPessoa = 'J';
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        _buildTextField(
                          controller: _model.cpfCnpjFieldTextController!,
                          focusNode: _model.cpfCnpjFieldFocusNode!,
                          label: _model.tipoPessoa == 'J' ? 'CNPJ' : 'CPF',
                          keyboardType: TextInputType.number,
                          onChanged: (val) {
                            final clean = val.replaceAll(RegExp(r'\D'), '');
                            if (clean.length == 11) {
                              safeSetState(() {
                                _model.tipoPessoa = 'F';
                              });
                            } else if (clean.length == 14) {
                              safeSetState(() {
                                _model.tipoPessoa = 'J';
                              });
                            }
                            _applyMask(_model.cpfCnpjFieldTextController!, formatCpfCnpj, val);
                          },
                        ),
                        _buildTextField(
                          controller: _model.ieFieldTextController!,
                          focusNode: _model.ieFieldFocusNode!,
                          label: 'Insc. Estadual',
                        ),
                        _buildTextField(
                          controller: _model.rgFieldTextController!,
                          focusNode: _model.rgFieldFocusNode!,
                          label: 'RG',
                          keyboardType: TextInputType.number,
                          onChanged: (val) {
                            _applyMask(_model.rgFieldTextController!, formatRG, val);
                          },
                        ),
                        _buildTextField(
                          controller: _model.emailFieldTextController!,
                          focusNode: _model.emailFieldFocusNode!,
                          label: 'E-mail',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        _buildTextField(
                          controller: _model.ramoFieldTextController!,
                          focusNode: _model.ramoFieldFocusNode!,
                          label: 'Ramo de Atividade',
                        ),
                        _buildTextField(
                          controller: _model.limiteCreditoFieldTextController!,
                          focusNode: _model.limiteCreditoFieldFocusNode!,
                          label: 'Limite de Crédito',
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // ABA 2: Endereço
              SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: _buildTextField(
                                controller: _model.cepFieldTextController!,
                                focusNode: _model.cepFieldFocusNode!,
                                label: 'CEP',
                                keyboardType: TextInputType.number,
                                onChanged: (val) async {
                                  _applyMask(_model.cepFieldTextController!, formatCEP, val);
                                  final cleanCep = val.replaceAll(RegExp(r'[^0-9]'), '');
                                  if (cleanCep.length == 8) {
                                    try {
                                      final response = await http.get(Uri.parse('https://brasilapi.com.br/api/cep/v2/$cleanCep'));
                                      if (response.statusCode == 200) {
                                        final data = json.decode(response.body);
                                        final street = data['street'] ?? '';
                                        final neighborhood = data['neighborhood'] ?? '';
                                        final city = data['city'] ?? '';
                                        final state = data['state'] ?? '';

                                        _model.enderecoFieldTextController?.text = street;
                                        _model.bairroFieldTextController?.text = neighborhood;
                                        _model.cidadeFieldTextController?.text = city;

                                        if (state.isNotEmpty) {
                                          _model.ufDropdownValue = state;
                                          _model.ufDropdownValueController?.value = state;
                                        }
                                        safeSetState(() {});
                                      }
                                    } catch (e) {
                                      // Silent fail
                                    }
                                  }
                                },
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            Expanded(
                              flex: 1,
                              child: _buildTextField(
                                controller: _model.numeroFieldTextController!,
                                focusNode: _model.numeroFieldFocusNode!,
                                label: 'Número',
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        _buildTextField(
                          controller: _model.enderecoFieldTextController!,
                          focusNode: _model.enderecoFieldFocusNode!,
                          label: 'Endereço',
                        ),
                        _buildTextField(
                          controller: _model.bairroFieldTextController!,
                          focusNode: _model.bairroFieldFocusNode!,
                          label: 'Bairro',
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: _buildTextField(
                                controller: _model.cidadeFieldTextController!,
                                focusNode: _model.cidadeFieldFocusNode!,
                                label: 'Cidade',
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'UF',
                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          font: GoogleFonts.inter(),
                                          color: FlutterFlowTheme.of(context).secondaryText,
                                        ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  FlutterFlowDropDown<String>(
                                    controller: _model.ufDropdownValueController ??=
                                        FormFieldController<String>(_model.ufDropdownValue),
                                    options: const [
                                      'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO',
                                      'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI',
                                      'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'
                                    ],
                                    onChanged: (val) => safeSetState(() => _model.ufDropdownValue = val),
                                    width: double.infinity,
                                    height: 45.0,
                                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                                    hintText: 'UF',
                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                    borderColor: FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 1.0,
                                    borderRadius: 8.0,
                                    margin: const EdgeInsets.symmetric(horizontal: 12.0),
                                    hidesUnderline: true,
                                    elevation: 2,
                                  ),
                                  const SizedBox(height: 12.0),
                                ],
                              ),
                            ),
                          ],
                        ),
                        _buildTextField(
                          controller: _model.telefoneFieldTextController!,
                          focusNode: _model.telefoneFieldFocusNode!,
                          label: 'Telefone',
                          keyboardType: TextInputType.phone,
                          onChanged: (val) {
                            _applyMask(_model.telefoneFieldTextController!, formatTelefone, val);
                          },
                        ),
                        // Checkboxes
                        CheckboxListTile(
                          title: const Text('Usar Endereço de Entrega'),
                          value: _model.usarEntrega,
                          onChanged: (val) {
                            safeSetState(() {
                              _model.usarEntrega = val ?? false;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                        CheckboxListTile(
                          title: const Text('Endereço de Cobrança'),
                          value: _model.usarCobranca,
                          onChanged: (val) {
                            safeSetState(() {
                              _model.usarCobranca = val ?? false;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // ABA 3: Proprietário
              SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Dados do Proprietário',
                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                            ),
                            const SizedBox(height: 12.0),
                            _buildTextField(
                              controller: _model.propNomeFieldTextController!,
                              focusNode: _model.propNomeFieldFocusNode!,
                              label: 'Nome do Proprietário',
                            ),
                            _buildTextField(
                              controller: _model.propEnderecoFieldTextController!,
                              focusNode: _model.propEnderecoFieldFocusNode!,
                              label: 'Endereço',
                            ),
                            _buildTextField(
                              controller: _model.propBairroFieldTextController!,
                              focusNode: _model.propBairroFieldFocusNode!,
                              label: 'Bairro',
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: _buildTextField(
                                    controller: _model.propCidadeFieldTextController!,
                                    focusNode: _model.propCidadeFieldFocusNode!,
                                    label: 'Cidade',
                                  ),
                                ),
                                const SizedBox(width: 12.0),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'UF',
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              font: GoogleFonts.inter(),
                                              color: FlutterFlowTheme.of(context).secondaryText,
                                            ),
                                      ),
                                      const SizedBox(height: 4.0),
                                      FlutterFlowDropDown<String>(
                                        controller: _model.propUfDropdownValueController ??=
                                            FormFieldController<String>(_model.propUfDropdownValue),
                                        options: const [
                                          'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO',
                                          'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI',
                                          'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'
                                        ],
                                        onChanged: (val) => safeSetState(() => _model.propUfDropdownValue = val),
                                        width: double.infinity,
                                        height: 45.0,
                                        textStyle: FlutterFlowTheme.of(context).bodyMedium,
                                        hintText: 'UF',
                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                        borderColor: FlutterFlowTheme.of(context).alternate,
                                        borderWidth: 1.0,
                                        borderRadius: 8.0,
                                        margin: const EdgeInsets.symmetric(horizontal: 12.0),
                                        hidesUnderline: true,
                                        elevation: 2,
                                      ),
                                      const SizedBox(height: 12.0),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            _buildTextField(
                              controller: _model.propRgFieldTextController!,
                              focusNode: _model.propRgFieldFocusNode!,
                              label: 'RG',
                              keyboardType: TextInputType.number,
                              onChanged: (val) {
                                _applyMask(_model.propRgFieldTextController!, formatRG, val);
                              },
                            ),
                            _buildTextField(
                              controller: _model.propCpfFieldTextController!,
                              focusNode: _model.propCpfFieldFocusNode!,
                              label: 'CPF',
                              keyboardType: TextInputType.number,
                              onChanged: (val) {
                                _applyMask(_model.propCpfFieldTextController!, formatCpfCnpj, val);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Cônjuge',
                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                            ),
                            const SizedBox(height: 12.0),
                            _buildTextField(
                              controller: _model.conjNomeFieldTextController!,
                              focusNode: _model.conjNomeFieldFocusNode!,
                              label: 'Nome do Cônjuge',
                            ),
                            _buildTextField(
                              controller: _model.conjRgFieldTextController!,
                              focusNode: _model.conjRgFieldFocusNode!,
                              label: 'RG',
                              keyboardType: TextInputType.number,
                              onChanged: (val) {
                                _applyMask(_model.conjRgFieldTextController!, formatRG, val);
                              },
                            ),
                            _buildTextField(
                              controller: _model.conjCpfFieldTextController!,
                              focusNode: _model.conjCpfFieldFocusNode!,
                              label: 'CPF',
                              keyboardType: TextInputType.number,
                              onChanged: (val) {
                                _applyMask(_model.conjCpfFieldTextController!, formatCpfCnpj, val);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ABA 4: Bancos e Obs
              SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Bancos',
                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                        font: GoogleFonts.plusJakartaSans(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add, color: Color(0xFF5CB85C)),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Função de adicionar banco em breve.')),
                                    );
                                  },
                                ),
                              ],
                            ),
                            const Divider(),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 24.0),
                              child: Text(
                                'Nenhum banco cadastrado. Toque em \'Adicionar\'',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Observações',
                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                            ),
                            const SizedBox(height: 12.0),
                            _buildTextField(
                              controller: _model.obsFieldTextController!,
                              focusNode: _model.obsFieldFocusNode!,
                              label: 'Notas gerais...',
                              maxLines: 6,
                              textInputAction: TextInputAction.newline,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    ElevatedButton.icon(
                      onPressed: () async {
                        final String nome = _model.nomeFieldTextController?.text ?? '';
                        final String cpfCnpj = _model.cpfCnpjFieldTextController?.text ?? '';
                        final String ie = _model.ieFieldTextController?.text ?? '';
                        final String rg = _model.rgFieldTextController?.text ?? '';
                        final String endereco = _model.enderecoFieldTextController?.text ?? '';
                        final String numero = _model.numeroFieldTextController?.text ?? '';
                        final String bairro = _model.bairroFieldTextController?.text ?? '';
                        final String cidade = _model.cidadeFieldTextController?.text ?? '';
                        final String uf = _model.ufDropdownValue ?? '';
                        final String cep = _model.cepFieldTextController?.text ?? '';
                        final String telefone = _model.telefoneFieldTextController?.text ?? '';
                        final String email = _model.emailFieldTextController?.text ?? '';
                        final String tipo = _model.tipoPessoa ?? 'F';
                        final String fantas = _model.nomeFantasiaFieldTextController?.text ?? '';
                        final String observacoes = _model.obsFieldTextController?.text ?? '';

                        if (nome.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Razão Social é obrigatória.'), backgroundColor: Colors.red),
                          );
                          return;
                        }

                        try {
                          final bool isNovoCliente = widget.codigoCliente == 0;
                          final messenger = ScaffoldMessenger.of(context);

                          final String dbPath =
                              p.join(await getDatabasesPath(), 'dbforcacad001.db');
                          final db = await openDatabase(dbPath);

                          bool ehEdicao = (widget.codigoCliente > 0);
                          int idFinal = 0;

                          if (ehEdicao) {
                            idFinal = widget.codigoCliente;
                          } else {
                            final List<Map<String, dynamic>> res = await db.rawQuery('SELECT MAX(cli00_codigo) AS max_id FROM cadcli00');
                            idFinal = (res.isNotEmpty && res.first['max_id'] != null) ? (res.first['max_id'] as int) + 1 : 1;
                          }

                          await db.transaction((txn) async {
                            if (ehEdicao) {
                              // Se for edição, força o UPDATE explícito para não duplicar
                              await txn.rawUpdate('''
                                UPDATE cadcli00 SET 
                                  cli00_descri = ?, cli00_fantas = ?, cli00_endere = ?, cli00_endnum = ?, 
                                  cli00_bairro = ?, cli00_ciddes = ?, cli00_estsgl = ?, cli00_endcep = ?, 
                                  cli00_fonnum = ?, cli00_cpfcnp = ?, cli00_insest = ?, cli00_observ = ?, 
                                  cli00_pessoa = ?
                                WHERE cli00_codigo = ?
                              ''', [
                                nome.trim(),
                                fantas.trim(),
                                endereco.trim(),
                                numero.trim(),
                                bairro.trim(),
                                cidade.trim(),
                                uf.isNotEmpty ? uf : 'MA',
                                cep.replaceAll(RegExp(r'[^0-9]'), ''),
                                telefone.trim(),
                                cpfCnpj.replaceAll(RegExp(r'[^0-9]'), ''),
                                ie.trim(),
                                observacoes.trim(),
                                tipo.isNotEmpty ? tipo : 'F',
                                idFinal // ID passado no WHERE
                              ]);
                            } else {
                              // Se for novo, insere uma nova linha normalmente
                              await txn.rawInsert('''
                                INSERT INTO cadcli00 (
                                  cli00_codigo, cli00_descri, cli00_fantas, cli00_endere, cli00_endnum, 
                                  cli00_bairro, cli00_ciddes, cli00_estsgl, cli00_endcep, cli00_fonnum, 
                                  cli00_cpfcnp, cli00_insest, cli00_observ, cli00_pessoa, cli00_active, cli00_datcad
                                ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1, ?)
                              ''', [
                                idFinal,
                                nome.trim(),
                                fantas.trim(),
                                endereco.trim(),
                                numero.trim(),
                                bairro.trim(),
                                cidade.trim(),
                                uf.isNotEmpty ? uf : 'MA',
                                cep.replaceAll(RegExp(r'[^0-9]'), ''),
                                telefone.trim(),
                                cpfCnpj.replaceAll(RegExp(r'[^0-9]'), ''),
                                ie.trim(),
                                observacoes.trim(),
                                tipo.isNotEmpty ? tipo : 'F',
                                DateTime.now().toIso8601String()
                              ]);
                            }
                          });

                          await db.close();

                          messenger.showSnackBar(
                            const SnackBar(
                              content: Text('Cliente salvo com sucesso!'),
                              duration: Duration(seconds: 2),
                            ),
                          );

                          if (mounted) {
                            context.goNamed(ClientesPageWidget.routeName);
                          }
                        } catch (e, stack) {
                          debugPrint('[SQLite][ERRO] Falha ao salvar cliente: $e');
                          debugPrint('[SQLite][STACK] $stack');
                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Erro ao salvar cliente: $e'),
                              backgroundColor: Colors.red,
                              duration: const Duration(seconds: 4),
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.check, size: 20.0, color: Colors.white),
                      label: const Text(
                        'SALVAR CADASTRO',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5CB85C),
                        minimumSize: const Size(double.infinity, 50.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 3.0,
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
