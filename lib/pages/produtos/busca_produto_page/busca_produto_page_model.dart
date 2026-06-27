import '/backend/schema/structs/index.dart';
import '/components/drop_down/drop_down_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'busca_produto_page_widget.dart' show BuscaProdutoPageWidget;
import 'package:flutter/material.dart';

class BuscaProdutoPageModel extends FlutterFlowModel<BuscaProdutoPageWidget> {
  ///  Local state fields for this page.

  List<ProdutoResultStruct> listaProdutos = [];
  void addToListaProdutos(ProdutoResultStruct item) => listaProdutos.add(item);
  void removeFromListaProdutos(ProdutoResultStruct item) =>
      listaProdutos.remove(item);
  void removeAtIndexFromListaProdutos(int index) =>
      listaProdutos.removeAt(index);
  void insertAtIndexInListaProdutos(int index, ProdutoResultStruct item) =>
      listaProdutos.insert(index, item);
  void updateListaProdutosAtIndex(
          int index, Function(ProdutoResultStruct) updateFn) =>
      listaProdutos[index] = updateFn(listaProdutos[index]);

  int? offsetAtual = 0;

  String filtroLinha = ' ';

  String filtroGrupo = ' ';

  String filtroMarca = ' ';

  String filtroFabricante = ' ';

  bool filtroEstoque = false;

  bool filtroPromocao = false;

  bool isFiltroExpanded = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - buscaProduto] action in BuscaProdutoPage widget.
  List<ProdutoResultStruct>? resultadoInicial;
  // State field(s) for BuscaProdutoField widget.
  FocusNode? buscaProdutoFieldFocusNode;
  TextEditingController? buscaProdutoFieldTextController;
  String? Function(BuildContext, String?)?
      buscaProdutoFieldTextControllerValidator;
  // Stores action output result for [Custom Action - buscaProduto] action in BuscaProdutoField widget.
  List<ProdutoResultStruct>? resultadosBusca;
  // Model for DropDown component.
  late DropDownModel dropDownModel;

  @override
  void initState(BuildContext context) {
    dropDownModel = createModel(context, () => DropDownModel());
  }

  @override
  void dispose() {
    buscaProdutoFieldFocusNode?.dispose();
    buscaProdutoFieldTextController?.dispose();

    dropDownModel.dispose();
  }
}
