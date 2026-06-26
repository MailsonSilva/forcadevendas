import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'form_clientes_page_widget.dart' show FormClientesPageWidget;
import 'package:flutter/material.dart';

class FormClientesPageModel extends FlutterFlowModel<FormClientesPageWidget> {
  ///  Local state fields for this page.

  bool? isEdit = false;

  String? pageTitle = 'Novo Cliente';

  String? tipoPessoa = 'F';

  String? cidade = '';

  String? uf = 'SP';

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
  ClienteResultStruct? loadedCli;
  // State field(s) for NomeField widget.
  FocusNode? nomeFieldFocusNode;
  TextEditingController? nomeFieldTextController;
  String? Function(BuildContext, String?)? nomeFieldTextControllerValidator;
  // State field(s) for CpfCnpjField widget.
  FocusNode? cpfCnpjFieldFocusNode;
  TextEditingController? cpfCnpjFieldTextController;
  String? Function(BuildContext, String?)? cpfCnpjFieldTextControllerValidator;
  // Stores action output result for [Custom Action - CleanDoc] action in CpfCnpjField widget.
  String? cleaned;
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
  bool? saveResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeFieldFocusNode?.dispose();
    nomeFieldTextController?.dispose();

    cpfCnpjFieldFocusNode?.dispose();
    cpfCnpjFieldTextController?.dispose();

    ieFieldFocusNode?.dispose();
    ieFieldTextController?.dispose();

    rgFieldFocusNode?.dispose();
    rgFieldTextController?.dispose();

    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();

    enderecoFieldFocusNode?.dispose();
    enderecoFieldTextController?.dispose();

    bairroFieldFocusNode?.dispose();
    bairroFieldTextController?.dispose();

    cepFieldFocusNode?.dispose();
    cepFieldTextController?.dispose();

    numeroFieldFocusNode?.dispose();
    numeroFieldTextController?.dispose();

    cidadeFieldFocusNode?.dispose();
    cidadeFieldTextController?.dispose();

    telefoneFieldFocusNode?.dispose();
    telefoneFieldTextController?.dispose();
  }
}
