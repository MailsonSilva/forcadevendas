// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the `</>` button on the right!

import 'dart:io';

class ImagemLocalWidget extends StatefulWidget {
  const ImagemLocalWidget({
    super.key,
    this.width,
    this.height,
    required this.caminhoArquivo,
  });

  final double? width;
  final double? height;
  final String caminhoArquivo;

  @override
  State<ImagemLocalWidget> createState() => _ImagemLocalWidgetState();
}

class _ImagemLocalWidgetState extends State<ImagemLocalWidget> {
  @override
  Widget build(BuildContext context) {
    // Valida se a string está vazia ou se o arquivo físico foi apagado/não existe
    if (widget.caminhoArquivo.trim().isEmpty ||
        !File(widget.caminhoArquivo).existsSync()) {
      return Container(
        width: widget.width ?? 120,
        height: widget.height ?? 120,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.image_not_supported_outlined,
          color: Color(0xFF94A3B8),
          size: 32,
        ),
      );
    }

    // Renderiza de forma nativa a imagem puxada direto da memória interna do aparelho
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.file(
        File(widget.caminhoArquivo),
        width: widget.width,
        height: widget.height,
        fit: BoxFit.contain, // Garante que a foto apareça inteira sem cortes
      ),
    );
  }
}
