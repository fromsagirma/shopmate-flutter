import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String id;
  final int productId;
  final String title;
  final String image;
  final double price;
  final int quantity;
  final DateTime checkoutDate;

  const Order({
    required this.id,
    required this.productId,
    required this.title,
    required this.image,
    required this.price,
    required this.quantity,
    required this.checkoutDate,
  });

  @override
  List<Object?> get props => [id, productId, title, image, price, quantity, checkoutDate];
}
