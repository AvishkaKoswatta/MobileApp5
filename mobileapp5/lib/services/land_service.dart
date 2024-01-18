import 'package:cloud_firestore/cloud_firestore.dart';
import '/models/land_model.dart';

class LandService {
  final CollectionReference lands =
      FirebaseFirestore.instance.collection('lands');

  // Create a new house record
  Future<String> createLand(LandModel land) async {
    DocumentReference docRef = await lands.add(land.toMap());
    return docRef.id;
  }

  // Read all houses
  Stream<List<LandModel>> getlands() {
    return lands.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return LandModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  // Update a house record
  Future<void> updateLand(String id, LandModel updatedLand) async {
    await lands.doc(id).update(updatedLand.toMap());
  }

  // Delete a house record
  Future<void> deleteLand(String id) async {
    await lands.doc(id).delete();
  }
}
