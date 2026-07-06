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
<<<<<<< HEAD
=======
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)

class ImagemLocalWidget extends StatefulWidget {
  const ImagemLocalWidget({
    super.key,
    this.width,
    this.height,
<<<<<<< HEAD
    required this.caminhoArquivo,
=======
    this.caminhoArquivo,
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
  });

  final double? width;
  final double? height;
<<<<<<< HEAD
  final String caminhoArquivo;
=======
  final String? caminhoArquivo;
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)

  @override
  State<ImagemLocalWidget> createState() => _ImagemLocalWidgetState();
}

class _ImagemLocalWidgetState extends State<ImagemLocalWidget> {
<<<<<<< HEAD
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
=======
  Future<String?>? _fileCheckFuture;
  String? _lastCaminho;

  @override
  void initState() {
    super.initState();
    _initFileCheck();
  }

  void _initFileCheck() {
    final path = widget.caminhoArquivo;
    if (path == null || path.trim().isEmpty) {
      _fileCheckFuture = Future.value(null);
    } else {
      final trimmedPath = path.trim();
      String relativePath = trimmedPath;
      if (trimmedPath.contains('app_flutter/')) {
        relativePath = trimmedPath.substring(trimmedPath.indexOf('app_flutter/') + 'app_flutter/'.length);
      } else if (trimmedPath.contains('Documents/')) {
        relativePath = trimmedPath.substring(trimmedPath.indexOf('Documents/') + 'Documents/'.length);
      }
      
      if (!relativePath.startsWith('/') && !relativePath.contains(':\\') && !relativePath.contains(':/')) {
        _fileCheckFuture = getApplicationDocumentsDirectory().then((dir) async {
          final fullPath = "${dir.path}/$relativePath";
          if (await File(fullPath).exists()) {
            return fullPath;
          }
          if (await File(trimmedPath).exists()) {
            return trimmedPath;
          }
          return null;
        });
      } else {
        _fileCheckFuture = File(trimmedPath).exists().then((exists) {
          return exists ? trimmedPath : null;
        });
      }
    }
    _lastCaminho = path;
  }

  Widget _buildPlaceholder() {
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

  @override
  Widget build(BuildContext context) {
    if (_lastCaminho != widget.caminhoArquivo) {
      _initFileCheck();
    }

    return FutureBuilder<String?>(
      future: _fileCheckFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildPlaceholder();
        }
        if (snapshot.hasError || snapshot.data == null) {
          return _buildPlaceholder();
        }

        final resolvedPath = snapshot.data!;

        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.file(
            File(resolvedPath),
            width: widget.width,
            height: widget.height,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return _buildPlaceholder();
            },
          ),
        );
      },
    );
  }
>>>>>>> f06b5de (fix: sincronizacao de banco de dados e correcao de duplicados)
}
