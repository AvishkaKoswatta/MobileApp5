import 'package:flutter/material.dart';
import '/models/house_model.dart';
import '/models/land_model.dart'; 

class ReadAd extends StatelessWidget {
  final dynamic ad; 

  ReadAd({required this.ad});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ad Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           // Text('Ad Type: ${ad.adType}'),
            if (ad is HouseModel) ...{
              
              Text('Ad Type: ${ad.adType}'),
            Text('Bedrooms: ${ad.bedrooms}'),
            Text('Bathrooms: ${ad.bathrooms}'),
            Text('Kitchen: ${ad.kitchens}'),
            Text('Floors: ${ad.floors}'),
            Text('Additional Features: ${ad.additionalFeatures}'),
            Text('Distance to main road: ${ad.distanceToMainRoad}'),
            Text('Land Size: ${ad.landSize}'),
            Text('Total Price: ${ad.totalPrice}'),
            Text('Monthly: ${ad.perMonthPrice}'),
            Text('Description: ${ad.description}'),
            },
            if (ad is LandModel) ...{
             
              Text('Land Size: ${ad.landSize}'),
             
            },
             Text('Distance to main road: ${ad.distanceToMainRoad}'),
            Text('Land Size: ${ad.landSize}'),
            Text('Total Price: ${ad.totalPrice}'),
            Text('Monthly: ${ad.perMonthPrice}'),
            Text('Description: ${ad.description}'),
          ],
        ),
      ),
    );
  }
}
