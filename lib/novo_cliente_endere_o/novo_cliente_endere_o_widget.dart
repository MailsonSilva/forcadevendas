import '/components/button_widget.dart';
import '/components/checkbox_widget.dart';
import '/components/tab_item_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'novo_cliente_endere_o_model.dart';
export 'novo_cliente_endere_o_model.dart';

class NovoClienteEndereOWidget extends StatefulWidget {
  const NovoClienteEndereOWidget({super.key});

  static String routeName = 'NovoClienteEndereO';
  static String routePath = '/novoClienteEndereO';

  @override
  State<NovoClienteEndereOWidget> createState() =>
      _NovoClienteEndereOWidgetState();
}

class _NovoClienteEndereOWidgetState extends State<NovoClienteEndereOWidget> {
  late NovoClienteEndereOModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NovoClienteEndereOModel());
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
        backgroundColor: Color(0xFFDEE3E7),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF008ABD),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
                  child: Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back_rounded,
                              size: 24.0,
                            ),
                            Text(
                              'Novo Cliente',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    font: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                    lineHeight: 1.27,
                                  ),
                            ),
                          ].divide(SizedBox(width: 16.0)),
                        ),
                        wrapWithModel(
                          model: _model.buttonModel,
                          updateCallback: () => safeSetState(() {}),
                          child: ButtonWidget(
                            icon: Icon(
                              Icons.check_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            iconPresent: true,
                            iconEndPresent: false,
                            content: 'SALVAR',
                            variant: 'secondary',
                            size: 'small',
                            fullWidth: false,
                            loading: false,
                            disabled: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                shape: BoxShape.rectangle,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      wrapWithModel(
                        model: _model.tabItemModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: TabItemWidget(
                          label: 'Principal',
                          selected: false,
                        ),
                      ),
                      wrapWithModel(
                        model: _model.tabItemModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: TabItemWidget(
                          label: 'Endereço',
                          selected: true,
                        ),
                      ),
                      wrapWithModel(
                        model: _model.tabItemModel3,
                        updateCallback: () => safeSetState(() {}),
                        child: TabItemWidget(
                          label: 'Proprietário',
                          selected: false,
                        ),
                      ),
                      wrapWithModel(
                        model: _model.tabItemModel4,
                        updateCallback: () => safeSetState(() {}),
                        child: TabItemWidget(
                          label: 'Bancos e Obs',
                          selected: false,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternate,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          'Endereço',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                                lineHeight: 1.35,
                                              ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: wrapWithModel(
                                                model: _model.textFieldModel1,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: TextFieldWidget(
                                                  label: 'CEP',
                                                  labelPresent: true,
                                                  helper: '',
                                                  helperPresent: false,
                                                  leadingIconPresent: false,
                                                  trailingIconPresent: false,
                                                  hint: 'CEP',
                                                  value: '',
                                                  onChange: '',
                                                  onSubmit: '',
                                                  variant: 'outlined',
                                                  error: false,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 140.0,
                                              child: wrapWithModel(
                                                model: _model.textFieldModel2,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: TextFieldWidget(
                                                  label: 'Número',
                                                  labelPresent: true,
                                                  helper: '',
                                                  helperPresent: false,
                                                  leadingIconPresent: false,
                                                  trailingIconPresent: false,
                                                  hint: 'Número',
                                                  value: '',
                                                  onChange: '',
                                                  onSubmit: '',
                                                  variant: 'outlined',
                                                  error: false,
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 16.0)),
                                        ),
                                        wrapWithModel(
                                          model: _model.textFieldModel3,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: TextFieldWidget(
                                            label: 'Endereço',
                                            labelPresent: true,
                                            helper: '',
                                            helperPresent: false,
                                            leadingIconPresent: false,
                                            trailingIconPresent: false,
                                            hint: 'Endereço',
                                            value: '',
                                            onChange: '',
                                            onSubmit: '',
                                            variant: 'outlined',
                                            error: false,
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.textFieldModel4,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: TextFieldWidget(
                                            label: 'Bairro',
                                            labelPresent: true,
                                            helper: '',
                                            helperPresent: false,
                                            leadingIconPresent: false,
                                            trailingIconPresent: false,
                                            hint: 'Bairro',
                                            value: '',
                                            onChange: '',
                                            onSubmit: '',
                                            variant: 'outlined',
                                            error: false,
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: wrapWithModel(
                                                model: _model.textFieldModel5,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: TextFieldWidget(
                                                  label: 'Cidade',
                                                  labelPresent: true,
                                                  helper: '',
                                                  helperPresent: false,
                                                  leadingIconPresent: false,
                                                  trailingIconPresent: false,
                                                  hint: 'Cidade',
                                                  value: '',
                                                  onChange: '',
                                                  onSubmit: '',
                                                  variant: 'outlined',
                                                  error: false,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 80.0,
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .dropdownValueController ??=
                                                    FormFieldController<String>(
                                                  _model.dropdownValue ??= 'SP',
                                                ),
                                                options: [
                                                  'SP',
                                                  'RJ',
                                                  'MG',
                                                  'RS',
                                                  'PR'
                                                ],
                                                onChanged: (val) =>
                                                    safeSetState(() => _model
                                                        .dropdownValue = val),
                                                width: 200.0,
                                                height: 40.0,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                      lineHeight: 1.47,
                                                    ),
                                                hintText: 'UF',
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 2.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderWidth: 1.0,
                                                borderRadius: 8.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                hidesUnderline: true,
                                                isOverButton: false,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                                labelText: 'UF',
                                                labelTextStyle: FlutterFlowTheme
                                                        .of(context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                      lineHeight: 1.38,
                                                    ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 16.0)),
                                        ),
                                        wrapWithModel(
                                          model: _model.textFieldModel6,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: TextFieldWidget(
                                            label: 'Telefone',
                                            labelPresent: true,
                                            helper: '',
                                            helperPresent: false,
                                            leadingIconPresent: false,
                                            trailingIconPresent: false,
                                            hint: 'Telefone',
                                            value: '',
                                            onChange: '',
                                            onSubmit: '',
                                            variant: 'outlined',
                                            error: false,
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            wrapWithModel(
                                              model: _model.checkboxModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: CheckboxWidget(
                                                label:
                                                    'Usar Endereço de Entrega',
                                                subtitle:
                                                    'Receive weekly updates',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                isChecked: false,
                                                hasSubtitle: false,
                                                disabled: false,
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.checkboxModel2,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: CheckboxWidget(
                                                label: 'Endereço de Cobrança',
                                                subtitle:
                                                    'Receive weekly updates',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                isChecked: false,
                                                hasSubtitle: false,
                                                disabled: false,
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 8.0)),
                                        ),
                                      ].divide(SizedBox(height: 16.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
