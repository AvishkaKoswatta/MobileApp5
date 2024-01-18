import 'package:flutter/material.dart';
//import 'package:flutter_neumorphic/flutter_neumorphic.dart';
//import 'houselisting_page.dart';
import 'houselisting_rent_page.dart';
import '/models/house_model.dart'; // Import your HouseModel
import '/services/house_service.dart';
import 'housedetail_page.dart';

class Houselist extends StatefulWidget {
  const Houselist({super.key});

  @override
  State<Houselist> createState() => _HouselistState();
}

class _HouselistState extends State<Houselist> {
  final HouseService _houseService = HouseService();
  List<HouseModel> houseList = []; // Updated list to store HouseModel instances

  bool isLocationSelected = true; // Track the selected button

  @override
  void initState() {
    super.initState();
    // Load houses from the backend when the widget is initialized
    loadHousesFromBackend();
  }

  void loadHousesFromBackend() async {
    try {
      // Fetch house data from the database
      List<HouseModel> houses = await _houseService.getHouses().first;

      setState(() {
        houseList = houses;
      });
    } catch (e) {
      print('Error loading houses: $e');
    }
  }

  void _navigateToDetailsPage(HouseDetails houseDetails) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HouseDetailsPage(houseDetails: houseDetails),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('House List'),
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

          // Search button
          Positioned(
            top: 30,
            left: 16,
            right: 16,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Find Your Dream House Here',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),

                  // Home Icon with Neumorphic Style
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Icon(
                        Icons.home,
                        size: 80,
                        color: Colors.black, // Customize the color as needed
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 170, // Adjust this value based on your needs
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
                        'Buy',
                        style: TextStyle(
                          color:
                              isLocationSelected ? Colors.white : Colors.black,
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
                          MaterialPageRoute(
                              builder: (context) => HouselistRent()),
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
                        'Rent',
                        style: TextStyle(
                          color:
                              isLocationSelected ? Colors.black : Colors.white,
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
                    for (var house in houseList)
                      HouseCard(
                        images: house.imageUrls,
                        price: house.totalPrice,
                        address: house.propertyAddress,
                        navigateToDetailsPage: _navigateToDetailsPage,
                        adType: house.adType,
                        bathrooms: house.bathrooms,
                        bedrooms: house.bedrooms,
                        kitchens: house.kitchens,
                        floors: house.floors,
                        additionalFeatures: house.additionalFeatures,
                        distanceToMainRoad: house.distanceToMainRoad,
                        landSize: house.landSize,
                        perMonthPrice: house.perMonthPrice,
                        description: house.description,
                        //image: house.image,
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

class HouseCard extends StatelessWidget {
  final List<String> images;
  final double price;
  final String address;
  final String adType;
  final Function(HouseDetails) navigateToDetailsPage;
  final int bedrooms;
  final int bathrooms;
  final int kitchens;
  final int floors;
  final String additionalFeatures;
  //final String propertyAddress;
  final double distanceToMainRoad;
  final double landSize;
  //final String image;
  final double perMonthPrice;
  final String description;

  HouseCard({
    required this.images,
    required this.price,
    required this.address,
    required this.navigateToDetailsPage,
    required this.adType,
    required this.bedrooms,
    required this.bathrooms,
    required this.kitchens,
    required this.floors,
    required this.additionalFeatures,
    //required this.propertyAddress,
    required this.distanceToMainRoad,
    required this.landSize,
    // required this.image,
    required this.perMonthPrice,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HouseDetails houseDetails = HouseDetails(
          price: '$price',
          address: address,
          adType: adType,
          bathrooms: bathrooms,
          bedrooms: bedrooms,
          floors: floors,
          kitchens: kitchens,
          additionalFeatures: additionalFeatures,
          distanceToMainRoad: distanceToMainRoad,
          landSize: landSize,
          perMonthPrice: perMonthPrice,
          description: description,
          imageUrls: images,
        );
        navigateToDetailsPage(houseDetails);
      },
      child: Container(
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
      ),
    );
  }
}
