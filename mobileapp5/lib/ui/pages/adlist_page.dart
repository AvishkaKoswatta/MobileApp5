import 'package:flutter/material.dart';
import '/models/house_model.dart';
import '/models/land_model.dart';
import '/services/house_service.dart';
import '/services/land_service.dart';
import 'readad_page.dart';
import 'housead_page.dart';
import 'landad_page.dart';
import 'package:rxdart/rxdart.dart';

class AdList extends StatefulWidget {
  const AdList({Key? key}) : super(key: key);

  @override
  _AdListState createState() => _AdListState();
}

class _AdListState extends State<AdList> {
  final HouseService _houseService = HouseService();
  final LandService _landService = LandService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Ads'),
      ),
      body: StreamBuilder<List<dynamic>>(
  stream: Rx.combineLatest2(
    _houseService.getHouses(),
    _landService.getlands(),
    (List<HouseModel> houses, List<LandModel> lands) {
      List<dynamic> combinedList = [];
      combinedList.addAll(houses);
      combinedList.addAll(lands);
      return combinedList;
    },
  ),
  builder: (context, snapshot) {
    print("Snapshot: $snapshot"); // Add this line for debugging

    if (snapshot.hasError) {
      return Center(
        child: Text('Error: ${snapshot.error}'),
      );
    }

    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    List<dynamic>? ads = snapshot.data;
    print("Ads: $ads"); // Add this line for debugging

    if (ads == null || ads.isEmpty) {
      return Center(
        child: Text('No ads available.'),
      );
    }

    return ListView.builder(
      itemCount: ads.length,
      itemBuilder: (context, index) {
        if (ads![index] is HouseModel) {
          HouseModel houseAd = ads![index] as HouseModel;
          return buildHouseAdCard(houseAd, index);
        } else if (ads![index] is LandModel) {
          LandModel landAd = ads![index] as LandModel;
          return buildLandAdCard(landAd, index);
        }
        return Container();
      },
    );
  },
),

    );
  }

  Widget buildHouseAdCard(HouseModel houseAd, int index) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text('House Ad ${index + 1}'),
        trailing: buildTrailingIcons(houseAd),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReadAd(ad: houseAd),
            ),
          );
        },
      ),
    );
  }

  Widget buildLandAdCard(LandModel landAd, int index) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text('Land Ad ${index + 1}'),
        trailing: buildTrailingIcons(landAd),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReadAd(ad: landAd),
            ),
          );
        },
      ),
    );
  }

  Row buildTrailingIcons(dynamic ad) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => (ad is HouseModel)
                    ? HouseAdPage(initialHouse: ad)
                    : LandAdPage(initialLand: ad),
              ),
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            _showDeleteConfirmationDialog(context, ad);
          },
        ),
      ],
    );
  }

  Future<void> _showDeleteConfirmationDialog(
      BuildContext context, dynamic ad) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Ad'),
          content: Text('Are you sure you want to delete this ad?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                if (ad is HouseModel) {
                  await _houseService.deleteHouse(ad.id);
                } else if (ad is LandModel) {
                  // Delete the land ad
                  // Example: await _landService.deleteLand(ad.id);
                  await _landService.deleteLand(ad.id);
                }
                Navigator.pop(context);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
