import 'package:sneakcommerce/models/shipping.dart';

List<ShippingMethod> shippingMethods = [
  ShippingMethod(
    id: "jne_reg",
    name: "JNE Regular",
    cost: 10000,
    estimatedDelivery: "2-3 days",
  ),
  ShippingMethod(
    id: "jne_yes",
    name: "JNE YES",
    cost: 20000,
    estimatedDelivery: "1 day",
  ),
  ShippingMethod(
    id: "sicepat",
    name: "SiCepat",
    cost: 15000,
    estimatedDelivery: "1-2 days",
  ),
];
