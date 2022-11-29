import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shradhanjali_card/Screens/main_screen.dart';
import 'package:shradhanjali_card/Screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
