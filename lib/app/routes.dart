import 'package:flutter/material.dart';
import '../features/home/home_screen.dart';

class AppRoutes {
  static const home = '/';

  static Map<String, WidgetBuilder> get routes => {
        home: (_) => const HomeScreen(),
      };
}