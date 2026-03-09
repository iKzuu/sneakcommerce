import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/bottom_add_to_cart_btn.dart';
import 'package:sneakcommerce/components/size_picker.dart';
import 'package:sneakcommerce/controller/controller.dart';
import 'package:sneakcommerce/pages/route_transition.dart';
import 'package:sneakcommerce/theme/app_colors.dart';
import 'package:sneakcommerce/utils/idr_formatter.dart';

class DetailPage extends StatelessWidget {
  final int shoeId;
  const DetailPage({super.key, required this.shoeId});

  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
      builder: (context, value, index) {
        final shoe = value.shoeShopList.firstWhere((shoe) => shoe.id == shoeId);

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            foregroundColor: AppColors.onSurface,
            backgroundColor: AppColors.surface,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(createRoute());
                },
                icon: Icon(Icons.search),
              ),
              IconButton(onPressed: () {}, icon: Icon(Iconsax.shopping_bag)),
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
                          value.toggleFavorite(shoeId);
                        },
                        icon: Icon(
                          shoe.isFavorite ? Iconsax.heart5 : Iconsax.heart,
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
