import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/checkout_page_sections/address_section.dart';
import 'package:sneakcommerce/components/checkout_page_sections/checkout_items.dart';
import 'package:sneakcommerce/components/checkout_page_sections/order_details.dart';
import 'package:sneakcommerce/components/checkout_page_sections/payment_list.dart';
import 'package:sneakcommerce/controller/address_controller.dart';
import 'package:sneakcommerce/controller/cart_controller.dart';
import 'package:sneakcommerce/controller/order_controller.dart';
import 'package:sneakcommerce/controller/payment_method_controller.dart';
import 'package:sneakcommerce/controller/shipping_controller.dart';
import 'package:sneakcommerce/pages/home_page.dart';
import 'package:sneakcommerce/theme/app_colors.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        foregroundColor: AppColors.onSurface,
        backgroundColor: AppColors.surface,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
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
            // shipping address section
            AddressSection(),

            // checkout items section & shipping method section
            CheckoutItems(),

            // payment method section
            PaymentList(),

            // order details section
            OrderDetails(),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          height: 55,
          child:
              Consumer4<
                CartController,
                AddressController,
                PaymentMethodController,
                ShippingController
              >(
                builder:
                    (
                      context,
                      cartController,
                      addressController,
                      paymentController,
                      shippingController,
                      _,
                    ) {
                      return ElevatedButton(
                        onPressed: () async {
                          final success = await context
                              .read<OrderController>()
                              .checkout(
                                cartController: context.read<CartController>(),
                                addressController: context
                                    .read<AddressController>(),
                                paymentController: context
                                    .read<PaymentMethodController>(),
                                shippingController: context
                                    .read<ShippingController>(),
                              );

                          if (!success) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please complete checkout'),
                              ),
                            );

                            return;
                          }

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomePage(initialIndex: 1),
                            ),
                            (route) => false,
                          );
                        },
                        
                        style: ElevatedButton.styleFrom(
                          surfaceTintColor: Colors.transparent,
                          elevation: 0,
                          backgroundColor: AppColors.onBackground,
                          shadowColor: AppColors.onSurfaceVariant,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(4),
                          ),
                        ),
                        child: Text(
                          "Place Order",
                          style: TextStyle(
                            color: AppColors.surface,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
              ),
        ),
      ),
    );
  }
}
