import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/controller/cart_controller.dart';
import 'package:sneakcommerce/theme/app_colors.dart';

class SizePicker extends StatelessWidget {
  const SizePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, value, index) {
        return Row(
          spacing: 8,
          children: value.availableSize.map((size) {
            return GestureDetector(
              onTap: () => value.setSelectedSize(size),
              child: Container(
                width: 40,
                height: 40,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: value.tempSelectedSize == size
                      ? AppColors.onSurface
                      : AppColors.surface,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    size,
                    style: TextStyle(
                      color: value.tempSelectedSize == size
                          ? AppColors.surface
                          : AppColors.onSurface,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
