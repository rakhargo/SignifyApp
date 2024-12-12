import 'package:flutter/material.dart';
import 'pages/onboarding/onboarding.dart';
import 'pages/home/home.dart';

void main() {
  runApp(SignifyApp());
}

class SignifyApp extends StatelessWidget {
  const SignifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(), // Mengarahkan ke halaman onboarding pertama
    );
  }
}
