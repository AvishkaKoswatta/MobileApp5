import 'package:flutter/material.dart';
import 'home_page2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MainPageState();
}

class _MainPageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Text(
              'Find Your Dream Place Here',
                            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            
            SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage2()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 9, 51, 85),
                fixedSize: Size(200, 50),
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white, // Change the text color
                ),
              ),
            ),
            SizedBox(height: 60),
            Image.asset(
              'lib/images/image7.png',
              width: 350,
              height: 300,
              fit: BoxFit.cover,
            ),
          ],
        )),
      ),
    );
  }
}
