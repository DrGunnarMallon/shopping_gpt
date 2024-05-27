import 'package:flutter/material.dart';
import '../models/item.dart';
import '../screens/edit_item_screen.dart';

class ItemTile extends StatelessWidget {
  final Item item;

  ItemTile(this.item);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text('Quantity: ${item.quantity}'),
      trailing: IconButton(
        icon: Icon(Icons.edit),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => EditItemScreen(item)));
        },
      ),
    );
  }
}
