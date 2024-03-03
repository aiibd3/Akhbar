import 'package:Akhbar/screens/new_tab/new_tab.dart';
import 'package:Akhbar/screens/splash_screen/splash_screen.dart';
import 'package:Akhbar/shared/styles/my_theme.dart';
import 'package:flutter/material.dart';

import 'layout/home_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.light,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        NewsTab.routeName:(context) => NewsTab(),
      },
    );
  }
}
