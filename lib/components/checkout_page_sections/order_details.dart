import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/summary_item.dart';
import 'package:sneakcommerce/controller/controller.dart';
import 'package:sneakcommerce/controller/shipping_controller.dart';
import 'package:sneakcommerce/theme/app_colors.dart';
import 'package:sneakcommerce/utils/idr_formatter.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.surface),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Order details",
              style: TextStyle(
                color: AppColors.onSurface,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Consumer2<Controller, ShippingController>(
            builder: (context, cartController, shippingController, _) {
              final totalItem = cartController.getTotalPrice();
              final shippingCost =
                  shippingController.selectedShipping?.cost ?? 0;
              final total = totalItem + shippingCost;

              return Column(
                spacing: 20,
                children: [
                  Column(
                    children: [
                      SummaryItem(
                        label:
                            "Total Price (${cartController.getSelectedItemQuantity()} Item)",
                        value: formatRupiah(totalItem),
                      ),
                      SummaryItem(
                        label: "Shipping Cost",
                        value: formatRupiah(shippingCost.toDouble()),
                      ),
                    ],
                  ),
                  SummaryItem(
                    label: "Total Bill",
                    value: formatRupiah(total),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
