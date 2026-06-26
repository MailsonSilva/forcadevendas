// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// DSL struct ItemPedido
class ItemPedidoStruct extends BaseStruct {
  ItemPedidoStruct({
    /// ItemPedido.codigo_produto
    String? codigoProduto,

    /// ItemPedido.descricao
    String? descricao,

    /// ItemPedido.unidade
    String? unidade,

    /// ItemPedido.preco_unitario
    double? precoUnitario,

    /// ItemPedido.quantidade
    double? quantidade,

    /// ItemPedido.total_item
    double? totalItem,
  })  : _codigoProduto = codigoProduto,
        _descricao = descricao,
        _unidade = unidade,
        _precoUnitario = precoUnitario,
        _quantidade = quantidade,
        _totalItem = totalItem;

  // "codigo_produto" field.
  String? _codigoProduto;
  String get codigoProduto => _codigoProduto ?? '';
  set codigoProduto(String? val) => _codigoProduto = val;

  bool hasCodigoProduto() => _codigoProduto != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  set descricao(String? val) => _descricao = val;

  bool hasDescricao() => _descricao != null;

  // "unidade" field.
  String? _unidade;
  String get unidade => _unidade ?? '';
  set unidade(String? val) => _unidade = val;

  bool hasUnidade() => _unidade != null;

  // "preco_unitario" field.
  double? _precoUnitario;
  double get precoUnitario => _precoUnitario ?? 0.0;
  set precoUnitario(double? val) => _precoUnitario = val;

  void incrementPrecoUnitario(double amount) =>
      precoUnitario = precoUnitario + amount;

  bool hasPrecoUnitario() => _precoUnitario != null;

  // "quantidade" field.
  double? _quantidade;
  double get quantidade => _quantidade ?? 0.0;
  set quantidade(double? val) => _quantidade = val;

  void incrementQuantidade(double amount) => quantidade = quantidade + amount;

  bool hasQuantidade() => _quantidade != null;

  // "total_item" field.
  double? _totalItem;
  double get totalItem => _totalItem ?? 0.0;
  set totalItem(double? val) => _totalItem = val;

  void incrementTotalItem(double amount) => totalItem = totalItem + amount;

  bool hasTotalItem() => _totalItem != null;

  static ItemPedidoStruct fromMap(Map<String, dynamic> data) =>
      ItemPedidoStruct(
        codigoProduto: data['codigo_produto'] as String?,
        descricao: data['descricao'] as String?,
        unidade: data['unidade'] as String?,
        precoUnitario: castToType<double>(data['preco_unitario']),
        quantidade: castToType<double>(data['quantidade']),
        totalItem: castToType<double>(data['total_item']),
      );

  static ItemPedidoStruct? maybeFromMap(dynamic data) => data is Map
      ? ItemPedidoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'codigo_produto': _codigoProduto,
        'descricao': _descricao,
        'unidade': _unidade,
        'preco_unitario': _precoUnitario,
        'quantidade': _quantidade,
        'total_item': _totalItem,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'codigo_produto': serializeParam(
          _codigoProduto,
          ParamType.String,
        ),
        'descricao': serializeParam(
          _descricao,
          ParamType.String,
        ),
        'unidade': serializeParam(
          _unidade,
          ParamType.String,
        ),
        'preco_unitario': serializeParam(
          _precoUnitario,
          ParamType.double,
        ),
        'quantidade': serializeParam(
          _quantidade,
          ParamType.double,
        ),
        'total_item': serializeParam(
          _totalItem,
          ParamType.double,
        ),
      }.withoutNulls;

  static ItemPedidoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemPedidoStruct(
        codigoProduto: deserializeParam(
          data['codigo_produto'],
          ParamType.String,
          false,
        ),
        descricao: deserializeParam(
          data['descricao'],
          ParamType.String,
          false,
        ),
        unidade: deserializeParam(
          data['unidade'],
          ParamType.String,
          false,
        ),
        precoUnitario: deserializeParam(
          data['preco_unitario'],
          ParamType.double,
          false,
        ),
        quantidade: deserializeParam(
          data['quantidade'],
          ParamType.double,
          false,
        ),
        totalItem: deserializeParam(
          data['total_item'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ItemPedidoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemPedidoStruct &&
        codigoProduto == other.codigoProduto &&
        descricao == other.descricao &&
        unidade == other.unidade &&
        precoUnitario == other.precoUnitario &&
        quantidade == other.quantidade &&
        totalItem == other.totalItem;
  }

  @override
  int get hashCode => const ListEquality().hash([
        codigoProduto,
        descricao,
        unidade,
        precoUnitario,
        quantidade,
        totalItem
      ]);
}

ItemPedidoStruct createItemPedidoStruct({
  String? codigoProduto,
  String? descricao,
  String? unidade,
  double? precoUnitario,
  double? quantidade,
  double? totalItem,
}) =>
    ItemPedidoStruct(
      codigoProduto: codigoProduto,
      descricao: descricao,
      unidade: unidade,
      precoUnitario: precoUnitario,
      quantidade: quantidade,
      totalItem: totalItem,
    );
