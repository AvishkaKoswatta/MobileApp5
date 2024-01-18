import 'package:flutter/material.dart';
import 'home_page2.dart';
import 'myprofile_page.dart';
import 'ad_page.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int _currentPageIndex = 3;
  bool _notificationEnabled = true;
  int _selectedTheme = 0;

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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
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
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(246, 223, 255, 247),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home,
                  color: _currentPageIndex == 0
                      ? const Color.fromARGB(221, 255, 189, 90)
                      : Colors.black),
              onPressed: () {
                navigateToPage(0, HomePage2());
              },
            ),
            IconButton(
              icon: Icon(Icons.campaign,
                  color: _currentPageIndex == 1
                      ? const Color.fromARGB(221, 255, 189, 90)
                      : Colors.black),
              onPressed: () {
                navigateToPage(1, Ad());
              },
            ),
            IconButton(
              icon: Icon(Icons.person,
                  color: _currentPageIndex == 2
                      ? const Color.fromARGB(221, 255, 189, 90)
                      : Colors.black),
              onPressed: () {
                navigateToPage(2, MyProfile());
              },
            ),
            IconButton(
              icon: Icon(Icons.settings,
                  color: _currentPageIndex == 3
                      ? const Color.fromARGB(221, 255, 189, 90)
                      : Colors.black),
              onPressed: () {
                navigateToPage(3, Settings());
              },
            ),
          ],
        ),
      ),
    );
  }

  void navigateToPage(int index, Widget page) {
    setState(() {
      _currentPageIndex = index;
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
