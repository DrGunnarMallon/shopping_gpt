import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/item_provider.dart';
import '../models/item.dart';
import '../widgets/item_form.dart';

class AddItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: ItemForm(
        onSubmit: (name, quantity) {
          final newItem = Item(
              id: DateTime.now().toString(), name: name, quantity: quantity);
          itemProvider.addItem(newItem);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
