import 'package:ex3/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Exercise 3",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(title: "Exercise 3",),
    );
  }
}
