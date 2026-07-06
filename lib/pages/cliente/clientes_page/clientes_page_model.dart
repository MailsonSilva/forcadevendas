import '/backend/schema/structs/index.dart';
<<<<<<< HEAD
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'clientes_page_widget.dart' show ClientesPageWidget;
import 'package:flutter/material.dart';
=======
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'clientes_page_widget.dart' show ClientesPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)

class ClientesPageModel extends FlutterFlowModel<ClientesPageWidget> {
  ///  Local state fields for this page.

  List<ClienteResultStruct> listaClientes = [];
  void addToListaClientes(ClienteResultStruct item) => listaClientes.add(item);
  void removeFromListaClientes(ClienteResultStruct item) =>
      listaClientes.remove(item);
  void removeAtIndexFromListaClientes(int index) =>
      listaClientes.removeAt(index);
  void insertAtIndexInListaClientes(int index, ClienteResultStruct item) =>
      listaClientes.insert(index, item);
  void updateListaClientesAtIndex(
          int index, Function(ClienteResultStruct) updateFn) =>
      listaClientes[index] = updateFn(listaClientes[index]);

  String? buscaCliente = '';

  bool? carregando = false;

<<<<<<< HEAD
=======
  List<Map<String, dynamic>> rawClientesList = [];

>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - PesquisaCliente] action in ClientesPage widget.
  List<ClienteResultStruct>? clientesIniciais;
  // State field(s) for BuscaClienteField widget.
  FocusNode? buscaClienteFieldFocusNode;
  TextEditingController? buscaClienteFieldTextController;
  String? Function(BuildContext, String?)?
      buscaClienteFieldTextControllerValidator;
  // Stores action output result for [Custom Action - PesquisaCliente] action in BuscaClienteField widget.
  List<ClienteResultStruct>? resultadoBusca;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    buscaClienteFieldFocusNode?.dispose();
    buscaClienteFieldTextController?.dispose();
  }
}
