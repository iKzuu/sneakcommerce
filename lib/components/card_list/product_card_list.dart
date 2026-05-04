import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sneakcommerce/components/cards/product_card.dart';
import 'package:sneakcommerce/models/shoe.dart';

class ProductCardList extends StatelessWidget {
  final List<Shoe> items;
  final void Function(Shoe shoe) onAction;
  final double? imageWidth;
  final double? imageHeight;
  const ProductCardList({
    super.key,
    required this.onAction,
    required this.items,
    this.imageWidth,
    this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final shoe = items[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Slidable(
            endActionPane: ActionPane(
              motion: StretchMotion(),
              children: [
                CustomSlidableAction(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.redAccent,
                  onPressed: (_) => onAction(shoe),
                  child: Icon(Icons.delete_outline_rounded, size: 32),
                ),
              ],
            ),
            child: ProductCard(
              shoe: shoe,
              imageWidth: imageWidth ?? 110,
              imageHeight: imageHeight ?? 110,
            ),
          ),
        );
      },
    );
  }
}
