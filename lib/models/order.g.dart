// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderAdapter extends TypeAdapter<Order> {
  @override
  final int typeId = 3;

  @override
  Order read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Order(
      orderId: fields[0] as String,
      items: (fields[1] as List).cast<OrderItem>(),
      address: fields[2] as String,
      paymentMethod: fields[3] as String,
      shippingMethod: fields[4] as String,
      subtotal: fields[5] as int,
      shippingCost: fields[6] as int,
      totalPrice: fields[7] as num,
      createdAt: fields[8] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Order obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.orderId)
      ..writeByte(1)
      ..write(obj.items)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.paymentMethod)
      ..writeByte(4)
      ..write(obj.shippingMethod)
      ..writeByte(5)
      ..write(obj.subtotal)
      ..writeByte(6)
      ..write(obj.shippingCost)
      ..writeByte(7)
      ..write(obj.totalPrice)
      ..writeByte(8)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
