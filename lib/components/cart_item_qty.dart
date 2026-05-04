import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/controller/cart_controller.dart';
import 'package:sneakcommerce/models/cart_item.dart';
import 'package:sneakcommerce/theme/app_colors.dart';

class CartItemQty extends StatelessWidget {
  final CartItem item;
  final double? positionRight;
  final double? positionBottom;
  final double? positionTop;
  final double? positionLeft;
  const CartItemQty({
    super.key,
    required this.item,
    this.positionRight,
    this.positionBottom,
    this.positionTop,
    this.positionLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, value, index) {
        return Positioned(
          right: positionRight,
          bottom: positionBottom,
          top: positionTop,
          left: positionLeft,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.onSurface),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              spacing: 14,
              children: [
                IconButton(
                  onPressed: () => value.decrementQuantity(item),
                  icon: Icon(
                    item.quantity <= 1
                        ? Icons.delete_outline_rounded
                        : Icons.remove_outlined,
                    color: AppColors.onSurface,
                    size: 22,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  style: const ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
                Text(
                  item.quantity.toString(),
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                IconButton(
                  onPressed: () => value.incrementQuantity(item),
                  icon: Icon(
                    Icons.add_outlined,
                    size: 22,
                    color: item.quantity >= 5
                        ? AppColors.onSurfaceVariant
                        : AppColors.onSurface,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  style: const ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
