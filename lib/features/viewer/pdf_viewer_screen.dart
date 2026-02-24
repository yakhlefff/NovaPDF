import 'dart:io';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../services/pdf/pdf_save_service.dart';

class PdfViewerScreen extends StatefulWidget {
  final File file;
  const PdfViewerScreen({super.key, required this.file});

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  final PdfViewerController _controller = PdfViewerController();

  Future<void> _saveCopy() async {
    final result = await PdfSaveService.saveCopy(widget.file);

    if (!mounted) return;

    if (result == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('فشل حفظ النسخة')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم حفظ نسخة هنا: $result')),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.file.path.split('/').last),
        actions: [
          IconButton(
            onPressed: _saveCopy,
            icon: const Icon(Icons.save_alt),
            tooltip: 'حفظ نسخة',
          )
        ],
      ),
      body: SfPdfViewer.file(
        widget.file,
        controller: _controller,
        canShowScrollHead: true,
        canShowScrollStatus: true,
      ),
    );
  }
}