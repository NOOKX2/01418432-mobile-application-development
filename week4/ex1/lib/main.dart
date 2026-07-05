import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: const Text("Hello"), centerTitle: true,),
      body: Center(
        child: Column(
          
          children: [
            Image.asset('assets/macbook_pro_m5.jpeg', width: 300,),
            const SizedBox(height: 60),
            Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Cat_November_2010-1a.jpg/960px-Cat_November_2010-1a.jpg', width: 300,),
            const Text('Hello', style: TextStyle(fontSize: 50, color: Colors.lightGreen, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      ),
      theme: ThemeData.dark(),
  );
  }
}
