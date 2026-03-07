import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/controller/controller.dart';
import 'package:sneakcommerce/models/shoe.dart';
import 'package:sneakcommerce/theme/app_colors.dart';

class BottomAddToCartBtn extends StatelessWidget {
  final Shoe shoe;
  const BottomAddToCartBtn({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: AppColors.surface,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            context.read<Controller>().addItemToCart(shoe);

            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: AppColors.onBackground,
                title: Text(
                  "Added 1 item to cart",
                  style: TextStyle(color: AppColors.surface),
                ),
                content: Text(
                  "Check your cart",
                  style: TextStyle(color: AppColors.surface),
                ),
              ),
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
              Icon(Iconsax.shopping_bag5, size: 18, color: AppColors.onSurface),
              Text(
                "Add To Cart",
                style: TextStyle(
                  color: AppColors.onSurface,
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
