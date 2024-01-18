import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class ImageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<List<String>> uploadImages(List<File> images) async {
    List<String> imageUrls = [];

    for (int i = 0; i < images.length; i++) {
      File image = images[i];
      String imageName = 'image_$i.jpg';
      Reference reference = _storage.ref().child(imageName);

      UploadTask uploadTask = reference.putFile(image);

      await uploadTask.whenComplete(() async {
        String imageUrl = await reference.getDownloadURL();
        imageUrls.add(imageUrl);
      });
    }

    return imageUrls;
  }
}
