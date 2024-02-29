import 'package:assignment_3/internet_checker.dart';
import 'package:assignment_3/pick_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assignment_3/theme_provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Theme',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Choose theme',
                style: TextStyle(fontSize: 20),
              ),
              Consumer<ThemeProvider>(builder: (context, provider, child) {
                return DropdownButton<String>(
                    value: provider.currentTheme,
                    items: const [
                      DropdownMenuItem<String>(
                        value: 'light',
                        child: Text('Light'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'dark',
                        child: Text('Dark'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'system',
                        child: Text('System'),
                      ),
                    ],
                    onChanged: (String? value) {
                      provider.changeTheme(value ?? 'system');
                    });
              }),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Profile',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              // Navigate to the PickImage page when the text is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PickImage()),
              );
            },
            child: const Text(
              'Edit Picture                                    ',
              style: TextStyle(
                fontSize: 18,
                // decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Connection',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              // Navigate to the PickImage page when the text is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConnectionPage()),
              );
            },
            child: const Text(
              'Check Internet Connection        ',
              style: TextStyle(
                fontSize: 18,
                // decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
