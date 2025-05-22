import 'package:flutter/material.dart';

class Palette {
  static MaterialColor kToDark = MaterialColor(
    Colors.white.toARGB32(),
    <int, Color>{
      50: Colors.white.withValues(alpha: 0.1),
      100: Colors.white.withValues(alpha: 0.2),
      200: Colors.white.withValues(alpha: 0.3),
      300: Colors.white.withValues(alpha: 0.4),
      400: Colors.white.withValues(alpha: 0.5),
      500: Colors.white.withValues(alpha: 0.6),
      600: Colors.white.withValues(alpha: 0.7),
      700: Colors.white.withValues(alpha: 0.8),
      800: Colors.white.withValues(alpha: 0.9),
      900: Colors.white,
    },
  );
}
