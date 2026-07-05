import 'package:ex4/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Exercise 4",
      home: HomePage(title: "Good Morning, Thatchavit"),
      );
  }
}
