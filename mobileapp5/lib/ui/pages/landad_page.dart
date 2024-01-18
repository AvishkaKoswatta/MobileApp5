import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '/services/land_service.dart';
import '/models/land_model.dart';

class LandAdPage extends StatefulWidget {
  final LandModel? initialLand;

  const LandAdPage({Key? key, this.initialLand}) : super(key: key);

  @override
  State<LandAdPage> createState() => _LandPageState();
}

class _LandPageState extends State<LandAdPage> {
  String propertyAddress = '';
  double distanceToMainRoad = 0.0;
  double landSize = 0.0;
  double totalPrice = 0.0;
  String description = '';
  List<XFile> selectedImages = [];
  final LandService _landService = LandService();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  List<String> uploadedImageUrls = [];

  @override
  void initState() {
    super.initState();

    // Check if initialHouse is provided
    if (widget.initialLand != null) {
      // Populate the fields with initial values
      // You might need to handle different types of fields based on your HouseModel
      setState(() {
        propertyAddress = widget.initialLand!.propertyAddress;
        distanceToMainRoad = widget.initialLand!.distanceToMainRoad;

        // Repeat this for other fields
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Land Ad'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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

            ElevatedButton(
              onPressed: postLandData, // Use the postHouseData method
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
          ],
        ),
      ),
    );
  }

  void postLandData() async {
  List<String> uploadedImageUrls = [];

  // Upload images to Firebase Storage and get their URLs
  for (XFile imageFile in selectedImages) {
    String imageUrl = await _uploadImageToStorage(imageFile);
    uploadedImageUrls.add(imageUrl);
  }

  LandModel newLand = LandModel(
    propertyAddress: propertyAddress,
    distanceToMainRoad: distanceToMainRoad,
    landSize: landSize,
    totalPrice: totalPrice,
    description: description,
    imageUrls: uploadedImageUrls,
    id: '',
  );

  // Display success message
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Land Ad Posted Successfully'),
      duration: Duration(seconds: 2),
    ),
  );

  String landId = await _landService.createLand(newLand);
  print('Land added with ID: $landId');
}

Future<String> _uploadImageToStorage(XFile imageFile) async {
  String uniqueId = DateTime.now().millisecondsSinceEpoch.toString();
  Reference storageReference = _storage.ref().child('images/$uniqueId.jpg');

  // Read the content of the image file as bytes
  List<int> imageBytes = await imageFile.readAsBytes();

  // Upload the bytes to Firebase Storage
  await storageReference.putData(Uint8List.fromList(imageBytes));

  // Get the download URL of the uploaded image
  String imageUrl = await storageReference.getDownloadURL();
  return imageUrl;
}





  void main() {
    runApp(MaterialApp(
      home: LandAdPage(),
    ));
  }
}
