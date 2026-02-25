import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/banner.dart';
import 'package:sneakcommerce/components/shoe_tile.dart';
import 'package:sneakcommerce/components/category.dart';
import 'package:sneakcommerce/controller/controller.dart';
import 'package:sneakcommerce/models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
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
            padding: EdgeInsets.only(left: 12.0, right: 12.0, bottom: 88.0),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                Shoe shoe = value.filteredShoes[index];
                return ShoeTile(shoe: shoe, shoeId: shoe.id);
              }, childCount: value.filteredShoes.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.68,
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
