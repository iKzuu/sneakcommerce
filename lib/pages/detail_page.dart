import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/bottom_add_to_cart_btn.dart';
import 'package:sneakcommerce/components/size_picker.dart';
import 'package:sneakcommerce/controller/shoe_controller.dart';
import 'package:sneakcommerce/controller/wishlist_controller.dart';
import 'package:sneakcommerce/pages/cart_page.dart';
import 'package:sneakcommerce/pages/route_transition.dart';
import 'package:sneakcommerce/theme/app_colors.dart';
import 'package:sneakcommerce/utils/idr_formatter.dart';

class DetailPage extends StatelessWidget {
  final int shoeId;
  const DetailPage({super.key, required this.shoeId});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ShoeController, WishlistController>(
      builder: (context, shoeController, wishlistController, _) {
        final shoe = shoeController.shoeShopList.firstWhere((shoe) => shoe.id == shoeId);

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            foregroundColor: AppColors.onSurface,
            backgroundColor: AppColors.surface,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(createRoute());
                },
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.onSurface,
                ),
              ),
            ],
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 320,
                      child: Image.network(shoe.imagePath, fit: BoxFit.cover),
                    ),

                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: IconButton(
                        onPressed: () {
                          context.read<WishlistController>().toggleFavorite(shoeId);
                        },
                        icon: Icon(
                          wishlistController.isFavorite(shoeId)
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SliverPadding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shoe.name,
                        style: TextStyle(
                          color: AppColors.onSurface,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        shoe.brand,
                        style: TextStyle(
                          color: AppColors.onSurfaceVariant,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        formatRupiah(shoe.price),
                        style: TextStyle(
                          color: AppColors.onSurface,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverToBoxAdapter(child: SizePicker()),
              ),
            ],
          ),

          bottomNavigationBar: BottomAddToCartBtn(shoe: shoe),
        );
      },
    );
  }
}
