class PedidoContext {
  static final PedidoContext _instance = PedidoContext._internal();
  factory PedidoContext() => _instance;
  PedidoContext._internal();

  int? clienteCodigo;
  String? clienteNome;
  String? clienteCpfCnpj;
  double? clienteLimiteCredito;
  double? clienteSaldoDevedor;

  void injectCliente({
    required int codigo,
    required String nome,
    required String cpfCnpj,
    required double limiteCredito,
    required double saldoDevedor,
  }) {
    clienteCodigo = codigo;
    clienteNome = nome;
    clienteCpfCnpj = cpfCnpj;
    clienteLimiteCredito = limiteCredito;
    clienteSaldoDevedor = saldoDevedor;
  }

  void clear() {
    clienteCodigo = null;
    clienteNome = null;
    clienteCpfCnpj = null;
    clienteLimiteCredito = null;
    clienteSaldoDevedor = null;
  }
}
