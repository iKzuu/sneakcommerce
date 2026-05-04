import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sneakcommerce/components/cards/cart_item_card.dart';
import 'package:sneakcommerce/models/cart_item.dart';

class CartItemCardList extends StatelessWidget {
  final List<CartItem> items;
  final void Function(CartItem item) onAction;
  final bool isCart;
  final double? imageWidth;
  final double? imageHeight;
  const CartItemCardList({
    super.key,
    required this.onAction,
    required this.items,
    this.isCart = false,
    this.imageWidth,
    this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final cartItem = items[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Slidable(
            endActionPane: ActionPane(
              motion: StretchMotion(),
              children: [
                CustomSlidableAction(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.redAccent,
                  onPressed: (_) => onAction(cartItem),
                  child: Icon(Icons.delete_outline_rounded, size: 32),
                ),
              ],
            ),
            child: CartItemCard(
              item: cartItem,
              imageWidth: imageWidth ?? 80,
              imageHeight: imageHeight ?? 80,
            ),
          ),
        );
      },
    );
  }
}
