class CartItem {
  final int id;
  final String title;
  final num price;
  final String image;
  final int quantity;

  const CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.quantity,
  });

  CartItem copyWith({
    int? id,
    String? title,
    num? price,
    String? image,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
    );
  }
}
