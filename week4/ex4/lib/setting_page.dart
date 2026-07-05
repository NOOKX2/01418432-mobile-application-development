import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<StatefulWidget> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _isNotificationOn = true;
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          _buildSectionTitle('Account'),
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: const Text('Profile'),
            subtitle: const Text('Edit your personal information'),
            trailing: const Icon(Icons.arrow_back_ios, size: 16),
            onTap: () {},
          ),
          const Divider(),

          _buildSectionTitle('App Settings'),
          SwitchListTile(
            value: _isNotificationOn,
            onChanged: (bool value) {
              setState(() {
                _isNotificationOn = value;
              });
            },
          ),
          SwitchListTile(
            secondary: const Icon(Icons.dark_mode, color: Colors.blueGrey),
            title: const Text('Dark Mode'),
            value: _isDarkMode,
            onChanged: (bool value) {
              setState(() => _isDarkMode = value);
            },
          ),
          const Divider(),

          _buildSectionTitle('Security & Privacy'),
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.green),
            title: const Text('Change Password'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout'),
            onTap: () => _showLogoutDialog(context),
          ),
        ],
      ),
    );
  }
}

Widget _buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsetsGeometry.all(10),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 14,
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

void _showLogoutDialog(BuildContext context) {
  showDialog(context: context, builder: (context) => AlertDialog(
    title: const Text('Logout'),
    content: const Text('Are you sure you want to log out'),
    actions: [
      TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
      TextButton(onPressed: () {}, child: const Text('Logout', style: TextStyle(color: Colors.red))),
    ],
  ));
}
