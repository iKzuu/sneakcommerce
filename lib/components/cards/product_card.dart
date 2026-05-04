import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/controller/shoe_controller.dart';
import 'package:sneakcommerce/models/shoe.dart';
import 'package:sneakcommerce/pages/detail_page.dart';
import 'package:sneakcommerce/theme/app_colors.dart';
import 'package:sneakcommerce/utils/idr_formatter.dart';

class ProductCard extends StatelessWidget {
  final Shoe shoe;
  final double? imageWidth;
  final double? imageHeight;
  const ProductCard({
    super.key,
    required this.shoe,
    this.imageWidth = 110,
    this.imageHeight = 110,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoeController>(
      builder: (context, value, _) {
        final displayShoe = shoe;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(shoeId: displayShoe.id),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(color: AppColors.surface),
            child: Row(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: imageWidth,
                  height: imageHeight,
                  child: Image.network(
                    displayShoe.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),

                Expanded(
                  child: Column(
                    spacing: 6,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayShoe.name,
                        style: TextStyle(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      Text(
                        displayShoe.brand,
                        style: TextStyle(color: AppColors.onSurfaceVariant),
                      ),

                      Text(
                        formatRupiah(displayShoe.price),
                        style: TextStyle(
                          color: AppColors.onSurface,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
