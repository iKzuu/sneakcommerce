import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/models/cart.dart';
import 'package:sneakcommerce/models/shoe.dart';

class CartItem extends StatefulWidget {
  Shoe shoe;
  CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {

  void removeItemFromCart() {
    Provider.of<Cart>(context, listen:  false).removeItemFromCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (BuildContext context) {
                removeItemFromCart();
              },
              icon: Iconsax.trash,
              foregroundColor: Colors.white,
              backgroundColor: Colors.redAccent,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Positioned(
                    child: Image.network(
                      widget.shoe.imagePath,
                      width: 140,
                      height: 140,
                    ),
                  ),
                ],
              ),
      
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.shoe.name,
                    style: TextStyle(
                      color: Color(0xFF242424),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
      
                  Text(widget.shoe.brand),
      
                  Text(widget.shoe.price),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
