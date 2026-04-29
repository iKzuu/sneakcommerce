import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/controller/shipping_controller.dart';
import 'package:sneakcommerce/theme/app_colors.dart';
import 'package:sneakcommerce/utils/idr_formatter.dart';

class ShippingSheet extends StatelessWidget {
  const ShippingSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ShippingController>(
      builder: (context, controller, child) {
        return ListView(
          padding: EdgeInsets.all(10),
          shrinkWrap: true,
          children: controller.shippingList.map((method) {
            final isSelected = controller.selectedShipping?.id == method.id;

            return GestureDetector(
              onTap: () {
                controller.selectShipping(method);
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${method.name} (${formatRupiah(method.cost)})",
                            style: TextStyle(
                              color: AppColors.onSurface,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Estimated delivery: ${method.estimatedDelivery}",
                            style: TextStyle(
                              color: AppColors.onSurfaceVariant,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                    if (isSelected)
                      Icon(
                        Icons.check,
                        color: AppColors.onSurfaceVariant,
                        size: 18,
                      ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
