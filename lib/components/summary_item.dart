import 'package:flutter/material.dart';
import 'package:sneakcommerce/theme/app_colors.dart';

class SummaryItem extends StatelessWidget {
  final String label;
  final String value;
  final double? fontSize;
  final FontWeight? fontWeight;

  const SummaryItem({
    super.key,
    required this.label,
    required this.value,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: AppColors.onSurfaceVariant,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: AppColors.onSurface,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ],
      ),
    );
  }
}
