import 'package:flutter/material.dart';

class Apptheme {
  // Colores principales de la aplicación
  static const Color primaryColor = Colors.indigo;
  static const Color accentColor = Colors.cyan;
  static const Color backGroundColor = Colors.cyanAccent;

  // Tema global
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backGroundColor,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.indigo,
            elevation: 0,
            titleTextStyle: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            iconTheme: IconThemeData(color: Colors.white)),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: accentColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        )));
  }
}
