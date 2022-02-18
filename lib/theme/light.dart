import 'package:flutter/material.dart';

class Light {
  ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: Colors.grey[300],
      appBarTheme: AppBarTheme(
          color: Colors.grey[300],
          elevation: 0,
          titleTextStyle: const TextStyle().apply(
            color: const Color(0xFF4F4949),
          ),
          iconTheme: const IconThemeData(
            color: Color(0xFF4F4949),
          )),
      fontFamily: 'SF-Pro-Display',
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }
}
