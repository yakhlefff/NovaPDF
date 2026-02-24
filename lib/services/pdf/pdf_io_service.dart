import 'dart:io';
import 'package:file_picker/file_picker.dart';

class PdfIoService {
  static Future<File?> pickPdfFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      withData: false,
    );

    if (result == null) return null;
    final path = result.files.single.path;
    if (path == null) return null;

    return File(path);
  }
}