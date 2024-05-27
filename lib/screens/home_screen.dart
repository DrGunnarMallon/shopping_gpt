import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_gpt/screens/edit_item_screen.dart';
import 'package:shopping_gpt/screens/item_card.dart';
import 'package:shopping_gpt/utils/styled_text.dart';
import '../providers/item_provider.dart';
import 'add_item_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<ItemProvider>(context, listen: false).fetchItemsOnce();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Shopping List'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Consumer<ItemProvider>(builder: (context, value, child) {
                return ListView.builder(
                    itemCount: value.items.length,
                    itemBuilder: (_, index) {
                      return Dismissible(
                        key: ValueKey(value.items[index].id),
                        onDismissed: (direction) {
                          Provider.of<ItemProvider>(context, listen: false)
                              .removeItem(value.items[index]);
                        },
                        child: ItemCard(
                          value.items[index],
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) =>
                                    EditItemScreen(value.items[index]),
                              ),
                            );
                          },
                        ),
                      );
                    });
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 0),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => AddItemScreen()));
                },
                child: const Icon(Icons.add),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 32),
              child: FloatingActionButton(
                onPressed: () {
                  Provider.of<ItemProvider>(context, listen: false)
                      .fetchItemsOnce();
                },
                child: const Icon(Icons.refresh),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
