// main.dart
import 'package:flutter/material.dart';
import 'init_page.dart'; // Splash

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash to Login Demo',
      debugShowCheckedModeBanner: false,
      home: const SplashPage(), // vào splash trước
    );
  }
}
