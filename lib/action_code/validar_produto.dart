// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
<<<<<<< HEAD
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

=======
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/backend/schema/structs/index.dart';
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)

Future<ValidationResultStruct> validarProduto(
  double precoUnitario,
  double saldoEstoque,
) async {
  if (precoUnitario <= 0) {
    return ValidationResultStruct(
      valido: false,
      mensagem: 'Produto indisponível: Produto sem preço de venda definido.',
    );
  }
  if (saldoEstoque <= 0) {
    return ValidationResultStruct(
      valido: false,
      mensagem: 'Estoque esgotado: O produto está com saldo zerado no momento.',
    );
  }
  return ValidationResultStruct(
    valido: true,
    mensagem: '',
  );
}
