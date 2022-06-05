import 'package:flutter/material.dart';

const Map<int, Color> _swatch = {
  50: Color.fromRGBO(8, 90, 158, .1),
  100: Color.fromRGBO(8, 90, 158, .2),
  200: Color.fromRGBO(8, 90, 158, .3),
  300: Color.fromRGBO(8, 90, 158, .4),
  400: Color.fromRGBO(8, 90, 158, .5),
  500: Color.fromRGBO(8, 90, 158, .6),
  600: Color.fromRGBO(8, 90, 158, .7),
  700: Color.fromRGBO(8, 90, 158, .8),
  800: Color.fromRGBO(8, 90, 158, .9),
  900: Color.fromRGBO(8, 90, 158, 1),
};
const _primaryColor = MaterialColor(0xFF085A9E, _swatch);

final _baseTheme = ThemeData(
  primarySwatch: _primaryColor,
  textTheme: ThemeData.light().textTheme.copyWith(
        titleLarge: const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: const TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
      ),
  appBarTheme: ThemeData().appBarTheme.copyWith(
        titleTextStyle: const TextStyle(
          fontSize: 20,
        ),
      ),
);

final theme = _baseTheme.copyWith(
  colorScheme: _baseTheme.colorScheme.copyWith(
    secondary: const Color.fromARGB(0xFF, 0x3D, 0xC2, 0xFF),
    tertiary: const Color.fromARGB(0xFF, 0x52, 0x60, 0xFF),
  ),
);
