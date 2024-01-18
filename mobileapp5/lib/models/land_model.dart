class LandModel {
  String id; // Add an ID field to uniquely identify each house
  final String propertyAddress;
  final double distanceToMainRoad;
  final double landSize;
  final double totalPrice;
  final String description;
  List<String> imageUrls; // Store URLs of images in Firebase Storage

  LandModel({
    required this.id,
   
    required this.propertyAddress,
    required this.distanceToMainRoad,
    required this.landSize,
    required this.totalPrice,
   
    required this.description,
    required this.imageUrls,
  });

  factory LandModel.fromMap(String id, Map<String, dynamic> data) {
    return LandModel(
      id: id,
      
      propertyAddress: data['propertyAddress'],
      distanceToMainRoad: data['distanceToMainRoad'],
      landSize: data['landSize'],
      totalPrice: data['totalPrice'],
     
      description: data['description'],
      imageUrls: List<String>.from(data['imageUrls'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
     
     
      'propertyAddress': propertyAddress,
      'distanceToMainRoad': distanceToMainRoad,
      'landSize': landSize,
      'totalPrice': totalPrice,
    
      'description': description,
      'imageUrls': imageUrls,
    };
  }
}
