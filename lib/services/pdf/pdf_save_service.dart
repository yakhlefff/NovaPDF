import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class PdfSaveService {
  static Future<String?> saveCopy(File inputFile) async {
    try {
      final bytes = await inputFile.readAsBytes();
      final doc = PdfDocument(inputBytes: bytes);

      // حالياً: بدون تعديل (مرحلة 1)
      final outBytes = await doc.save();
      doc.dispose();

      final dir = await getApplicationDocumentsDirectory();
      final name = p.basenameWithoutExtension(inputFile.path);
      final outPath = p.join(dir.path, '${name}_copy.pdf');

      await File(outPath).writeAsBytes(outBytes, flush: true);
      return outPath;
    } catch (_) {
      return null;
    }
  }
}