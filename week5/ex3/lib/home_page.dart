import 'package:ex3/profile_action.dart';
import 'package:ex3/profile_detail.dart';
import 'package:ex3/profile_image.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/beach.jpg'),
          Transform.translate(
            offset: const Offset(0, 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileImage(imageProfileName: 'dog.jpg'),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: List.generate(
                    
                      5,
                      (index) =>
                          const Icon(Icons.star, color: Colors.orange, size: 24),
                    ),
                  ),
                ),
                ProfileDetail(
                  firstName: "Wolfram",
                  lastName: "Barkvinch",
                  age: 4,
                  status: "Good Boy",
                ),
                ProfileAction(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
