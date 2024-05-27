import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/item.dart';

class FirebaseService {
  static final ref = FirebaseFirestore.instance
      .collection('items')
      .withConverter(
          fromFirestore: Item.fromFirestore,
          toFirestore: (Item i, _) => i.toFirestore());

  static Future<void> addItem(Item item) async {
    await ref.doc(item.id).set(item);
  }

  static Future<QuerySnapshot<Item>> getItemsOnce() async {
    return ref.get();
  }

  static Future<void> updateItem(Item item) async {
    await ref.doc(item.id).update({
      'name': item.name,
      'quantity': item.quantity,
      'isBought': item.isBought,
    });
  }

  static Future<void> deleteItem(Item item) async {
    await ref.doc(item.id).delete();
  }
}
