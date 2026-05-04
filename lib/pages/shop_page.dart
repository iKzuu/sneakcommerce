import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/banner.dart';
import 'package:sneakcommerce/components/shoe_tile.dart';
import 'package:sneakcommerce/components/category.dart';
import 'package:sneakcommerce/controller/shoe_controller.dart';
import 'package:sneakcommerce/models/shoe.dart';
import 'package:sneakcommerce/theme/app_colors.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(spacing: 20, children: [BannerSlider(), Category()]),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, bottom: 8.0, top: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Featured",
                style: TextStyle(
                  color: AppColors.onBackground,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),

        Consumer<ShoeController>(
          builder: (context, value, index) {
            return SliverPadding(
              padding: EdgeInsets.only(left: 12.0, right: 12.0, bottom: 88.0),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  Shoe shoe = value.filteredShoes[index];
                  return ShoeTile(shoe: shoe);
                }, childCount: value.filteredShoes.length),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.68,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
