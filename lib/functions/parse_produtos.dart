import 'dart:convert';
<<<<<<< HEAD

=======
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
import '/backend/schema/structs/index.dart';

/// DSL custom function parseProdutos
List<ProdutoResultStruct>? parseProdutos(String? jsonStr) {
  if (jsonStr == null || jsonStr.isEmpty) return [];
  try {
    final decoded = jsonDecode(jsonStr);
    if (decoded is! List) return [];
    return decoded
        .map((item) => ProdutoResultStruct.fromMap({
              'codigo': item['codigo']?.toString() ?? '',
              'descricao': item['descricao']?.toString() ?? '',
              'preco': (item['preco'] as num?)?.toDouble() ?? 0.0,
              'saldo_estoque':
                  (item['saldo_estoque'] as num?)?.toDouble() ?? 0.0,
              'unidade': item['unidade']?.toString() ?? '',
            }))
        .toList();
  } catch (e) {
    return [];
  }
}
