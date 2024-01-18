import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationEnabled = true;
  int _selectedTheme = 0; // 0: Light, 1: Dark
  bool _enableBiometrics = false;
  bool _shareUsageData = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Enable Notifications'),
              trailing: Switch(
                value: _notificationEnabled,
                onChanged: (value) {
                  setState(() {
                    _notificationEnabled = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Appearance',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Theme'),
              trailing: DropdownButton<int>(
                value: _selectedTheme,
                items: [
                  DropdownMenuItem<int>(
                    value: 0,
                    child: Text('Light'),
                  ),
                  DropdownMenuItem<int>(
                    value: 1,
                    child: Text('Dark'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedTheme = value!;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Handle My Account button click
                print('My Account button clicked');
              },
              child: Text(
                'My Account',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Handle Privacy button click
                print('Privacy button clicked');
              },
              child: Text(
                'Privacy',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
