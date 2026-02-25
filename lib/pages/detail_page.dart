import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/controller/controller.dart';

class DetailPage extends StatelessWidget {
  final int shoeId;
  const DetailPage({super.key, required this.shoeId});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<Controller>();

    final shoe = controller.shoeShopList.firstWhere(
      (shoe) => shoe.id == shoeId,
    );

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF435150),
        title: Text(
          shoe.name,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.network(shoe.imagePath, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}
