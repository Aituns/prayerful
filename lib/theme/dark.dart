import 'package:flutter/material.dart';

class Dark {
  ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: Colors.grey[900],
      appBarTheme: AppBarTheme(
          color: Colors.grey[900],
          elevation: 0,
          titleTextStyle: const TextStyle().apply(
            color: Colors.grey[900],
          ),
          iconTheme: const IconThemeData(
            color: Color(0xFF4F4949),
          )),
      fontFamily: 'SF-Pro-Display',
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }
}
