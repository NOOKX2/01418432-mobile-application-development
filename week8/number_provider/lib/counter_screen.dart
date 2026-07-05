import 'package:flutter/material.dart';
import 'package:number_provider/provider/counter_provider.dart';
import 'package:number_provider/second_page.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Example"),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios), // ไอคอนลูกศรตามรูป
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${counterProvider.counter}",
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: counterProvider.increment,
              child: const Text("Increase"),
            ),
          ],
        ),
      ),
    );
  }
}
