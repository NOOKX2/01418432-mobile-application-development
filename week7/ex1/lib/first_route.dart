import 'package:ex1/second_route.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Route')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondScreen()),
            );
          },
          // style: ElevatedButton.styleFrom(
          //   backgroundColor: Colors.red,
          //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          // ),
          child: const Text('Open route'),
        ),
      ),
    );
  }
}