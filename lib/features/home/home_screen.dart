import 'dart:io';
import 'package:flutter/material.dart';
import '../../services/pdf/pdf_io_service.dart';
import '../viewer/pdf_viewer_screen.dart';
import 'widgets/empty_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _lastFile;
  bool _loading = false;

  Future<void> _pickAndOpen() async {
    setState(() => _loading = true);

    final file = await PdfIoService.pickPdfFile();

    setState(() => _loading = false);

    if (file == null) return;

    setState(() => _lastFile = file);

    if (!mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PdfViewerScreen(file: file),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final file = _lastFile;

    return Scaffold(
      appBar: AppBar(title: const Text('PDF Editor Pro')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : (file == null
              ? EmptyState(onPick: _pickAndOpen)
              : Center(
                  child: ElevatedButton.icon(
                    onPressed: _pickAndOpen,
                    icon: const Icon(Icons.folder_open),
                    label: const Text('فتح PDF آخر'),
                  ),
                )),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickAndOpen,
        child: const Icon(Icons.upload_file),
      ),
    );
  }
}