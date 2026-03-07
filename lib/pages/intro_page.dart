import 'package:flutter/material.dart';
import 'package:sneakcommerce/components/get_started_btn.dart';
import 'package:sneakcommerce/theme/app_colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 26, top: 26),
            child: Text(
              "SneakCommerce.",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.onSurface,
              ),
            ),
          ),

          SizedBox(height: 52),

          Center(
            child: Image.asset("assets/images/intro_images.png", height: 260),
          ),

          SizedBox(height: 52),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Step into style.",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    color: AppColors.onSurface,
                    fontSize: 20,
                  ),
                ),

                Text(
                  "Your curated gateway to the world's most iconic sneakers.",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    color: AppColors.onSurfaceVariant,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 52),

          Padding(
            padding: const EdgeInsets.only(left: 26),
            child: GetStartedButton(),
          ),
        ],
      ),
    );
  }
}
