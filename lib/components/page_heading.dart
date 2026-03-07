import 'package:flutter/material.dart';
import 'package:sneakcommerce/theme/app_colors.dart';

class PageHeading extends StatelessWidget {
  final String text;
  final IconData? icon;
  const PageHeading({super.key, required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        border: BoxBorder.fromLTRB(
          bottom: BorderSide(
            color: AppColors.onSurface,
            style: BorderStyle.solid,
            width: 4.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: AppColors.onSurface,
              fontWeight: FontWeight.w600,
              fontSize: 32,
            ),
          ),

          SizedBox(width: 12),

          icon != null
              ? Icon(icon, size: 32, color: AppColors.onSurface)
              : const SizedBox(),
        ],
      ),
    );
  }
}
