import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() => ThemeData(
    scaffoldBackgroundColor: Color(0xffFFFFFF),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
      ),
      bodyLarge: TextStyle(
        fontSize: 48,
      )
    )
    
  );
  static ThemeData dark() => ThemeData(
    scaffoldBackgroundColor: Color(0xff111827),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontSize: 18,
        color: Color(0xff9CA3AF)
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Color(0xffFFFFFF)
      ),
      bodyLarge: TextStyle(
        fontSize: 48,
        color: Color(0xffFFFFFF)
      )
    )
  );
}