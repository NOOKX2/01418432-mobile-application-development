import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Text("NEWS & PROMOTION", style: GoogleFonts.lato(fontSize: 20, color: Colors.black),),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              
              children: [
                _buildNewsContent(
                  const Color.fromARGB(255, 227, 128, 161),
                  "Get Credit Back",
                  "starbuck_credit_back.jpg",
                ),
                 _buildNewsContent(
                  const Color.fromARGB(255, 235, 224, 161),
                  "New Flavors",
                  "starbuck_new_flavor.jpg",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsContent(
    Color backgroundColor,
    String newsTitle,
    String imageName,
  ) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(newsTitle, style: GoogleFonts.lato(fontSize: 16)),
          ),
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(15),
            child: Image.asset(
              'assets/$imageName', 
              width: 200, 
              height: 300,
              fit: BoxFit.cover,
              ),
            
            ),
        ],
      ),
    );
  }
}
