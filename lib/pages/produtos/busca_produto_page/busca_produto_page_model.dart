import '/backend/schema/structs/index.dart';
import '/components/drop_down/drop_down_widget.dart';
import '/components/loading/loading_widget.dart';
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

  String filtroLinha = '';

  String filtroGrupo = '';

  String filtroMarca = '';

  String filtroFabricante = '';

  bool filtroEstoque = false;

  bool filtroPromocao = false;

  bool isFiltroExpanded = false;

  String? filtroDataEntrada = 'Todas';

  bool dadosCarregados = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - buscaProduto] action in BuscaProdutoPage widget.
  List<ProdutoResultStruct>? listaProdutosON;
  // Stores action output result for [Custom Action - carregarFiltros] action in BuscaProdutoPage widget.
  List<ListaPadraoStruct>? listaLinha;
  // Stores action output result for [Custom Action - carregarFiltros] action in BuscaProdutoPage widget.
  List<ListaPadraoStruct>? listaGrupo;
  // Stores action output result for [Custom Action - carregarFiltros] action in BuscaProdutoPage widget.
  List<ListaPadraoStruct>? listaFab;
  // Stores action output result for [Custom Action - carregarFiltros] action in BuscaProdutoPage widget.
  List<ListaPadraoStruct>? listaMarca;
  // State field(s) for BuscaProdutoField widget.
  FocusNode? buscaProdutoFieldFocusNode;
  TextEditingController? buscaProdutoFieldTextController;
  String? Function(BuildContext, String?)?
      buscaProdutoFieldTextControllerValidator;
  // Stores action output result for [Custom Action - buscaProduto] action in BuscaProdutoField widget.
  List<ProdutoResultStruct>? resultadoBusca;
  // Model for FiltroLinha.
  late DropDownModel filtroLinhaModel;
  // Model for FiltroGrupo.
  late DropDownModel filtroGrupoModel;
  // Model for FiltroFabricante.
  late DropDownModel filtroFabricanteModel;
  // Model for FiltroMarca.
  late DropDownModel filtroMarcaModel;
  // Model for FiltroDataEnt.
  late DropDownModel filtroDataEntModel;
  // State field(s) for CheckboxPromo widget.
  bool? checkboxPromoValue;
  // State field(s) for CheckboxEstoque widget.
  bool? checkboxEstoqueValue;
  // Model for Loading component.
  late LoadingModel loadingModel1;
  // Model for Loading component.
  late LoadingModel loadingModel2;

  @override
  void initState(BuildContext context) {
    filtroLinhaModel = createModel(context, () => DropDownModel());
    filtroGrupoModel = createModel(context, () => DropDownModel());
    filtroFabricanteModel = createModel(context, () => DropDownModel());
    filtroMarcaModel = createModel(context, () => DropDownModel());
    filtroDataEntModel = createModel(context, () => DropDownModel());
    loadingModel1 = createModel(context, () => LoadingModel());
    loadingModel2 = createModel(context, () => LoadingModel());
  }

  @override
  void dispose() {
    buscaProdutoFieldFocusNode?.dispose();
    buscaProdutoFieldTextController?.dispose();

    filtroLinhaModel.dispose();
    filtroGrupoModel.dispose();
    filtroFabricanteModel.dispose();
    filtroMarcaModel.dispose();
    filtroDataEntModel.dispose();
    loadingModel1.dispose();
    loadingModel2.dispose();
  }
}
