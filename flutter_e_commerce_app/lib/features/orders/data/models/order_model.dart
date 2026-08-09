import 'package:hive/hive.dart';
import '../../domain/entities/order.dart';

part 'order_model.g.dart';

@HiveType(typeId: 2) // Assuming 0 is Session, 1 is CartItem
class OrderModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final int productId;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final String image;

  @HiveField(4)
  final double price;

  @HiveField(5)
  final int quantity;

  @HiveField(6)
  final DateTime checkoutDate;

  OrderModel({
    required this.id,
    required this.productId,
    required this.title,
    required this.image,
    required this.price,
    required this.quantity,
    required this.checkoutDate,
  });

  factory OrderModel.fromEntity(Order entity) {
    return OrderModel(
      id: entity.id,
      productId: entity.productId,
      title: entity.title,
      image: entity.image,
      price: entity.price,
      quantity: entity.quantity,
      checkoutDate: entity.checkoutDate,
    );
  }

  Order toEntity() {
    return Order(
      id: id,
      productId: productId,
      title: title,
      image: image,
      price: price,
      quantity: quantity,
      checkoutDate: checkoutDate,
    );
  }
}
