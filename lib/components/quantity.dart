import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/controller/controller.dart';
import 'package:sneakcommerce/models/shoe.dart';
import 'package:sneakcommerce/theme/app_colors.dart';

class Quantity extends StatelessWidget {
  final Shoe shoe;
  const Quantity({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
      builder: (context, value, index) {
        return Positioned(
          right: 10,
          bottom: 6,
          child: Row(
            children: [
              IconButton(
                onPressed: () =>
                    value.decrementQuantity(shoe),
                icon: Icon(
                  shoe.quantity <= 1
                      ? Icons.delete_outline_rounded
                      : Icons.remove_circle_outline_rounded,
                  color: AppColors.onSurface,
                ),
              ),
              Text(
                shoe.quantity.toString(),
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              IconButton(
                onPressed: () =>
                    value.incrementQuantity(shoe),
                icon: Icon(
                  Icons.add_circle_outline_rounded,
                  color: shoe.quantity >= 5
                      ? AppColors.onSurfaceVariant
                      : AppColors.onSurface,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
