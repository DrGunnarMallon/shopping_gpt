import 'package:flutter/material.dart';
import '../models/item.dart';
import '../services/firebase_service.dart';

class ItemProvider with ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;

  void addItem(Item item) {
    FirebaseService.addItem(item);
    _items.add(item);
    notifyListeners();
  }

  Future<void> fetchItemsOnce() async {
    //if (items.isEmpty) {
    _items.clear();
    final snapshot = await FirebaseService.getItemsOnce();
    for (var doc in snapshot.docs) {
      _items.add(doc.data());
    }
    //}
    notifyListeners();
  }

  Future<void> saveItem(Item item) async {
    await FirebaseService.updateItem(item);
    final index = _items.indexWhere((i) => i.id == item.id);
    if (index != -1) {
      _items[index] = item; // Update the item in the list
    }
    notifyListeners();
  }

  Future<void> removeItem(Item item) async {
    await FirebaseService.deleteItem(item);
    _items.remove(item);
    notifyListeners();
  }
}
