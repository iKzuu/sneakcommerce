import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/banner.dart';
import 'package:sneakcommerce/components/shoe_tile.dart';
import 'package:sneakcommerce/components/category.dart';
import 'package:sneakcommerce/models/cart.dart';
import 'package:sneakcommerce/models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF435150),
        title: Text(
          "Added to 1 item to cart",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        content: Text(
          "Check your cart",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<Cart>(
        builder: (context, value, child) => Column(
        children: [
          BannerSlider(),
      
          SizedBox(height: 20,),
      
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Category(index: 0, name: "All",),
                Category(index: 1, name: "Nike",),
                Category(index: 2, name: "Adidas",),
                Category(index: 3, name: "NB",),
              ],
            ),
          ),
      
          SizedBox(height: 20),
      
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Featured",
                style: TextStyle(
                  color: Color(0xFF242424),
                  fontWeight: FontWeight.w600,
                  fontSize: 16
                ),
              ),
            ),
          ),
      
          Container(
            height: 280,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Shoe shoe = value.getShoeList()[index];
                return ShoeTile(
                  shoe: shoe,
                  onTap: () => addShoeToCart(shoe),
                );
              },
            ),
          ),
        ],
      ),
      )
    );
  }
}
