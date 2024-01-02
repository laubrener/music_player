import 'package:flutter/material.dart';

final myTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xff201E28),
    indicatorColor: Colors.pink.shade100,
    highlightColor: Colors.pink.shade100,
    inputDecorationTheme:
        InputDecorationTheme(focusColor: Colors.pink.shade100),
    textSelectionTheme: TextSelectionThemeData(
        selectionColor: Colors.pink.shade100,
        selectionHandleColor: Colors.pink.shade100,
        cursorColor: Colors.pink.shade100),
    focusColor: Colors.pink.shade100,
    primaryIconTheme: IconThemeData(color: Colors.pink.shade100),
    iconTheme: IconThemeData(color: Colors.white.withOpacity(0.3)));
