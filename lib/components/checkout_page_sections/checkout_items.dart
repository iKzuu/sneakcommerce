import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/cards/checkout_item_card.dart';
import 'package:sneakcommerce/components/bottom_sheets/shipping_sheet.dart';
import 'package:sneakcommerce/controller/cart_controller.dart';
import 'package:sneakcommerce/controller/shipping_controller.dart';
import 'package:sneakcommerce/theme/app_colors.dart';
import 'package:sneakcommerce/utils/idr_formatter.dart';

class CheckoutItems extends StatelessWidget {
  const CheckoutItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(color: AppColors.surface),
      child: Column(
        spacing: 10,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "You'll checkout these items",
              style: TextStyle(
                color: AppColors.onSurface,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // checkout items
          Consumer<CartController>(
            builder: (context, controller, child) {
              final selectedItems = controller.selectedItems;

              return Column(
                children: selectedItems.map((shoe) {
                  return CheckoutItemCard(shoe: shoe);
                }).toList(),
              );
            },
          ),

          Consumer<ShippingController>(
            builder: (context, controller, child) {
              final shipping = controller.selectedShipping;

              return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => ShippingSheet(),
                    backgroundColor: AppColors.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    border: Border.all(color: AppColors.onSurfaceVariant),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              shipping != null
                                  ? "${shipping.name} (${formatRupiah(shipping.cost)})"
                                  : "Select Shipping Method",
                              style: TextStyle(
                                color: AppColors.onSurface,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            Text(
                              shipping != null
                                  ? "Estimated delivery: ${shipping.estimatedDelivery}"
                                  : "",
                              style: TextStyle(
                                color: AppColors.onSurfaceVariant,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.onSurfaceVariant,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
