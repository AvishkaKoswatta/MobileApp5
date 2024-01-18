import 'package:flutter/material.dart';
import 'bookmarklist_page.dart';
import 'myprofileform_page.dart';
import 'settings_page.dart';
import 'home_page2.dart';
import 'Ad_page.dart';
import 'adlist_page.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  int _currentPageIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20), // Increase gap above the Column
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyProfileform()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 4, 65, 114),
                      fixedSize: Size(300, 50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Set Profile',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), // Increase gap between buttons
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BookmarkList()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 4, 65, 114),
                      fixedSize: Size(300, 50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Bookmarks',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), // Increase gap between buttons
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdList()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 4, 65, 114),
                      fixedSize: Size(300, 50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My Ads',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40), // Increase gap below the Column
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
                setState(() {
                  _currentPageIndex = 0;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage2()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.campaign,
                  color: _currentPageIndex == 1
                      ? const Color.fromARGB(221, 255, 189, 90)
                      : Colors.black),
              onPressed: () {
                setState(() {
                  _currentPageIndex = 1;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ad()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.person,
                  color: _currentPageIndex == 2
                      ? const Color.fromARGB(221, 255, 189, 90)
                      : Colors.black),
              onPressed: () {
                setState(() {
                  _currentPageIndex = 2;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyProfile()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.settings,
                  color: _currentPageIndex == 3
                      ? const Color.fromARGB(221, 255, 189, 90)
                      : Colors.black),
              onPressed: () {
                setState(() {
                  _currentPageIndex = 3;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
