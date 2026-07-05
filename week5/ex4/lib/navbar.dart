import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 238, 216, 224),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildMenuItem(Icons.coffee, "Drinks"),
            _buildMenuItem(Icons.lunch_dining, "Bakery"),
            _buildMenuItem(Icons.home, "At Home"),
            _buildMenuItem(Icons.blender, "Tumbler"),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 47, color: Colors.green,),
        const SizedBox(height: 8,),
        Text(
          label,
          style: GoogleFonts.lato(
            fontSize: 16,
          )
        ),

      ],
    );
  }
}
