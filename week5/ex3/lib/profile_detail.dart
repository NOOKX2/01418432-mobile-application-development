import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.status,
  });

  final String firstName;
  final String lastName;
  final int age;
  final String status;

  @override
  Widget build(BuildContext context) {
    final fullName = '$firstName $lastName';
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
          fullName, style: GoogleFonts.kurale(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text('Age: $age', style: GoogleFonts.kurale(fontWeight: FontWeight.bold),),
        Text('Status: $status', style: GoogleFonts.kurale(fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
