import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/card_list/cart_item_card_list.dart';
import 'package:sneakcommerce/controller/cart_controller.dart';
import 'package:sneakcommerce/pages/checkout_page.dart';
import 'package:sneakcommerce/theme/app_colors.dart';
import 'package:sneakcommerce/utils/idr_formatter.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        foregroundColor: AppColors.onSurface,
        backgroundColor: AppColors.surface,
        title: Text("Cart"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          Consumer<CartController>(
            builder: (context, value, _) {
              return CartItemCardList(
                onAction: (item) {
                  context.read<CartController>().removeItemFromCart(item);
                },
                items: value.userCartItem,
                imageWidth: 80,
                imageHeight: 80,
              );
            },
          ),
        ],
      ),

      bottomNavigationBar: Consumer<CartController>(
        builder: (context, value, child) {
          if (value.userCartItem.isEmpty) return const SizedBox.shrink();

          return Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: AppColors.onSurface),
            child: SafeArea(
              child: Row(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          color: AppColors.onSurfaceVariant,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        formatRupiah(value.totalPrice),
                        style: TextStyle(
                          color: AppColors.surface,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: value.hasSelectedItem
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CheckoutPage(),
                              ),
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      surfaceTintColor: Colors.transparent,
                      elevation: 0,
                      backgroundColor: AppColors.surface,
                      shadowColor: AppColors.onSurfaceVariant,
                      disabledBackgroundColor: AppColors.onSurfaceVariant
                          .withValues(alpha: 0.3),
                      disabledForegroundColor: AppColors.surface.withValues(
                        alpha: 0.5,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(4),
                      ),
                    ),
                    child: const Text(
                      "Checkout",
                      style: TextStyle(
                        color: AppColors.onSurface,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
