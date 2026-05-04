import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/controller/cart_controller.dart';
import 'package:sneakcommerce/models/shoe.dart';
import 'package:sneakcommerce/theme/app_colors.dart';
import 'package:sneakcommerce/utils/dialog_utils.dart';

class BottomAddToCartBtn extends StatelessWidget {
  final Shoe shoe;
  const BottomAddToCartBtn({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: AppColors.onSurface,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            context.read<CartController>().addItemToCart(
              shoe,
              onMaxReached: () {
                DialogUtils.showInfoDialog(
                  context,
                  "Maximum Amount Reached",
                  "You can only purchase a maximum of 5 pairs for each model and size",
                );
              },
              onSuccess: () {
                DialogUtils.showInfoDialog(
                  context,
                  "Added 1 item to cart",
                  "Check your cart",
                );
              },
              onSizeNotSelected: () {
                DialogUtils.showInfoDialog(
                  context,
                  "Size Not selected",
                  "Please select size first",
                );
              },
            );
          },

          style: ElevatedButton.styleFrom(
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            backgroundColor: Colors.transparent,
            shadowColor: AppColors.onSurfaceVariant,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
            children: [
              Icon(Iconsax.shopping_bag5, size: 18, color: AppColors.surface),
              Text(
                "Add To Cart",
                style: TextStyle(
                  color: AppColors.surface,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
