import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/cart_item.dart';
import 'package:sneakcommerce/models/cart.dart';
import 'package:sneakcommerce/models/shoe.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              decoration: BoxDecoration(
                border:BoxBorder.fromLTRB(bottom: BorderSide(
                  color: Colors.white,
                  style: BorderStyle.solid,
                  width: 4.0,
                ),),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Cart",
                    style: TextStyle(
                      color: Color(0xFF435150),
                      fontWeight: FontWeight.w600,
                      fontSize: 32
                    ),
                  ),
              
                  SizedBox(width: 12,),
              
                  Icon(
                    Iconsax.shopping_bag5,
                    size: 32,
                    color: Color(0xFF435150),
                  )
                ],
              ),
            ),

            SizedBox(height: 12,),

            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context,index) {
                  // get individual shoe
                  Shoe individualShoe = value.getUserCart()[index];

                  // return cart item
                  return CartItem(
                    shoe: individualShoe,
                  );
                }
              )
            ),
          ],
        ),
      ),
    );
  }
}