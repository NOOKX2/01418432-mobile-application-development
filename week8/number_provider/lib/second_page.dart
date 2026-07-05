import 'package:flutter/material.dart';
import 'package:number_provider/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Second Page'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Text('counter value:', style: TextStyle(fontSize: 24),),
            Text(
              "${counterProvider.counter}",
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
             ElevatedButton(
              onPressed: counterProvider.decrease,
              child: const Text("Decrease"),
            ),
          ],
        ),
      ),
    );
  }
}
