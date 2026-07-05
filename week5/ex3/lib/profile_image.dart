import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, this.imageProfileName});

  final String? imageProfileName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Image.asset(
          width: 200,
          height: 200,
          'assets/images/$imageProfileName',
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
