// lib/main.dart
import 'package:flutter/material.dart';
import 'shopping_cart_page.dart';

void main() {
  runApp(const StatelessLabExamApp());
}

class StatelessLabExamApp extends StatelessWidget {
  const StatelessLabExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateless Lab Exam',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F6FA),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2F6BFF)),
      ),
      home: const ShoppingCartPage(),
    );
  }
}