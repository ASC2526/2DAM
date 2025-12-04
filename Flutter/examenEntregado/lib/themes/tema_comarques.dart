import 'package:flutter/material.dart';

ThemeData temaComarques = ThemeData(
  textTheme: const TextTheme(
      displayMedium: TextStyle(
        fontFamily: "LeckerliOne",
        fontSize: 20,
        fontWeight: FontWeight.w100,
      ),
      displayLarge: TextStyle(
          fontWeight: FontWeight.w300,
          color: Colors.white,
          fontFamily: "LeckerliOne",
          fontSize: 40,
          shadows: [
            Shadow(offset: Offset(2, 2), color: Colors.black, blurRadius: 3),
          ]),
      displaySmall: TextStyle(
          fontWeight: FontWeight.w300,
          color: Colors.white,
          fontFamily: "LeckerliOne",
          fontSize: 20,
          shadows: [
            Shadow(offset: Offset(2, 2), color: Colors.black, blurRadius: 3),
          ]),
      
          ),
);
