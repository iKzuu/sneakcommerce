import 'package:flutter/material.dart';
import 'package:sneakcommerce/components/card_list/order_item_card_list.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 16, right: 16, bottom: 88, left: 16),
        child: OrderItemCardList(),
      ),
    );
  }
}
