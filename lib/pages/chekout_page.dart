import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/item_list.dart';
import 'package:sneakcommerce/components/shipping_sheet.dart';
import 'package:sneakcommerce/controller/controller.dart';
import 'package:sneakcommerce/controller/shipping_controller.dart';
import 'package:sneakcommerce/theme/app_colors.dart';
import 'package:sneakcommerce/utils/idr_formatter.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ShippingController>();
    controller.initShipping();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        foregroundColor: AppColors.onSurface,
        backgroundColor: AppColors.surface,
        title: const Text(
          "Checkout",
          style: TextStyle(color: AppColors.onSurface),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: [
            // address shipping
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(color: AppColors.surface),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      spacing: 6,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your shipping address",
                          style: TextStyle(
                            color: AppColors.onSurfaceVariant,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          spacing: 4,
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: Colors.lightBlueAccent,
                            ),
                            Expanded(
                              child: Text(
                                "My Home | Your Name",
                                style: TextStyle(
                                  color: AppColors.onSurface,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Jl. Contoh Alamat No. 123, Jakarta, Indonesia",
                          style: TextStyle(
                            color: AppColors.onSurfaceVariant,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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

            Container(
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

                  Consumer<Controller>(
                    builder: (context, controller, child) {
                      final selectedItems = controller.userCartItem
                          .where((item) => item.isSelected)
                          .toList();

                      return Column(
                        children: selectedItems.map((shoe) {
                          return ItemList(shoe: shoe, isCheckout: true);
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
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            border: Border.all(
                              color: AppColors.onSurfaceVariant,
                            ),
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
            ),
          ],
        ),
      ),
    );
  }
}
