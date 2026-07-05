import 'package:ex4/navbar.dart';
import 'package:ex4/news.dart';
import 'package:ex4/rewards.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: false,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Text(title, style: GoogleFonts.lato(fontSize: 20,)),
                    Positioned(
                      right: 16,
                      child: const Icon(Icons.location_on_outlined)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Navbar(),
              Reward(),
              News(),
            ],
          ),
        ),
      ),
    );
  }
}
