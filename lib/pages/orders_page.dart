import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/controller/order_controller.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderController>(
      builder: (context, controller, _) {
        final orders = controller.orders;

        return ListView.builder(
          itemCount: orders.length,
          itemBuilder: (_, index) {
            final order = orders[index];

            return Text(order.orderId);
          },
        );
      },
    );
  }
}
