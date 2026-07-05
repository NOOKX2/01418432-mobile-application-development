import 'package:flutter/material.dart';
import 'package:pingpong_game/pong.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pingpong Game',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pingpong Game'),
        ),
        body: Pong(),
      ),
    );
  }
}
