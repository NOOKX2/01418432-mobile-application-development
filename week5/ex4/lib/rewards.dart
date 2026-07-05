import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Reward extends StatelessWidget {
  const Reward({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("Green 126", style: GoogleFonts.lato(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(width: 8,),
              Icon(Icons.star, color: Colors.white,)
            ],
          ),
          _buildProgressBar(3, 5),
          Text("Stars earned to redeem rewards", style: GoogleFonts.lato(color: const Color.fromARGB(255, 215, 213, 213), fontSize: 16),),
          ],
      ),
    );
  }

  Widget _buildProgressBar(int currentSteps, int totalSteps) {
    return Row(
      children: List.generate(totalSteps, (index) {
        return Expanded(child: Container(
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: index < currentSteps ? const Color.fromARGB(255, 20, 127, 74) : Colors.grey,
            borderRadius: BorderRadius.circular(2)
          ),
        ));
      }),
    );
  }
}
