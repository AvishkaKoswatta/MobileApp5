import 'package:flutter/material.dart';
import '/models/land_model.dart'; // Import your HouseModel
import '/services/land_service.dart';

class Landlist extends StatefulWidget {
  const Landlist({super.key});

  @override
  State<Landlist> createState() => _LandlistState();
}

class _LandlistState extends State<Landlist> {
  final LandService _landService = LandService();
  List<LandModel> landList = [];

  @override
  void initState() {
    super.initState();
    // Load houses from the backend when the widget is initialized
    loadHousesFromBackend();
  }

  void loadHousesFromBackend() async {
    try {
      // Fetch house data from the database
      List<LandModel> lands = await _landService.getlands().first;

      setState(() {
        landList = lands;
      });
    } catch (e) {
      print('Error loading houses: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Land List'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 10,
            right: 10,
            bottom: 500,
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
            ),
          ),

          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Find Your Dream Land Here',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                 
                ],
              ),
            ),
          ),
          Positioned(
            top: 68,
            left: 16,
            right: 16,
            child: Icon(
                        Icons.location_city,
                        size: 80,
                        color: Colors.black, // Customize the color as needed
                      ),
          ),

          // House listing

          Positioned(
            top: 270, 
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 150, 
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var land in landList)
                      LandCard(
                        images: land.imageUrls,
                        price: land.totalPrice,
                        address: land.propertyAddress,
                      ),
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

class LandCard extends StatelessWidget {
  final List<String> images;
  final double price;
  final String address;

  LandCard({required this.images, required this.price, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      width: 400,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(8.0),
                  width: 400,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Image.network(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.black.withOpacity(0.7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price: $price',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Address: $address',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LandDetails {
  //final String imageUrl;
  final String price;
  final String address;

  LandDetails({required this.price, required this.address});
}
