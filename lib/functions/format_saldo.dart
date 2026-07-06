<<<<<<< HEAD

=======
import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/schema/structs/index.dart';
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)

/// DSL custom function formatSaldo
String? formatSaldo(
  double? saldo,
  String? unidade,
) {
  return 'Saldo: ${saldo ?? 0.0} ${unidade ?? ""}';
}
