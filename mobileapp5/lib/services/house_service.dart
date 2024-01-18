import 'package:cloud_firestore/cloud_firestore.dart';
import '/models/house_model.dart';

class HouseService {
  final CollectionReference houses =
      FirebaseFirestore.instance.collection('houses');

  // Create a new house record
  Future<String> createHouse(HouseModel house) async {
    DocumentReference docRef = await houses.add(house.toMap());
    return docRef.id;
  }

  // Read all houses
  Stream<List<HouseModel>> getHouses() {
    return houses.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return HouseModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  // Update a house record
  Future<void> updateHouse(String id, HouseModel updatedHouse) async {
    await houses.doc(id).update(updatedHouse.toMap());
  }

  // Delete a house record
  Future<void> deleteHouse(String id) async {
    await houses.doc(id).delete();
  }
}
