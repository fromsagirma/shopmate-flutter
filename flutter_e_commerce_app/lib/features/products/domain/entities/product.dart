class ProductRating {
  final num rate;
  final int count;

  const ProductRating({
    required this.rate,
    required this.count,
  });
}

class Product {
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final ProductRating? rating;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    this.rating,
  });
}
