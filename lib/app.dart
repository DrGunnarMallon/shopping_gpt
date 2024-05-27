import 'package:flutter/material.dart';
import 'package:shopping_gpt/theme.dart';
import 'screens/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List App',
      theme: primaryTheme,
      home: HomeScreen(),
    );
  }
}
