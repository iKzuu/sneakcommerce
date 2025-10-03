import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/banner.dart';
import 'package:sneakcommerce/components/shoe_tile.dart';
import 'package:sneakcommerce/components/category.dart';
import 'package:sneakcommerce/models/cart.dart';
import 'package:sneakcommerce/models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  void addShoeToWishlist(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToWishlist(shoe);
  }

  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF435150),
        title: Text(
          "Added 1 item to cart",
          style: TextStyle(color: Colors.white),
        ),
        content: Text("Check your cart", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<Cart>(
      builder: (context, value, child) => CustomScrollView(
        slivers: [

          SliverToBoxAdapter(
            child: Column(
              children: [

                BannerSlider(),

                SizedBox(height: 20),

                Category(),

                SizedBox(height: 20),
              ],
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, bottom: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Featured",
                  style: TextStyle(
                    color: Color(0xFF242424),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                Shoe shoe = value.getShoeList()[index];
                return ShoeTile(
                  shoe: shoe,
                  shoeId: shoe.id,
                  onTap: () => addShoeToCart(shoe),
                  onPressed: () => addShoeToWishlist(shoe),
                );
              },
                childCount: value.shoeShop.length
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.74,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
