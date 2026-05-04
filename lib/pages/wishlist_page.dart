import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/card_list/product_card_list.dart';
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
        Consumer<WishlistController>(
          builder: (context, value, _) {
            return ProductCardList(
              onAction: (shoe) {
                context.read<WishlistController>().toggleFavorite(shoe.id);
                context.read<WishlistController>().removeItemFromWishlist(shoe);
              },
              items: value.userWishlistItem,
              
              // atau kalau aku engga set imageWidth/Height di sini juga image gede

            );
          },
        ),
      ],
    );
  }
}
