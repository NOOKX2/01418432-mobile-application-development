import 'package:flutter/material.dart';

class MyAnimation extends StatefulWidget {
  const MyAnimation({super.key});
  @override
  State<MyAnimation> createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> {
  final List<Color> colors = const [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.blue,
    Colors.orange,
  ];
  int iteration = 0;

  final List<double> sizes = const [100, 125, 150, 175, 200];
  final List<double> tops = const [0, 50, 100, 150, 200];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
        actions: [
          IconButton(
            onPressed: () => setState(() {
              iteration = (iteration + 1) % colors.length;
            }),
            icon: const Icon(Icons.run_circle),
          ),
        ],
      ),
      body: Center(
        child: AnimatedContainer(
          margin: EdgeInsets.only(top: tops[iteration % colors.length]),
          width: sizes[iteration % colors.length],
          height: sizes[iteration % colors.length],
          duration: const Duration(seconds: 1),
          color: colors[iteration % colors.length],
        ),
      ),
    );
  }
}
