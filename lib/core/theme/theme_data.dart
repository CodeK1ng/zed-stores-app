import 'package:flutter/material.dart';
import 'package:zed_stores/core/constants/constants.dart';

var zedStoresLightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    // seedColor: const Color(0xFF1F2544),
    // primary: const Color(0xFF1F2544),
    // secondary: const Color(0xFF474F7A),
    seedColor: const Color(0xFF52D3D8),
    primary: const Color(0xFF52D3D8),
    secondary: const Color(0xFF3887BE),
    onPrimary: const Color(0xFFFFFFFF),
    onSecondary: const Color(0xFFFFFFFF),
    surface: const Color(0xFFFFFFFF),
    background: const Color(0xFFF5F5F5),
    brightness: Brightness.light,
  ),
  // primaryColor: const Color(0xFF6200EA),
  // brightness: Brightness.light,
  disabledColor: const Color(0xFFE0E0E0),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFF333333),
    ),
    titleLarge: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFF333333),
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      color: Color(0xFF333333),
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      color: Color(0xFF333333),
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      color: Color(0xFF333333),
    ),
    displaySmall: TextStyle(
      fontSize: 12.0,
      color: Color(0xFF333333),
    ),
    displayMedium: TextStyle(
      fontSize: 16.0,
      color: Color(0xFF333333),
    ),
  ),
);

var zedStoresDarkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF52D3D8),
    primary: const Color(0xFF52D3D8),
    secondary: const Color(0xFF3887BE),
    onPrimary: Colors.black,
    onSecondary: const Color(0xFFFFFFFF),
    surface: const Color(0xFFFFFFFF),
    brightness: Brightness.dark,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 0, 0, 0),
  ),
  navigationBarTheme: NavigationBarThemeData(
    iconTheme: MaterialStateProperty.all(
      const IconThemeData(
        color: Color(0xFFFFFFFF),
      ),
    ),
    labelTextStyle: MaterialStateProperty.all(
      kSmallFont.copyWith(decoration: TextDecoration.none),
    ),
    backgroundColor: Colors.black,
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(color: Colors.grey)),
      ),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      minimumSize: MaterialStateProperty.all(
        const Size(double.infinity, 45.0),
      ),
      iconColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey;
        }
        return Colors.white;
      }),
      textStyle: MaterialStateProperty.all(
        kMediumFont.copyWith(
          color: Colors.white,
        ),
      ),
    ),
  ),
  textTheme: TextTheme(
    displayLarge: const TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFFFFFFFF),
    ),
    titleLarge: const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFFFFFFFF),
    ),
    bodyLarge: kWTextStyleSpacing.copyWith(
      fontSize: 14.0,
      color: const Color(0xFFFFFFFF),
    ),
    bodyMedium: const TextStyle(
      fontSize: 12.0,
      color: Color(0xFFFFFFFF),
    ),
    bodySmall: const TextStyle(
      fontSize: 10.0,
      color: Color(0xFFFFFFFF),
    ),
    displaySmall: const TextStyle(
      fontSize: 14.0,
      color: Color(0xFFFFFFFF),
    ),
  ),
);
