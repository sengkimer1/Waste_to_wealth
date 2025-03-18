import 'package:flutter/material.dart';
import 'package:waste_to_wealth/pages/login.page.dart';
import 'package:waste_to_wealth/compenets/navigate_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(), // Start with Login Page
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NavigationMenu(), 
    );
  }
}
