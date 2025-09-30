import 'dart:math' as math;

import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12),
      child: Center(
        child: Stack(
          children: [
            Container(
              width: 360,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[Color(0xFFAC9A8C), Color(0xFF435150)],
                  tileMode: TileMode.mirror,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "New Styles On Sale",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
        
                    Text(
                      "Up To",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF435150),
                      ),
                    ),
        
                    Text(
                      "40 %",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF435150),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        
            Positioned(
              top: -40,
              left: 20,
              right: -100,
              child: Transform.rotate(
                angle: -math.pi / 10.0,
                child: Image.asset(
                  "assets/images/air_max1.png",
                  width: 260,
                  height: 260,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
