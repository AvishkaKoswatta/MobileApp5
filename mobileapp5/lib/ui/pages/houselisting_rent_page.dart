import 'package:flutter/material.dart';
//import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'houselisting_page.dart';

class HouselistRent extends StatefulWidget {
  const HouselistRent({super.key});

  @override
  State<HouselistRent> createState() => _HouselistState();
}

class _HouselistState extends State<HouselistRent> {
  // List<HouseDetails> houseList = []; // Placeholder list
  bool isLocationSelected = true;

  @override
  void initState() {
    super.initState();
    // Load houses from the backend when the widget is initialized
    loadHousesFromBackend();
  }

  void loadHousesFromBackend() {
    // Placeholder - Replace this with actual backend logic to fetch houses
    
    /*
    setState(() {
      houseList = [
        HouseDetails(image: 'lib/images/house1.jpg', price: '\$500,000', address: '123 Main St'),
        HouseDetails(image: 'lib/images/house2.jpg', price: '\$700,000', address: '456 Oak St'),
        HouseDetails(image: 'lib/images/house3.jpg', price: '\$600,000', address: '789 Pine St'),
        // Add more HouseDetails as needed
      ];
    });
    */
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

                  
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Icon(
                        Icons.home,
                        size: 80,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 170, 
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Houselist()),
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
                        'Buy',
                        style: TextStyle(
                          color:
                              isLocationSelected ? Colors.black : Colors.white,
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
                            ? const Color.fromARGB(221, 255, 189, 90)
                            : Colors.white,
                        fixedSize: Size(115, 50),
                        side: BorderSide(
                          color: Color.fromARGB(221, 255, 189, 90),
                        ),
                      ),
                      child: Text(
                        'Rent',
                        style: TextStyle(
                          color:
                              isLocationSelected ? Colors.white : Colors.black,
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
/*
Positioned(
  top: 370, // Adjust this value based on your needs
  left: 0,
  right: 0,
  child: Container(
    height: 150, // Adjust this value based on your needs
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var house in houseList)
            HouseCard(
              image: house.image,
              price: house.price,
              address: house.address,
            ),
        ],
      ),
    ),
  ),
),
  */
        ],
      ),
    );
  }
}


/*
class HouseCard extends StatelessWidget {
  final String image;
  final String price;
  final String address;

  HouseCard({required this.image, required this.price, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      width: 400, // Adjust this value based on your needs
      height: 250, // Adjust this value based on your needs
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
*/
/*
class HouseDetails {
  final String image;
  final String price;
  final String address;

  HouseDetails({required this.image, required this.price, required this.address});

}
*/