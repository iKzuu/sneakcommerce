class Shoe {
  final int id;
  final String name;
  final int price;
  final String imagePath;
  final String brand;
  bool isFavorite;

  Shoe({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.brand,
    this.isFavorite = false,
  });

  double get priceAsDouble => price.toDouble();
}
