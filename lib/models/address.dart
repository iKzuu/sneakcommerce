import 'package:hive/hive.dart';

part 'address.g.dart';

@HiveType(typeId: 0)
class Address extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String phone;

  @HiveField(3)
  final String province;

  @HiveField(4)
  final String city;

  @HiveField(5)
  final String district;

  @HiveField(6)
  final String postalCode;

  @HiveField(7)
  final String street;

  @HiveField(8)
  final String detail;

  @HiveField(9)
  bool isSelected;

  Address({
    required this.id,
    required this.name,
    required this.phone,
    required this.province,
    required this.city,
    required this.district,
    required this.postalCode,
    required this.street,
    required this.detail,
    this.isSelected = false,
  });

  String get fullAddress =>
      "$street, $district, $city, $province, $postalCode";
}
