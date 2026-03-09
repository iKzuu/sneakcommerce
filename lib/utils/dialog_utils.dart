import 'package:flutter/material.dart';
import 'package:sneakcommerce/theme/app_colors.dart';

class DialogUtils {
  static void showInfoDialog(
    BuildContext context,
    String title,
    String content,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.onBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            title,
            style: const TextStyle(
              color: AppColors.surface,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            content,
            style: const TextStyle(color: AppColors.surface),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Okie Dokie",
                style: TextStyle(color: AppColors.surface),
              ),
            ),
          ],
        );
      },
    );
  }
}
