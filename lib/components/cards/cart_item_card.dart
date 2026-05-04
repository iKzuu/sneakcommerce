import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/cart_item_qty.dart';
import 'package:sneakcommerce/controller/cart_controller.dart';
import 'package:sneakcommerce/models/cart_item.dart';
import 'package:sneakcommerce/pages/detail_page.dart';
import 'package:sneakcommerce/theme/app_colors.dart';
import 'package:sneakcommerce/utils/idr_formatter.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;
  final double? imageWidth;
  final double? imageHeight;
  const CartItemCard({
    super.key,
    required this.item,
    this.imageWidth = 110,
    this.imageHeight = 110,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, value, _) {
        final displayShoe = item;

        return Stack(
          children: [
            GestureDetector(
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
                      height: 20,
                      width: 32,
                      child: Checkbox(
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                        value: item.isSelected,
                        activeColor: AppColors.onSurface,
                        checkColor: AppColors.background,
                        onChanged: (val) {
                          value.toggleSelection(item);
                        },
                      ),
                    ),

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
                            "${displayShoe.selectedSize}",
                            style: TextStyle(color: AppColors.onSurface),
                          ),

                          Text(
                            displayShoe.brand,
                            style: TextStyle(color: AppColors.onSurfaceVariant),
                          ),

                          Text(
                            formatRupiah(displayShoe.price),
                            style: TextStyle(
                              color: AppColors.onSurface,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            CartItemQty(item: item, positionBottom: 10, positionRight: 10),
          ],
        );
      },
    );
  }
}
