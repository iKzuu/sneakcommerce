import 'package:flutter/material.dart';
import 'package:sneakcommerce/components/checkout_page_sections/address_section.dart';
import 'package:sneakcommerce/components/checkout_page_sections/checkout_items.dart';
import 'package:sneakcommerce/components/checkout_page_sections/payment_list.dart';
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
          ],
        ),
      ),
    );
  }
}
