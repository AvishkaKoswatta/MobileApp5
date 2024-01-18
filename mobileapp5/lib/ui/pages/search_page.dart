import 'package:flutter/material.dart';
import 'mapsearch_page.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isLocationSelected = true; // Track the selected button

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 25, // Adjust this value based on your needs
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
                        setState(() {
                          isLocationSelected = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: isLocationSelected
                            ? const Color.fromARGB(255, 4, 65, 114)
                            : Colors.white,
                        fixedSize: Size(115, 50),
                        side: BorderSide(
                          color: Color.fromARGB(255, 4, 65, 114),
                        ),
                      ),
                      child: Text(
                        'Location',
                        style: TextStyle(
                          color: isLocationSelected ? Colors.white : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isLocationSelected = false;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MapSearch()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: isLocationSelected
                            ? Colors.white
                            : Color.fromARGB(255, 4, 65, 114),
                        fixedSize: Size(115, 50),
                        side: BorderSide(
                          color: Color.fromARGB(255, 4, 65, 114),
                        ),
                      ),
                      child: Text(
                        'Map',
                        style: TextStyle(
                          color: isLocationSelected ? Colors.black : Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 100, // Adjust this value based on your needs
            left: 4,
            right: 4,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter location to search',
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),

Positioned(
            top: 150, 
            left: 16,
            right: 16,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 4, 65, 114),
                      fixedSize: Size(400, 35),
                    ),
                    child: Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}
