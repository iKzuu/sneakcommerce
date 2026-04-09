import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/quantity.dart';
import 'package:sneakcommerce/controller/controller.dart';
import 'package:sneakcommerce/models/shoe.dart';
import 'package:sneakcommerce/pages/detail_page.dart';
import 'package:sneakcommerce/theme/app_colors.dart';
import 'package:sneakcommerce/utils/idr_formatter.dart';

class ItemList extends StatelessWidget {
  final Shoe shoe;
  final double? imageWidth;
  final double? imageHeight;
  final bool isCart;
  final bool isCheckout;
  const ItemList({
    super.key,
    required this.shoe,
    this.imageWidth = 110,
    this.imageHeight = 110,
    this.isCart = false,
    this.isCheckout = false,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
      builder: (context, value, index) {
        final displayShoe = shoe;

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
                    if (isCart)
                      SizedBox(
                        height: 20,
                        width: 32,
                        child: Checkbox(
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: shoe.isSelected,
                          activeColor: AppColors.onSurface,
                          checkColor: AppColors.background,
                          onChanged: (val) {
                            value.toggleSelection(shoe);
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

                          if ((isCart || isCheckout) &&
                              displayShoe.selectedSize != null)
                            Text(
                              "${displayShoe.selectedSize}",
                              style: TextStyle(color: AppColors.onSurface),
                            ),

                          Text(
                            displayShoe.brand,
                            style: TextStyle(color: AppColors.onSurfaceVariant),
                          ),

                          if (isCheckout)
                            Row(
                              spacing: 6,
                              children: [
                                Text(
                                  formatRupiah(displayShoe.price),
                                  style: TextStyle(
                                    color: AppColors.onSurface,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                Text(
                                  "x${displayShoe.quantity}",
                                  style: TextStyle(
                                    color: AppColors.onSurfaceVariant,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            )
                          else
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

            if (isCart)
              Quantity(shoe: shoe, positionBottom: 10, positionRight: 10),
          ],
        );
      },
    );
  }
}
