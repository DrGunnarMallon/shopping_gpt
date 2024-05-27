import 'package:flutter/material.dart';
import 'package:shopping_gpt/models/item.dart';
import 'package:shopping_gpt/utils/styled_text.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(this.item, {super.key, required this.onTap});

  final Item item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Image.asset('assets/images/${item.name.toLowerCase()}.png',
                  height: 50, errorBuilder: (context, error, stackTract) {
                return Image.asset('assets/images/bread.png', height: 50);
              }),
              const SizedBox(width: 16),
              StyledText(item.name),
              const SizedBox(width: 16),
              StyledText(item.quantity.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
