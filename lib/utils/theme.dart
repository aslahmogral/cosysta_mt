import 'package:flutter/material.dart';

class CustomTheme {
  static final ThemeData themeData = ThemeData(
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFFFFFFFF),
        surfaceTintColor: Colors.transparent, // disables the "tint" on scroll
        // scrolledUnderElevation: 0, // disables the shadow/elevation
      ));
      
}
