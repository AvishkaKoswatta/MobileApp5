import 'package:flutter/material.dart';
import 'search_page.dart';

class MapSearch extends StatefulWidget {
  const MapSearch({super.key});

  @override
  State<MapSearch> createState() => _SearchState();
}

class _SearchState extends State<MapSearch> with SingleTickerProviderStateMixin {
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
                          isLocationSelected = false;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Search()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: isLocationSelected
                            ? Colors.white
                            : Color.fromARGB(221, 255, 189, 90),
                        fixedSize: Size(115, 50),
                        side: BorderSide(
                          color: Color.fromARGB(221, 255, 189, 90),
                        ),
                      ),
                      child: Text(
                        'Location',
                        style: TextStyle(
                          color: isLocationSelected ? Colors.black : Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isLocationSelected = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: isLocationSelected
                            ? const Color.fromARGB(221, 255, 189, 90)
                            : Colors.white,
                        fixedSize: Size(115, 50),
                        side: BorderSide(
                          color: Color.fromARGB(221, 255, 189, 90),
                        ),
                      ),
                      child: Text(
                        'Map',
                        style: TextStyle(
                          color: isLocationSelected ? Colors.white : Colors.black,
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
        ],
      ),
    );
  }
}
