import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  String id;
  String name;
  int quantity;
  bool isBought;

  Item(
      {required this.id,
      required this.name,
      required this.quantity,
      this.isBought = false});

  factory Item.fromMap(Map<String, dynamic> data, String documentId) {
    return Item(
      id: documentId,
      name: data['name'],
      quantity: data['quantity'],
      isBought: data['isBought'],
    );
  }

  // item to firestore (map)
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'quantity': quantity,
      'isBought': isBought,
    };
  }

  factory Item.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data()!;

    Item item = Item(
      id: snapshot.id,
      name: data['name'],
      quantity: data['quantity'],
      isBought: data['isBought'],
    );

    return item;
  }
}
