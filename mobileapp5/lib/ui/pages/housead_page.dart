import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'dart:io';
import '/services/house_service.dart'; 
import '/models/house_model.dart'; 
//import 'addimage.dart';
import 'ad_page.dart';

class HouseAdPage extends StatefulWidget {
  final HouseModel? initialHouse;

  const HouseAdPage({Key? key, this.initialHouse}) : super(key: key);

  @override
  State<HouseAdPage> createState() => _HousePageState();
}

class _HousePageState extends State<HouseAdPage> {
  String selectedAdType = ''; 
  int bedrooms = 0;
  int bathrooms = 0;
  int kitchens = 0;
  int floors = 0;
  String additionalFeatures = '';
  String propertyAddress = '';
  double distanceToMainRoad = 0.0;
  double landSize = 0.0;
  double totalPrice = 0.0;
  double perMonthPrice = 0.0;
  String description = '';
  List<XFile> selectedImages = [];
  final HouseService _houseService = HouseService();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  List<String> uploadedImageUrls = [];

  @override
  void initState() {
    super.initState();

   
    if (widget.initialHouse != null) {
      
      setState(() {
        selectedAdType = widget.initialHouse!.adType;
        bedrooms = widget.initialHouse!.bedrooms;
        bathrooms = widget.initialHouse!.bathrooms;
        kitchens = widget.initialHouse!.kitchens;
        floors = widget.initialHouse!.floors;
        additionalFeatures = widget.initialHouse!.additionalFeatures;
        propertyAddress = widget.initialHouse!.propertyAddress;
        distanceToMainRoad = widget.initialHouse!.distanceToMainRoad;
        landSize = widget.initialHouse!.landSize;
        totalPrice = widget.initialHouse!.totalPrice;
        perMonthPrice = widget.initialHouse!.perMonthPrice;
        description = widget.initialHouse!.description;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('House Ad'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select the ad type'),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedAdType = 'Sale';
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selectedAdType == 'Sale'
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    ),
                    child: Text('Sale'),
                  ),
                ),
                SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedAdType = 'Rent';
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selectedAdType == 'Rent'
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    ),
                    child: Text('Rent'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            Text('Number of Bedrooms: $bedrooms'),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      bedrooms++;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (bedrooms > 0) {
                        bedrooms--;
                      }
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16),

            SizedBox(height: 16),

            // Number of Bathrooms
            Text('Number of Bathrooms: $bathrooms'),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      bathrooms++;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (bathrooms > 0) {
                        bathrooms--;
                      }
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16),

            // Number of Kitchens
            Text('Number of Kitchens: $kitchens'),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      kitchens++;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (kitchens > 0) {
                        kitchens--;
                      }
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16),

            // Number of Floors
            Text('Number of Floors: $floors'),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      floors++;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (floors > 0) {
                        floors--;
                      }
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16),

            // Additional Features
            Text('Additional Features'),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Type additional features',
              ),
              onChanged: (String additionalFeatures) {
                setState(() {
                  this.additionalFeatures = additionalFeatures;
                });
              },
            ),
            SizedBox(height: 16),

            // Address
            Text('Address'),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter address',
              ),
              onChanged: (String address) {
                setState(() {
                  propertyAddress = address;
                });
              },
            ),
            SizedBox(height: 16),

            // Distance to Main Road
            Text('Distance to Main Road: $distanceToMainRoad meters'),
            Slider(
              value: distanceToMainRoad,
              min: 0.0,
              max: 100.0,
              onChanged: (value) {
                setState(() {
                  distanceToMainRoad = value;
                });
              },
            ),
            SizedBox(height: 16),

            // Land Size
            Text('Land Size: $landSize square meters'),
            Slider(
              value: landSize,
              min: 0.0,
              max: 1000.0,
              onChanged: (value) {
                setState(() {
                  landSize = value;
                });
              },
            ),
            SizedBox(height: 16),

            // Total Price or Monthly Price
            // Total Price
            Text('Total Price: $totalPrice'),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  totalPrice = double.tryParse(value) ?? 0.0;
                });
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter total price',
              ),
            ),
            SizedBox(height: 16),

            // Per Month Price (Enabled/Disabled based on ad type)
            Text(
                'Per Month Price: ${selectedAdType == 'Sale' ? "N/A" : perMonthPrice}'),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  perMonthPrice = double.tryParse(value) ?? 0.0;
                });
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter per month price',
              ),
              enabled:
                  selectedAdType != 'Sale', 
            ),
            SizedBox(height: 16),

            // Description
            Text('Description'),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  description = value;
                });
              },
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Enter description',
              ),
            ),
            SizedBox(height: 16),

            // Images Upload
            Text('Images Upload'),
            ElevatedButton(
              onPressed: () async {
                final picker = ImagePicker();
                final pickedImages = await picker.pickMultiImage(
                  maxWidth: 800,
                  maxHeight: 800,
                );

                if (pickedImages != null) {
                  setState(() {
                    selectedImages.addAll(pickedImages);
                  });
                }
              },
              child: Text('Browse Files'),
            ),

            SizedBox(height: 16),
/*
            // Display selected images
            ListView.builder(
              shrinkWrap: true,
            itemCount: selectedImages.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  child: Image.file(
                    File(selectedImages[index].path),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
*/
            ElevatedButton(
              onPressed: postHouseData, // Use the postHouseData method
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 4, 65, 114),
                fixedSize: Size(350, 50),
              ),
              child: Text(
                'Post',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            /*
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddImage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(221, 255, 189, 90),
                fixedSize: Size(105, 50),
              ),
              child: Text(
                'Add Image',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            */
          ],
        ),
      ),
    );
  }

  void postHouseData() async {
    List<String> uploadedImageUrls = []; 

    
    for (XFile imageFile in selectedImages) {
      String imageUrl = await _uploadImageToStorage(imageFile);
      uploadedImageUrls.add(imageUrl);
    }

   
    HouseModel newHouse = HouseModel(
      adType: selectedAdType,
      bedrooms: bedrooms,
      bathrooms: bathrooms,
      kitchens: kitchens,
      floors: floors,
      additionalFeatures: additionalFeatures,
      propertyAddress: propertyAddress,
      distanceToMainRoad: distanceToMainRoad,
      landSize: landSize,
      totalPrice: totalPrice,
      perMonthPrice: perMonthPrice,
      description: description,
      imageUrls: uploadedImageUrls, 
      id: '',
    );

   
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('House Ad Posted Successfully'),
        duration: Duration(seconds: 2),
      ),
    );

    
    String houseId = await _houseService.createHouse(newHouse);
    print('House added with ID: $houseId');

   
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Ad()),
    );
  }

  Future<String> _uploadImageToStorage(XFile imageFile) async {
    String uniqueId = DateTime.now().millisecondsSinceEpoch.toString();
    Reference storageReference = _storage.ref().child('images/$uniqueId.jpg');

   
    List<int> imageBytes = await imageFile.readAsBytes();

   
    await storageReference.putData(Uint8List.fromList(imageBytes));

   
    String imageUrl = await storageReference.getDownloadURL();
    return imageUrl;
  }

  void main() {
    runApp(MaterialApp(
      home: HouseAdPage(),
    ));
  }
}
