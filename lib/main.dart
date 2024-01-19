import 'package:app_vacca/login/splashy.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor:  const Color(0xffF4F4F4)),
          useMaterial3: false,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
