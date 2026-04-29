import 'package:flutter/material.dart';
import 'package:sneakcommerce/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Widget? prefixIcon;
  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, TextEditingValue value, _) {
        return TextField(
          cursorHeight: 18,
          cursorColor: AppColors.onSurface,
          controller: controller,
          style: TextStyle(color: AppColors.onSurface, fontSize: 14),
          decoration: InputDecoration(
            hintText: hintText,

            contentPadding: EdgeInsets.symmetric(vertical: 12),

            prefixIconConstraints: BoxConstraints(minWidth: 32, minHeight: 32),
            suffixIconConstraints: BoxConstraints(minWidth: 32, minHeight: 32),

            prefixIcon: prefixIcon,
            suffixIcon: value.text.isNotEmpty
                ? GestureDetector(
                    onTap: () => controller.clear(),
                    child: Icon(Icons.clear, size: 14),
                  )
                : null,
            hintStyle: TextStyle(
              color: AppColors.onSurfaceVariant,
              fontSize: 14,
            ),

            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.onSurfaceVariant,
                width: .5,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.onSurfaceVariant,
                width: .5,
              ),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
            ),
          ),
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        );
      },
    );
  }
}
