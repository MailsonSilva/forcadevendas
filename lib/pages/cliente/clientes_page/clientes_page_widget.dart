import '/backend/schema/structs/index.dart';
<<<<<<< HEAD
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
=======
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< HEAD
=======
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
import 'clientes_page_model.dart';
export 'clientes_page_model.dart';

/// Consulta de clientes cadastrados.
class ClientesPageWidget extends StatefulWidget {
  const ClientesPageWidget({super.key});

  static String routeName = 'ClientesPage';
  static String routePath = '/clientes';

  @override
  State<ClientesPageWidget> createState() => _ClientesPageWidgetState();
}

class _ClientesPageWidgetState extends State<ClientesPageWidget> {
  late ClientesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

<<<<<<< HEAD
=======
  Future<void> _reloadClientes() async {
    try {
      final db = await openDatabase(p.join(await getDatabasesPath(), 'dbforcacad001.db'));
      final results = await db.rawQuery('SELECT * FROM cadcli00 ORDER BY cli00_descri');
      _model.rawClientesList = results;
      _model.listaClientes = results.map((m) => ClienteResultStruct.fromMap({
        'codigo': m['cli00_codigo']?.toString() ?? '',
        'nome': m['cli00_descri']?.toString() ?? '',
        'tipo': m['cli00_pessoa']?.toString() ?? '',
        'cpfCnpj': m['cli00_cpfcnp']?.toString() ?? '',
        'ie': m['cli00_insest']?.toString() ?? '',
        'rg': m['cli00_rg']?.toString() ?? '',
        'endereco': m['cli00_endere']?.toString() ?? '',
        'numero': m['cli00_endnum']?.toString() ?? '',
        'bairro': m['cli00_bairro']?.toString() ?? '',
        'cidade': m['cli00_ciddes']?.toString() ?? '',
        'uf': m['cli00_estsgl']?.toString() ?? '',
        'cep': m['cli00_endcep']?.toString() ?? '',
        'telefone': m['cli00_fonnum']?.toString() ?? '',
        'email': m['cli00_observ']?.toString() ?? '',
      })).toList();
      await db.close();
    } catch (e) {
      print('Erro ao carregar clientes do SQLite: $e');
    }
    safeSetState(() {});
  }

  Future<void> _searchClientes(String textoBusca) async {
    try {
      final db = await openDatabase(p.join(await getDatabasesPath(), 'dbforcacad001.db'));
      final List<Map<String, dynamic>> results;

      final String busca = textoBusca.trim();

      if (busca.isEmpty) {
        results = await db.rawQuery('SELECT * FROM cadcli00 ORDER BY cli00_descri');
      } else {
        // Busca funcional por Razão Social ou Nome Fantasia
        results = await db.rawQuery(
          'SELECT * FROM cadcli00 WHERE cli00_descri LIKE ? OR cli00_fantas LIKE ? ORDER BY cli00_descri',
          ['%$busca%', '%$busca%']
        );
      }

      _model.rawClientesList = results;
      _model.listaClientes = results.map((m) => ClienteResultStruct.fromMap({
        'codigo': m['cli00_codigo']?.toString() ?? '',
        'nome': m['cli00_descri']?.toString() ?? '',
        'tipo': m['cli00_pessoa']?.toString() ?? '',
        'cpfCnpj': m['cli00_cpfcnp']?.toString() ?? '',
        'ie': m['cli00_insest']?.toString() ?? '',
        'rg': m['cli00_rg']?.toString() ?? '',
        'endereco': m['cli00_endere']?.toString() ?? '',
        'numero': m['cli00_endnum']?.toString() ?? '',
        'bairro': m['cli00_bairro']?.toString() ?? '',
        'cidade': m['cli00_ciddes']?.toString() ?? '',
        'uf': m['cli00_estsgl']?.toString() ?? '',
        'cep': m['cli00_endcep']?.toString() ?? '',
        'telefone': m['cli00_fonnum']?.toString() ?? '',
        'email': m['cli00_observ']?.toString() ?? '',
      })).toList();

      await db.close();
    } catch (e) {
      print('[SQLite] Erro na pesquisa de clientes: $e');
    }
    safeSetState(() {});
  }

>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientesPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
<<<<<<< HEAD
      _model.clientesIniciais = await actions.pesquisaCliente(
        '',
        0,
      );
      _model.listaClientes =
          _model.clientesIniciais!.toList().cast<ClienteResultStruct>();
      safeSetState(() {});
=======
      await _reloadClientes();
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
    });

    _model.buscaClienteFieldTextController ??= TextEditingController();
    _model.buscaClienteFieldFocusNode ??= FocusNode();
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
<<<<<<< HEAD
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: true,
          title: Text(
            'Clientes',
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              buttonSize: 40.0,
              icon: Icon(
                Icons.person_add,
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed(FormClientesPageWidget.routeName);
              },
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: _model.buscaClienteFieldTextController,
                        focusNode: _model.buscaClienteFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.buscaClienteFieldTextController',
                          Duration(milliseconds: 2000),
                          () async {
                            _model.buscaCliente =
                                _model.buscaClienteFieldTextController.text;
                            safeSetState(() {});
                            _model.resultadoBusca =
                                await actions.pesquisaCliente(
                              _model.buscaClienteFieldTextController.text,
                              0,
                            );
                            _model.listaClientes = _model.resultadoBusca!
                                .toList()
                                .cast<ClienteResultStruct>();
                            safeSetState(() {});

                            safeSetState(() {});
                          },
                        ),
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Pesquisa de Clientes',
                          hintText: 'Buscar por nome ou razão social...',
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
                        validator: _model
                            .buscaClienteFieldTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Builder(
                      builder: (context) {
                        final listaCliente = _model.listaClientes.toList();

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          primary: false,
                          scrollDirection: Axis.vertical,
                          itemCount: listaCliente.length,
                          separatorBuilder: (_, __) => SizedBox(height: 0.0),
                          itemBuilder: (context, listaClienteIndex) {
                            final listaClienteItem =
                                listaCliente[listaClienteIndex];
                            return Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      listaClienteItem.nome,
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontStyle,
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.badge,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 14.0,
                                        ),
                                        Text(
                                          listaClienteItem.cpfCnpj,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        Icon(
                                          Icons.location_city,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 14.0,
                                        ),
                                        Text(
                                          listaClienteItem.cidade,
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontStyle,
                                              ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ].divide(SizedBox(height: 0.0)),
=======
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Dark Blue Header Container
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back, color: Colors.white),
                              onPressed: () => Navigator.pop(context),
                            ),
                            Text(
                              'Clientes (${_model.listaClientes.length})',
                              style: FlutterFlowTheme.of(context).headlineMedium.override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    color: Colors.white,
                                    fontSize: 22.0,
                                  ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.person_add_alt_1, color: Colors.white, size: 26.0),
                          onPressed: () async {
                            final result = await context.pushNamed(FormClientesPageWidget.routeName);
                            if (result == true) {
                              await _reloadClientes();
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Search Bar Container (expanded width)
              Container(
                padding: const EdgeInsets.all(16.0),
                color: FlutterFlowTheme.of(context).primaryBackground,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _model.buscaClienteFieldTextController,
                        focusNode: _model.buscaClienteFieldFocusNode,
                        onChanged: (textoBusca) {
                            EasyDebounce.debounce(
                              '_busca_clientes_debounce',
                              const Duration(milliseconds: 350),
                              () => _searchClientes(textoBusca),
                            );
                          },
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Pesquisa de Clientes',
                          hintText: 'Buscar por Razão ou Fantasia...',
                          prefixIcon: Icon(
                            Icons.search,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          suffixIcon: _model.buscaClienteFieldTextController!.text.isNotEmpty
                              ? IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    color: FlutterFlowTheme.of(context).secondaryText,
                                    size: 18.0,
                                  ),
                                  onPressed: () {
                                    _model.buscaClienteFieldTextController!.clear();
                                    _searchClientes('');
                                  },
                                )
                              : null,
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
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator: _model.buscaClienteFieldTextControllerValidator.asValidator(context),
                      ),
                    ),
                  ],
                ),
              ),

              // ListView Grid/Card items
              Expanded(
                child: Builder(
                  builder: (context) {
                    final listaCliente = _model.listaClientes.toList();

                    if (listaCliente.isEmpty) {
                      return Center(
                        child: Text(
                          'Nenhum cliente cadastrado.',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      );
                    }

                    return ListView.separated(
                      padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 16.0),
                      primary: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listaCliente.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 0.0),
                      itemBuilder: (context, listaClienteIndex) {
                        final listaClienteItem = listaCliente[listaClienteIndex];
                        final clienteMap = _model.rawClientesList[listaClienteIndex];
                        return InkWell(
                          onTap: () async {
                            // Garante que o código do cliente seja extraído estritamente como um número inteiro (int)
                            final int codigoCli = int.parse(listaClienteItem.codigo.toString());
                            
                            // Navega para a tela de DETALHES consolidada do cliente
                            await context.pushNamed(
                              DetalheClientePageWidget.routeName,
                              queryParameters: {
                                'codigoCliente': codigoCli.toString(),
                              }.cleanNulls,
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.04),
                                  blurRadius: 6.0,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
                                    radius: 22.0,
                                    child: Text(
                                      listaClienteItem.nome.isNotEmpty
                                          ? listaClienteItem.nome[0].toUpperCase()
                                          : 'C',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context).primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 14.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          listaClienteItem.nome,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                        ),
                                        const SizedBox(height: 4.0),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.badge_outlined,
                                              color: FlutterFlowTheme.of(context).secondaryText,
                                              size: 14.0,
                                            ),
                                            const SizedBox(width: 4.0),
                                            Text(
                                              listaClienteItem.cpfCnpj.isNotEmpty
                                                  ? listaClienteItem.cpfCnpj
                                                  : 'Sem CPF/CNPJ',
                                              style: FlutterFlowTheme.of(context).bodySmall,
                                            ),
                                            const SizedBox(width: 12.0),
                                            Icon(
                                              Icons.location_on_outlined,
                                              color: FlutterFlowTheme.of(context).secondaryText,
                                              size: 14.0,
                                            ),
                                            const SizedBox(width: 4.0),
                                            Expanded(
                                              child: Text(
                                                listaClienteItem.cidade.isNotEmpty
                                                    ? '${listaClienteItem.cidade} - ${listaClienteItem.uf}'
                                                    : 'Sem cidade',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: FlutterFlowTheme.of(context).bodySmall,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: FlutterFlowTheme.of(context).secondaryText,
                                    size: 14.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
