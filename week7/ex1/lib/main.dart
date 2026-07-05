import 'package:ex1/first_route.dart';
import 'package:ex1/second_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const FirstScreen(),
          '/second': (context) => const SecondScreen(),
        },
      ),
    );
}




