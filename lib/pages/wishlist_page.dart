import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/card_list/product_card_list.dart';
import 'package:sneakcommerce/controller/shoe_controller.dart';
import 'package:sneakcommerce/controller/wishlist_controller.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Consumer2<WishlistController, ShoeController>(
          builder: (context, wishlistController, shoeController, _) {
            return ProductCardList(
              onAction: (shoe) {
                wishlistController.toggleFavorite(shoe.id);
              },
              items: wishlistController.getWihlistShoes(),
            );
          },
        ),
      ],
    );
  }
}
