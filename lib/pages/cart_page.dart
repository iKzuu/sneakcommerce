import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/list_items.dart';
import 'package:sneakcommerce/components/page_heading.dart';
import 'package:sneakcommerce/controller/controller.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: PageHeading(text: "Cart", icon: Iconsax.shopping_bag5),
        ),

        Consumer<Controller>(
          builder: (context, value, index) {
            return ListItems(
              onAction: (shoe) {
                context.read<Controller>().removeItemFromCart(shoe);
              },
              items: value.userCartItem,
              isCart: true,
            );
          },
        ),
      ],
    );
  }
}
