import 'package:flutter/material.dart';
import 'package:sneakcommerce/pages/home_page.dart';
import 'package:sneakcommerce/theme/app_colors.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        (route) => false,
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(10),
        backgroundColor: AppColors.onBackground,
        fixedSize: Size(160, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        elevation: 0,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Get started",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.surface,
              ),
            ),

            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 24,
                  color: AppColors.onSurface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
