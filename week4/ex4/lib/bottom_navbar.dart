import 'package:ex4/about_page.dart';
import 'package:ex4/home_page.dart';
import 'package:ex4/setting_page.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int indexBottomNav = 0;
  List widgetOption = const [HomePage(title: 'Our Menu'), AboutPage(), SettingPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: widgetOption[indexBottomNav]),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'about'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'setting'),
        ],
        currentIndex: indexBottomNav,
        onTap: (value) => setState(() => indexBottomNav = value),
      ),
    );
  }
}