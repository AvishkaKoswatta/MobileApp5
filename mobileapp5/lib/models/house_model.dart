class HouseModel {
  String id; // Add an ID field to uniquely identify each house
  final String adType;
  final int bedrooms;
  final int bathrooms;
  final int kitchens;
  final int floors;
  final String additionalFeatures;
  final String propertyAddress;
  final double distanceToMainRoad;
  final double landSize;
  final double totalPrice;
  final double perMonthPrice;
  final String description;
  //final List<String> imageUrls; // Store URLs of images in Firebase Storage
  //List<String> imageUrls = [];
  //final String imageUrl;
  List<String> imageUrls;

  HouseModel({
    required this.id,
    required this.adType,
    required this.bedrooms,
    required this.bathrooms,
    required this.kitchens,
    required this.floors,
    required this.additionalFeatures,
    required this.propertyAddress,
    required this.distanceToMainRoad,
    required this.landSize,
    required this.totalPrice,
    required this.perMonthPrice,
    required this.description,
    // required this.imageUrl,
    required this.imageUrls,
  });

  factory HouseModel.fromMap(String id, Map<String, dynamic> data) {
    return HouseModel(
      id: id,
      adType: data['adType'],
      bedrooms: data['bedrooms'],
      bathrooms: data['bathrooms'],
      kitchens: data['kitchens'],
      floors: data['floors'],
      additionalFeatures: data['additionalFeatures'],
      propertyAddress: data['propertyAddress'],
      distanceToMainRoad: data['distanceToMainRoad'],
      landSize: data['landSize'],
      totalPrice: data['totalPrice'],
      perMonthPrice: data['perMonthPrice'],
      description: data['description'],
      imageUrls: List<String>.from(data['imageUrls'] ?? []),
      //imageUrls: data['imageUrls'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'adType': adType,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'kitchens': kitchens,
      'floors': floors,
      'additionalFeatures': additionalFeatures,
      'propertyAddress': propertyAddress,
      'distanceToMainRoad': distanceToMainRoad,
      'landSize': landSize,
      'totalPrice': totalPrice,
      'perMonthPrice': perMonthPrice,
      'description': description,
      'imageUrls': imageUrls,
    };
  }
}
