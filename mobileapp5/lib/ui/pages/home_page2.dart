import 'package:flutter/material.dart';
import 'Ad_page.dart';
import 'search_page.dart';
import 'houselisting_page.dart';
import 'landlisting_page.dart';
import 'myprofile_page.dart';
import 'settings_page.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Positioned(
  top: 0,
  left: 10,
  right: 10,
  bottom: 200,
  child: ClipPath(
    clipper: WaveClipper(), // Custom clipper for the wave effect
    child: Container(
      decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white, // Starting color
                    Color.fromARGB(242, 16, 170, 170), // Ending color
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
       
        child: Image.asset(
                  'lib/images/image8.png',
                  //fit: BoxFit.cover,
                ),
      
   
        
     
    ),
  ),
),
          
          Positioned(
            top: 340, // Adjust this value based on your needs
            left: 4,
            right: 4,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Houselist()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 4, 65, 114),
                        fixedSize: Size(105, 50),
                      ),
                      child: Text(
                        'Houses',
                        style: TextStyle(
                           color: Colors.white, 
                        fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Landlist()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 4, 65, 114),
                        fixedSize: Size(105, 50),
                      ),
                      child: Text(
                        'Lands',
                        style: TextStyle(
                          color: Colors.white, 
                        fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Search()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 4, 65, 114),
                      fixedSize: Size(105, 50),
                    ),
                    child: Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ],
                ),
              ),
            ),
          ),

Positioned(
            top: 420,
            left: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Popular Now',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Recommended properties list
          Positioned(
            top: 460, // Adjust this value based on your needs
            left: 0,
            right: 0,
            child: Container(
              height: 150, // Adjust this value based on your needs
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PropertyCard(
                      image: 'lib/images/property1.jpg', // Replace with your image path
                      price: '\$',
                    ),
                    PropertyCard(
                      image: 'lib/images/property2.jpg', // Replace with your image path
                      price: '\$',
                    ),
                    PropertyCard(
                      image: 'lib/images/property3.jpg', // Replace with your image path
                      price: '\$',
                    ),
                    // Add more PropertyCard widgets as needed
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
        icon: Icon(Icons.home, color: _currentPageIndex == 0 ? Color.fromARGB(221, 255, 189, 90) : Colors.black),
        onPressed: () {
          setState(() {
            _currentPageIndex = 0;
          });
          // Navigate to the corresponding page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage2()),
          );
        },
      ),
      IconButton(
        icon: Icon(Icons.campaign, color: _currentPageIndex == 1 ? const Color.fromARGB(221, 255, 189, 90) : Colors.black),
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
        icon: Icon(Icons.person, color: _currentPageIndex == 2 ? const Color.fromARGB(221, 255, 189, 90) : Colors.black),
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
        icon: Icon(Icons.settings, color: _currentPageIndex == 3 ? const Color.fromARGB(221, 255, 189, 90) : Colors.black),
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

class PropertyCard extends StatelessWidget {
  final String image;
  final String price;

  PropertyCard({required this.image, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      width: 200, // Adjust this value based on your needs
      height: 150, // Adjust this value based on your needs
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.blue, // Add your property card design here
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.black.withOpacity(0.7),
            child: Text(
              'Price: $price',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width / 6, size.height * 0.75, size.width / 3, size.height * 0.7);
    path.quadraticBezierTo(size.width / 2, size.height * 0.65, size.width * 2 / 3, size.height * 0.7);
    path.quadraticBezierTo(size.width * 5 / 6, size.height * 0.75, size.width, size.height * 0.7);

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
