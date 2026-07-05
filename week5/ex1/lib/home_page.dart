import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String hourMinute = "${now.hour}:${now.minute}";

    String formattedDate = DateFormat('d MMMM yyyy').format(now);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.amber,
        centerTitle: false,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.lightGreen),
        child: Container(
          margin: EdgeInsets.all(20),
          decoration: const BoxDecoration(color: Colors.lightBlue),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                hourMinute.toString(),
                style: GoogleFonts.lato(color: Colors.black, fontSize: 48),
              ),
              const SizedBox(height: 10,
              ),
              Text(
                formattedDate,
                style: GoogleFonts.lato(color: Colors.black),
              ),
              Text(
                "Have a good day",
                style: TextStyle(
                  fontSize: 30,
                  foreground: Paint()
                  ..shader = ui.Gradient.linear(
                    const Offset(0, 20),
                    const Offset(150, 200),
                    <Color>[Colors.red, Colors.yellow],
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
