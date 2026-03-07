import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/list_items.dart';
import 'package:sneakcommerce/components/page_heading.dart';
import 'package:sneakcommerce/controller/controller.dart';

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
        SliverToBoxAdapter(
          child: PageHeading(text: "Wishlist", icon: Iconsax.heart5),
        ),

        Consumer<Controller>(
          builder: (context, value, index) {
            return ListItems(
              onAction: (shoe) {
                context.read<Controller>().toggleFavorite(shoe.id);
                context.read<Controller>().removeItemFromWishlist(shoe);
              },
              items: value.userWishlistItem,
            );
          },
        ),
      ],
    );
  }
}
