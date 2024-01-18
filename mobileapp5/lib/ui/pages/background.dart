import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ash Colored House'),
        ),
        body: Center(
          child: Background(),
        ),
      ),
    );
  }
}

class Background extends StatefulWidget {
  const Background({super.key});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    return HouseShape(); 
  }
}

class HouseShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Stack(
        children: [
          // Square
          Container(
            width: 100.0,
            height: 100.0,
            color: Colors.grey[700], 
          ),
          // Triangle (roof)
          Positioned(
            top: 0.0,
            left: 25.0,
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.grey[700], 
                border: Border(
                  left: BorderSide(width: 25.0, color: Colors.transparent),
                  right: BorderSide(width: 25.0, color: Colors.transparent),
                  // Triangle
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
