import 'package:flutter/material.dart';
import 'package:gsc2024/view/homepage.dart';
import 'package:gsc2024/view/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MINUM',
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
