import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _vendedor_codigo = prefs.getInt('ff_vendedor_codigo') ?? _vendedor_codigo;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  /// DSL app state vendedor_codigo
  int _vendedor_codigo = 0;
  int get vendedor_codigo => _vendedor_codigo;
  set vendedor_codigo(int value) {
    _vendedor_codigo = value;
    prefs.setInt('ff_vendedor_codigo', value);
  }

  /// DSL app state vendedor_nome
  String _vendedor_nome = '';
  String get vendedor_nome => _vendedor_nome;
  set vendedor_nome(String value) {
    _vendedor_nome = value;
  }

  /// DSL app state empresa_codigo
  String _empresa_codigo = '';
  String get empresa_codigo => _empresa_codigo;
  set empresa_codigo(String value) {
    _empresa_codigo = value;
  }

  /// DSL app state is_first_access
  bool _is_first_access = true;
  bool get is_first_access => _is_first_access;
  set is_first_access(bool value) {
    _is_first_access = value;
  }

  /// DSL app state is_loading
  bool _is_loading = false;
  bool get is_loading => _is_loading;
  set is_loading(bool value) {
    _is_loading = value;
  }

  /// DSL app state vendedor_logado_codigo
  int _vendedor_logado_codigo = 0;
  int get vendedor_logado_codigo => _vendedor_logado_codigo;
  set vendedor_logado_codigo(int value) {
    _vendedor_logado_codigo = value;
  }

  /// DSL app state vendedor_logado_nome
  String _vendedor_logado_nome = '';
  String get vendedor_logado_nome => _vendedor_logado_nome;
  set vendedor_logado_nome(String value) {
    _vendedor_logado_nome = value;
  }

  /// DSL app state pedido_numero
  int _pedido_numero = 0;
  int get pedido_numero => _pedido_numero;
  set pedido_numero(int value) {
    _pedido_numero = value;
  }

  /// DSL app state pedido_items_json
  String _pedido_items_json = '';
  String get pedido_items_json => _pedido_items_json;
  set pedido_items_json(String value) {
    _pedido_items_json = value;
  }

  /// DSL app state quantidade_item
  int _quantidade_item = 1;
  int get quantidade_item => _quantidade_item;
  set quantidade_item(int value) {
    _quantidade_item = value;
  }

  /// DSL app state produto_selecionado_codigo
  String _produto_selecionado_codigo = '';
  String get produto_selecionado_codigo => _produto_selecionado_codigo;
  set produto_selecionado_codigo(String value) {
    _produto_selecionado_codigo = value;
  }

  /// DSL app state produto_selecionado_descricao
  String _produto_selecionado_descricao = '';
  String get produto_selecionado_descricao => _produto_selecionado_descricao;
  set produto_selecionado_descricao(String value) {
    _produto_selecionado_descricao = value;
  }

  /// DSL app state produto_selecionado_preco
  double _produto_selecionado_preco = 0.0;
  double get produto_selecionado_preco => _produto_selecionado_preco;
  set produto_selecionado_preco(double value) {
    _produto_selecionado_preco = value;
  }

  /// DSL app state produto_selecionado_saldo
  double _produto_selecionado_saldo = 0.0;
  double get produto_selecionado_saldo => _produto_selecionado_saldo;
  set produto_selecionado_saldo(double value) {
    _produto_selecionado_saldo = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
