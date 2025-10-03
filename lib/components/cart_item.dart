import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
            CustomSlidableAction(
              foregroundColor: Colors.white,
              backgroundColor: Colors.redAccent,
              borderRadius: BorderRadius.circular(12),
              onPressed: (BuildContext context) {
                removeItemFromCart();
              },
              child: Icon(
                Icons.delete_outline_rounded,
                size: 32,
              ),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFAC9A8C).withValues(alpha: .6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 110,
                  height: 110,
                  child: Image.network(
                    widget.shoe.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
      
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
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

                    SizedBox(height: 12,),
                      
                    Text(
                      widget.shoe.brand,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.8)
                      ),
                    ),
                      
                    Text(
                      widget.shoe.price,
                      style: TextStyle(
                        color: Color(0xFF464646),
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
