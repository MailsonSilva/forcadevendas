import '/backend/schema/structs/index.dart';
<<<<<<< HEAD
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'form_clientes_page_widget.dart' show FormClientesPageWidget;
import 'package:flutter/material.dart';

class FormClientesPageModel extends FlutterFlowModel<FormClientesPageWidget> {
  ///  Local state fields for this page.

  bool? isEdit = false;

  String? pageTitle = '';

  String? tipoPessoa = 'F';

  String? cidade = '';

  String? uf = '';

  String? cliNome = '';

  String? cliCpfCnpj = '';

  String? cliIe = '';

  String? cliRg = '';

  String? cliEmail = '';

  String? cliEndereco = '';

  String? cliNumero = '';

  String? cliBairro = '';

  String? cliCep = '';

  String? cliTelefone = '';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - CarregarClienteOffline] action in FormClientesPage widget.
  ClienteResultStruct? dadosCliente;
  // State field(s) for NomeField widget.
  FocusNode? nomeFieldFocusNode;
  TextEditingController? nomeFieldTextController;
  String? Function(BuildContext, String?)? nomeFieldTextControllerValidator;
  // State field(s) for CpfCnpjField widget.
  FocusNode? cpfCnpjFieldFocusNode;
  TextEditingController? cpfCnpjFieldTextController;
  String? Function(BuildContext, String?)? cpfCnpjFieldTextControllerValidator;
  // State field(s) for IeField widget.
  FocusNode? ieFieldFocusNode;
  TextEditingController? ieFieldTextController;
  String? Function(BuildContext, String?)? ieFieldTextControllerValidator;
  // State field(s) for RgField widget.
  FocusNode? rgFieldFocusNode;
  TextEditingController? rgFieldTextController;
  String? Function(BuildContext, String?)? rgFieldTextControllerValidator;
  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;
  // State field(s) for EnderecoField widget.
  FocusNode? enderecoFieldFocusNode;
  TextEditingController? enderecoFieldTextController;
  String? Function(BuildContext, String?)? enderecoFieldTextControllerValidator;
  // State field(s) for BairroField widget.
  FocusNode? bairroFieldFocusNode;
  TextEditingController? bairroFieldTextController;
  String? Function(BuildContext, String?)? bairroFieldTextControllerValidator;
  // State field(s) for CepField widget.
  FocusNode? cepFieldFocusNode;
  TextEditingController? cepFieldTextController;
  String? Function(BuildContext, String?)? cepFieldTextControllerValidator;
  // State field(s) for NumeroField widget.
  FocusNode? numeroFieldFocusNode;
  TextEditingController? numeroFieldTextController;
  String? Function(BuildContext, String?)? numeroFieldTextControllerValidator;
  // State field(s) for CidadeField widget.
  FocusNode? cidadeFieldFocusNode;
  TextEditingController? cidadeFieldTextController;
  String? Function(BuildContext, String?)? cidadeFieldTextControllerValidator;
  // State field(s) for UfDropdown widget.
  String? ufDropdownValue;
  FormFieldController<String>? ufDropdownValueController;
  // State field(s) for TelefoneField widget.
  FocusNode? telefoneFieldFocusNode;
  TextEditingController? telefoneFieldTextController;
  String? Function(BuildContext, String?)? telefoneFieldTextControllerValidator;
  // Stores action output result for [Custom Action - SalvarClienteOffline] action in Button widget.
=======
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'form_clientes_page_widget.dart' show FormClientesPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FormClientesPageModel extends FlutterFlowModel<FormClientesPageWidget> {
  ///  Local state fields for this page.
  bool? isEdit = false;
  String? pageTitle = '';
  String? tipoPessoa = 'F';
  String? cidade = '';
  String? uf = '';
  String? cliNome = '';
  String? cliCpfCnpj = '';
  String? cliIe = '';
  String? cliRg = '';
  String? cliEmail = '';
  String? cliEndereco = '';
  String? cliNumero = '';
  String? cliBairro = '';
  String? cliCep = '';
  String? cliTelefone = '';

  bool usarEntrega = false;
  bool usarCobranca = false;

  ///  State fields for stateful widgets in this page.
  ClienteResultStruct? dadosCliente;

  // Tab 1: Principal
  FocusNode? nomeFieldFocusNode;
  TextEditingController? nomeFieldTextController;
  String? Function(BuildContext, String?)? nomeFieldTextControllerValidator;

  FocusNode? nomeFantasiaFieldFocusNode;
  TextEditingController? nomeFantasiaFieldTextController;
  String? Function(BuildContext, String?)? nomeFantasiaFieldTextControllerValidator;

  FocusNode? cpfCnpjFieldFocusNode;
  TextEditingController? cpfCnpjFieldTextController;
  String? Function(BuildContext, String?)? cpfCnpjFieldTextControllerValidator;

  FocusNode? ieFieldFocusNode;
  TextEditingController? ieFieldTextController;
  String? Function(BuildContext, String?)? ieFieldTextControllerValidator;

  FocusNode? rgFieldFocusNode;
  TextEditingController? rgFieldTextController;
  String? Function(BuildContext, String?)? rgFieldTextControllerValidator;

  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;

  FocusNode? ramoFieldFocusNode;
  TextEditingController? ramoFieldTextController;
  String? Function(BuildContext, String?)? ramoFieldTextControllerValidator;

  FocusNode? limiteCreditoFieldFocusNode;
  TextEditingController? limiteCreditoFieldTextController;
  String? Function(BuildContext, String?)? limiteCreditoFieldTextControllerValidator;

  // Tab 2: Endereço
  FocusNode? cepFieldFocusNode;
  TextEditingController? cepFieldTextController;
  String? Function(BuildContext, String?)? cepFieldTextControllerValidator;

  FocusNode? numeroFieldFocusNode;
  TextEditingController? numeroFieldTextController;
  String? Function(BuildContext, String?)? numeroFieldTextControllerValidator;

  FocusNode? enderecoFieldFocusNode;
  TextEditingController? enderecoFieldTextController;
  String? Function(BuildContext, String?)? enderecoFieldTextControllerValidator;

  FocusNode? bairroFieldFocusNode;
  TextEditingController? bairroFieldTextController;
  String? Function(BuildContext, String?)? bairroFieldTextControllerValidator;

  FocusNode? cidadeFieldFocusNode;
  TextEditingController? cidadeFieldTextController;
  String? Function(BuildContext, String?)? cidadeFieldTextControllerValidator;

  String? ufDropdownValue;
  FormFieldController<String>? ufDropdownValueController;

  FocusNode? telefoneFieldFocusNode;
  TextEditingController? telefoneFieldTextController;
  String? Function(BuildContext, String?)? telefoneFieldTextControllerValidator;

  // Tab 3: Proprietário
  FocusNode? propNomeFieldFocusNode;
  TextEditingController? propNomeFieldTextController;

  FocusNode? propEnderecoFieldFocusNode;
  TextEditingController? propEnderecoFieldTextController;

  FocusNode? propBairroFieldFocusNode;
  TextEditingController? propBairroFieldTextController;

  FocusNode? propCidadeFieldFocusNode;
  TextEditingController? propCidadeFieldTextController;

  String? propUfDropdownValue;
  FormFieldController<String>? propUfDropdownValueController;

  FocusNode? propRgFieldFocusNode;
  TextEditingController? propRgFieldTextController;

  FocusNode? propCpfFieldFocusNode;
  TextEditingController? propCpfFieldTextController;

  FocusNode? conjNomeFieldFocusNode;
  TextEditingController? conjNomeFieldTextController;

  FocusNode? conjRgFieldFocusNode;
  TextEditingController? conjRgFieldTextController;

  FocusNode? conjCpfFieldFocusNode;
  TextEditingController? conjCpfFieldTextController;

  // Tab 4: Bancos e Obs
  FocusNode? obsFieldFocusNode;
  TextEditingController? obsFieldTextController;

>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
  ClienteResultStruct? resultadoSalvar;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeFieldFocusNode?.dispose();
    nomeFieldTextController?.dispose();

<<<<<<< HEAD
=======
    nomeFantasiaFieldFocusNode?.dispose();
    nomeFantasiaFieldTextController?.dispose();

>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
    cpfCnpjFieldFocusNode?.dispose();
    cpfCnpjFieldTextController?.dispose();

    ieFieldFocusNode?.dispose();
    ieFieldTextController?.dispose();

    rgFieldFocusNode?.dispose();
    rgFieldTextController?.dispose();

    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();

<<<<<<< HEAD
    enderecoFieldFocusNode?.dispose();
    enderecoFieldTextController?.dispose();

    bairroFieldFocusNode?.dispose();
    bairroFieldTextController?.dispose();
=======
    ramoFieldFocusNode?.dispose();
    ramoFieldTextController?.dispose();

    limiteCreditoFieldFocusNode?.dispose();
    limiteCreditoFieldTextController?.dispose();
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)

    cepFieldFocusNode?.dispose();
    cepFieldTextController?.dispose();

    numeroFieldFocusNode?.dispose();
    numeroFieldTextController?.dispose();

<<<<<<< HEAD
=======
    enderecoFieldFocusNode?.dispose();
    enderecoFieldTextController?.dispose();

    bairroFieldFocusNode?.dispose();
    bairroFieldTextController?.dispose();

>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
    cidadeFieldFocusNode?.dispose();
    cidadeFieldTextController?.dispose();

    telefoneFieldFocusNode?.dispose();
    telefoneFieldTextController?.dispose();
<<<<<<< HEAD
=======

    propNomeFieldFocusNode?.dispose();
    propNomeFieldTextController?.dispose();

    propEnderecoFieldFocusNode?.dispose();
    propEnderecoFieldTextController?.dispose();

    propBairroFieldFocusNode?.dispose();
    propBairroFieldTextController?.dispose();

    propCidadeFieldFocusNode?.dispose();
    propCidadeFieldTextController?.dispose();

    propRgFieldFocusNode?.dispose();
    propRgFieldTextController?.dispose();

    propCpfFieldFocusNode?.dispose();
    propCpfFieldTextController?.dispose();

    conjNomeFieldFocusNode?.dispose();
    conjNomeFieldTextController?.dispose();

    conjRgFieldFocusNode?.dispose();
    conjRgFieldTextController?.dispose();

    conjCpfFieldFocusNode?.dispose();
    conjCpfFieldTextController?.dispose();

    obsFieldFocusNode?.dispose();
    obsFieldTextController?.dispose();
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
  }
}
