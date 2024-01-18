import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddImage extends StatefulWidget {
  const AddImage({super.key});

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  Future<void> _uploadImage() async {
    // Get an image from the device using the image_picker package
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage == null) return;

    // Generate a unique ID for the image
    String uniqueId = DateTime.now().millisecondsSinceEpoch.toString();

    // Create a reference to the Firebase Storage path
    Reference storageReference = _storage.ref().child('images/$uniqueId.jpg');

    // Upload the image to Firebase Storage
    await storageReference.putFile(File(pickedImage.path));

    // You can now save the uniqueId or the download URL in your database
    // or use it as needed in your application.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Image'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _uploadImage,
          child: Text('Upload Image'),
        ),
      ),
    );
  }
}
