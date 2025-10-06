import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/item_list.dart';
import 'package:sneakcommerce/models/cart.dart';
import 'package:sneakcommerce/models/shoe.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  void removeItemFromCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(shoe);
  }

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
                border: BoxBorder.fromLTRB(
                  bottom: BorderSide(
                    color: Colors.white,
                    style: BorderStyle.solid,
                    width: 4.0,
                  ),
                ),
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
                      fontSize: 32,
                    ),
                  ),

                  SizedBox(width: 12),

                  Icon(
                    Iconsax.shopping_bag5,
                    size: 32,
                    color: Color(0xFF435150),
                  ),
                ],
              ),
            ),

            SizedBox(height: 12),

            // cart item list
            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context, index) {
                  // get individual shoe
                  Shoe cartShoe = value.getUserCart()[index];

                  // return cart item
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Slidable(
                      endActionPane: ActionPane(
                        motion: StretchMotion(),
                        children: [
                          CustomSlidableAction(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.redAccent,
                            borderRadius: BorderRadius.circular(12),
                            onPressed: (BuildContext context) {
                              removeItemFromCart(cartShoe);
                            },
                            child: Icon(Icons.delete_outline_rounded, size: 32),
                          ),
                        ],
                      ),
                      child: ItemList(
                        shoe: cartShoe,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
