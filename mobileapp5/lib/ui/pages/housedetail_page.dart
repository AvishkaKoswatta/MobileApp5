import 'package:flutter/material.dart';

class HouseDetailsPage extends StatelessWidget {
  final HouseDetails houseDetails;

  HouseDetailsPage({required this.houseDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('House Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200, 
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: houseDetails.imageUrls.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.network(
                      houseDetails.imageUrls[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Card(
              child: ListTile(
                title: Text(
                  'Price: ${houseDetails.price}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  'Address: ${houseDetails.address}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  'Ad Type: ${houseDetails.adType}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  'No of Bedrooms: ${houseDetails.bedrooms}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  'No of Bathrooms: ${houseDetails.bathrooms}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  'No of Kitchens: ${houseDetails.kitchens}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  'No of Floors: ${houseDetails.floors}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            
            Card(
              child: ListTile(
                title: Text(
                  'No of Floors: ${houseDetails.additionalFeatures}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  'No of Floors: ${houseDetails.distanceToMainRoad}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  'No of Floors: ${houseDetails.landSize}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  'No of Floors: ${houseDetails.perMonthPrice}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  'No of Floors: ${houseDetails.description}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(width: 20),
            ElevatedButton(
                    onPressed: () {
                      
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(251, 218, 109, 7),
                      fixedSize: Size(300, 50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Contact',
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
    );
  }
}

class HouseDetails {
  final String price;
  final String address;
  final String adType;
  final int bedrooms;
  final int bathrooms;
  final int kitchens;
  final int floors;
  final String additionalFeatures;
  final double distanceToMainRoad;
  final double landSize;
  final double perMonthPrice;
  final String description;
  List<String> imageUrls;

  HouseDetails({
    required this.price,
    required this.address,
    required this.adType,
    required this.bedrooms,
    required this.bathrooms,
    required this.kitchens,
    required this.floors,
    required this.additionalFeatures,
    required this.distanceToMainRoad,
    required this.landSize,
    required this.perMonthPrice,
    required this.description,
    required this.imageUrls,
  });
}
