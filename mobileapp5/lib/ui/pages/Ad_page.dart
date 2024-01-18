import 'package:flutter/material.dart';
import 'home_page2.dart';
import 'myprofile_page.dart';
import 'settings_page.dart';
//import 'landad_page.dart';
//import 'background.dart';
import 'signup.dart';
import 'login_page.dart';
import 'login2_page.dart';

class Ad extends StatefulWidget {
  const Ad({Key? key}) : super(key: key);

  @override
  State<Ad> createState() => _AdState();
}

class _AdState extends State<Ad> {
  int _currentPageIndex = 1;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Ad'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 100,
            left: 65,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              child: Container(
                width: 250,
                height: 250,
                child: Image.asset(
                  'lib/images/image6.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Post Your Ad Here',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(251, 218, 109, 7),
                      fixedSize: Size(100, 35),
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Now To Get Started',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 360,
            left: 10,
            right: 10,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white, 
                    Color.fromARGB(242, 16, 170, 170), 
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
            ),
          ),
          Positioned(
            top: 400,
            left: 16,
            right: 16,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login1()),
                            );
                          },
                          icon: Icons.home,
                          label: 'House',
                          color: Color.fromARGB(223, 218, 109, 7),
                        ),
                        SizedBox(width: 20),
                        CircularButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login2()),
                            );
                          },
                          icon: Icons.location_city,
                          label: 'Land',
                          color: Color.fromARGB(223, 218, 109, 7),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
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

class CircularButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final String label;
  final Color color;

  const CircularButton({
    Key? key,
    this.onPressed,
    required this.icon,
    required this.label,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Icon(icon, color: Colors.white, size: 36),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
