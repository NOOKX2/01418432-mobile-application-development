import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_bloc/bloc/counter_bloc.dart';
import 'package:number_bloc/counter_event.dart';
import 'package:number_bloc/counter_state.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter value:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  '${state.counter}',
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed:  () {
                    context.read<CounterBloc>().add(MultiplyEvent());
                  }, 
              child: const Text("*2"))
          ],
        ),
      ),
    );
  }
}
