import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import 'routes.dart';

class PdfEditorProApp extends StatelessWidget {
  const PdfEditorProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.home,
    );
  }
}