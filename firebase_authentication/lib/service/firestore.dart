import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference food = FirebaseFirestore.instance.collection(
    'food',
  );

  Stream<QuerySnapshot> getFoodStream() {
    final foodStream = food
        .where('category', isEqualTo: 'dessert'.toLowerCase())
        .orderBy('name')
        .snapshots();
    return foodStream;
  }

  Future<void> addFood(String name, double price, String category) {
    return food.add({
      'name': name,
      'price': price,
      'category': category,
      'timestamp': Timestamp.now(),
    });
  }

  Future<void> updateFood(
    String docID,
    String newName,
    double newPrice,
    String category,
  ) {
    return food.doc(docID).update({
      'name': newName,
      'price': newPrice,
      'category': category,
      'timestamp': Timestamp.now(),
    });
  }

  Future<void> deleteFood(String docID) {
    return food.doc(docID).delete();
  }
}
