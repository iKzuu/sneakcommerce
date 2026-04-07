import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/list_items.dart';
import 'package:sneakcommerce/controller/controller.dart';
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
      appBar: AppBar(
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
          Consumer<Controller>(
            builder: (context, value, index) {
              return ListItems(
                onAction: (shoe) {
                  context.read<Controller>().removeItemFromCart(shoe);
                },
                items: value.userCartItem,
                isCart: true,
                imageWidth: 80,
                imageHeight: 80,
              );
            },
          ),
        ],
      ),

      bottomNavigationBar: Consumer<Controller>(
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
                        formatRupiah(value.getTotalPrice()),
                        style: TextStyle(
                          color: AppColors.surface,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      surfaceTintColor: Colors.transparent,
                      elevation: 0,
                      backgroundColor: AppColors.surface,
                      shadowColor: AppColors.onSurfaceVariant,
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
