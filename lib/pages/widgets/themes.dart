import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      colorScheme: Theme.of(context).colorScheme.copyWith(
          brightness: null,
          primary: Vx.white,
          onPrimary: Vx.black,
          secondary: Vx.yellow400,
          onSecondary: Vx.teal600,
          error: Vx.teal500,
          onError: const Color.fromARGB(255, 17, 73, 62),
          background: Vx.white,
          onBackground: null,
          surface: null,
          onSurface: null),
      appBarTheme: const AppBarTheme(
          color: Vx.teal600,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Vx.teal600)));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      colorScheme: Theme.of(context).colorScheme.copyWith(
          brightness: null,
          primary: Vx.black,
          onPrimary: Vx.white,
          secondary: Vx.yellow400,
          onSecondary: Vx.teal600,
          error: Vx.teal500,
          onError: const Color.fromARGB(255, 17, 73, 62),
          background: Vx.white,
          onBackground: null,
          surface: null,
          onSurface: null),
      appBarTheme: const AppBarTheme(
          color: Vx.teal600,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Vx.teal600)));

  static Color whiteColor = Vx.white;
}
