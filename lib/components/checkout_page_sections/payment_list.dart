import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/controller/payment_method_controller.dart';
import 'package:sneakcommerce/theme/app_colors.dart';

class PaymentList extends StatelessWidget {
  const PaymentList({super.key});

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
              "Payment Method",
              style: TextStyle(
                color: AppColors.onSurface,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Consumer<PaymentMethodController>(
            builder: (context, controller, child) {
              return Column(
                children: controller.paymentMethodList.map((method) {
                  final isSelected =
                      controller.selectedPaymentMethod?.id == method.id;

                  return GestureDetector(
                    onTap: () {
                      controller.selectPaymentMethod(method);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(color: AppColors.surface),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            width: 36,
                            height: 36,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: AppColors.surface),
                            child: Image.asset(
                              method.imageUrl,
                              fit: BoxFit.contain,
                            ),
                          ),

                          Expanded(
                            child: Text(
                              method.name,
                              style: TextStyle(
                                color: AppColors.onSurface,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          if (isSelected)
                            Icon(Icons.check_circle, color: Colors.greenAccent)
                          else
                            Icon(
                              Icons.radio_button_off,
                              color: AppColors.onSurfaceVariant,
                            ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
