import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [
            Center(
              child: const CircleAvatar(
                backgroundColor: Colors.redAccent,
                radius: 60,
                child: Icon(
                  Icons.restaurant_menu,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
            const Text(
              'Foodie App',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const Text('Version 1.0.0', style: TextStyle(fontSize: 22)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: const Text(
                'We are dedicated to bringing the best food from local restaurants directly to your doorstep. Our mission is to provide fresh and high-quality meals every day.',
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.email, color: Colors.redAccent,),
              title: const Text('Contact Email'),
              subtitle: const Text('support@foodieapp.com'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.redAccent),
              title: const Text('Phone Number'),
              subtitle: const Text('+66 123 456 789'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.location_on, color: Colors.redAccent),
              title: const Text('Office Location'),
              subtitle: const Text('123 Food Street, Bangkok, Thailand'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
