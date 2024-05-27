import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/item.dart';
import '../providers/item_provider.dart';
import '../widgets/item_form.dart';

class EditItemScreen extends StatelessWidget {
  final Item item;

  EditItemScreen(this.item);

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Item'),
        centerTitle: true,
      ),
      body: ItemForm(
        initialName: item.name,
        initialQuantity: item.quantity,
        onSubmit: (name, quantity) {
          final updatedItem = Item(
            id: item.id,
            name: name,
            quantity: quantity,
            isBought: item.isBought,
          );
          itemProvider.saveItem(updatedItem);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
