import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
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

  static String routeName = 'FormClientesPage';
  static String routePath = '/clientes/form';

  @override
  State<FormClientesPageWidget> createState() => _FormClientesPageWidgetState();
}

class _FormClientesPageWidgetState extends State<FormClientesPageWidget> {
  late FormClientesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormClientesPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.clienteCodigo != '') {
        _model.isEdit = true;
        safeSetState(() {});
        _model.pageTitle = 'Editar Cliente';
        safeSetState(() {});
        _model.loadedCli = await actions.carregarClienteOffline(
          widget.clienteCodigo,
        );
        if (_model.loadedCli!.success) {
          _model.tipoPessoa = _model.loadedCli?.tipo;
          safeSetState(() {});
          _model.cidade = _model.loadedCli?.cidade;
          safeSetState(() {});
          _model.uf = _model.loadedCli?.uf;
          safeSetState(() {});
          _model.cliNome = _model.loadedCli?.nome;
          safeSetState(() {});
          _model.cliCpfCnpj = _model.loadedCli?.cpfCnpj;
          safeSetState(() {});
          _model.cliIe = _model.loadedCli?.ie;
          safeSetState(() {});
          _model.cliRg = _model.loadedCli?.rg;
          safeSetState(() {});
          _model.cliEmail = _model.loadedCli?.email;
          safeSetState(() {});
          _model.cliEndereco = _model.loadedCli?.endereco;
          safeSetState(() {});
          _model.cliNumero = _model.loadedCli?.numero;
          safeSetState(() {});
          _model.cliBairro = _model.loadedCli?.bairro;
          safeSetState(() {});
          _model.cliCep = _model.loadedCli?.cep;
          safeSetState(() {});
          _model.cliTelefone = _model.loadedCli?.telefone;
          safeSetState(() {});
          safeSetState(() {
            _model.nomeFieldTextController?.text = _model.loadedCli!.nome;
          });
          safeSetState(() {
            _model.cpfCnpjFieldTextController?.text = _model.loadedCli!.cpfCnpj;
          });
          safeSetState(() {
            _model.ieFieldTextController?.text = _model.loadedCli!.ie;
          });
          safeSetState(() {
            _model.rgFieldTextController?.text = _model.loadedCli!.rg;
          });
          safeSetState(() {
            _model.emailFieldTextController?.text = _model.loadedCli!.email;
          });
          safeSetState(() {
            _model.enderecoFieldTextController?.text =
                _model.loadedCli!.endereco;
          });
          safeSetState(() {
            _model.bairroFieldTextController?.text = _model.loadedCli!.bairro;
          });
          safeSetState(() {
            _model.cepFieldTextController?.text = _model.loadedCli!.cep;
          });
          safeSetState(() {
            _model.numeroFieldTextController?.text = _model.loadedCli!.numero;
          });
          safeSetState(() {
            _model.cidadeFieldTextController?.text = _model.loadedCli!.cidade;
          });
          safeSetState(() {
            _model.ufDropdownValueController?.value = _model.loadedCli!.uf;
            _model.ufDropdownValue = _model.loadedCli!.uf;
          });
          safeSetState(() {
            _model.telefoneFieldTextController?.text =
                _model.loadedCli!.telefone;
          });
        }
      } else {
        _model.isEdit = false;
        safeSetState(() {});
        _model.pageTitle = 'Novo Cliente';
        safeSetState(() {});
      }
    });

    _model.nomeFieldTextController ??= TextEditingController();
    _model.nomeFieldFocusNode ??= FocusNode();

    _model.cpfCnpjFieldTextController ??= TextEditingController();
    _model.cpfCnpjFieldFocusNode ??= FocusNode();

    _model.ieFieldTextController ??= TextEditingController();
    _model.ieFieldFocusNode ??= FocusNode();

    _model.rgFieldTextController ??= TextEditingController();
    _model.rgFieldFocusNode ??= FocusNode();

    _model.emailFieldTextController ??= TextEditingController();
    _model.emailFieldFocusNode ??= FocusNode();

    _model.enderecoFieldTextController ??= TextEditingController();
    _model.enderecoFieldFocusNode ??= FocusNode();

    _model.bairroFieldTextController ??= TextEditingController();
    _model.bairroFieldFocusNode ??= FocusNode();

    _model.cepFieldTextController ??= TextEditingController();
    _model.cepFieldFocusNode ??= FocusNode();

    _model.numeroFieldTextController ??= TextEditingController();
    _model.numeroFieldFocusNode ??= FocusNode();

    _model.cidadeFieldTextController ??= TextEditingController();
    _model.cidadeFieldFocusNode ??= FocusNode();

    _model.telefoneFieldTextController ??= TextEditingController();
    _model.telefoneFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: true,
          title: Text(
            _model.pageTitle!,
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.roboto(
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
                                    font: GoogleFonts.roboto(
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
                          _model.cleaned = await actions.cleanDoc(
                            _model.cpfCnpjFieldTextController.text,
                          );
                          if (functions.getLength(_model.cleaned) == 11) {
                            _model.tipoPessoa = 'F';
                            safeSetState(() {});
                            if (functions.getLength(_model.cleaned) == 14) {
                              _model.tipoPessoa = 'J';
                              safeSetState(() {});
                            }
                          }

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
                                  font: GoogleFonts.roboto(
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
                        _model.saveResult = await actions.salvarClienteOffline(
                          widget.clienteCodigo,
                          _model.nomeFieldTextController.text,
                          _model.cpfCnpjFieldTextController.text,
                          _model.ieFieldTextController.text,
                          _model.rgFieldTextController.text,
                          _model.emailFieldTextController.text,
                          _model.enderecoFieldTextController.text,
                          _model.numeroFieldTextController.text,
                          _model.bairroFieldTextController.text,
                          _model.cidadeFieldTextController.text,
                          _model.uf,
                          _model.cepFieldTextController.text,
                          _model.telefoneFieldTextController.text,
                          _model.tipoPessoa,
                        );
                        if (_model.saveResult!) {
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
                                'Erro ao salvar cliente localmente.',
                                style: TextStyle(),
                              ),
                              duration: Duration(milliseconds: 4000),
                            ),
                          );
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
                        color: FlutterFlowTheme.of(context).primary,
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
          ),
        ),
      ),
    );
  }
}
