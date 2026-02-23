import 'package:flutter/material.dart';
import 'package:sneakcommerce/pages/home_page.dart';

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
        backgroundColor: Color(0xFFC9BCAF),
        fixedSize: Size(160, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        elevation: 0,
      ),
      child: Row(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Get started",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF435150),
            ),
          ),

          Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              color: Color(0xFF435150),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Image.asset(
                "assets/icons/arrow.png",
                width: 16,
                height: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
