import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/item_list.dart';
import 'package:sneakcommerce/models/cart.dart';
import 'package:sneakcommerce/models/shoe.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  void removeItemFromWishlist(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).removeItemFromWishlist(shoe);
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
              width: 200,
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
                    "Wishlist",
                    style: TextStyle(
                      color: Color(0xFF435150),
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                    ),
                  ),

                  SizedBox(width: 12),

                  Icon(Iconsax.heart, size: 32, color: Color(0xFF435150)),
                ],
              ),
            ),

            SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                itemCount: value.getUserWishlist().length,
                itemBuilder: (context, index) {
                  // get individual shoe
                  Shoe wishlistShoe = value.getUserWishlist()[index];

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
                              removeItemFromWishlist(wishlistShoe);
                            },
                            child: Icon(Icons.delete_outline_rounded, size: 32),
                          ),
                        ],
                      ),
                      child: ItemList(shoe: wishlistShoe),
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
