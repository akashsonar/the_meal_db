import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_meal_db/pages/homePage.dart';
import 'package:the_meal_db/pages/widgets/themes.dart';
import 'package:the_meal_db/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => const HomePage(),
        MyRoutes.homeRoute: (context) => const HomePage()
      },
    );
  }
}
