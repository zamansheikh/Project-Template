import 'package:flutter/material.dart';

ThemeData light({Color color = const Color(0xFF039D55)}) => ThemeData(
      fontFamily: 'Roboto',
      primaryColor: color,
      secondaryHeaderColor: const Color(0xFF1ED7AA),
      disabledColor: const Color(0xFFBABFC4),
      brightness: Brightness.light,
      hintColor: const Color(0xFF9F9F9F),
      cardColor: Colors.white,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 5,
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: color)),
      colorScheme: ColorScheme.light(primary: color, secondary: color)
          .copyWith(surface: const Color(0xFFF3F3F3))
          .copyWith(error: const Color(0xFFE84D4F)),
    );
