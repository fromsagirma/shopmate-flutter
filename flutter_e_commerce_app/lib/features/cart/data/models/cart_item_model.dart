import 'package:hive/hive.dart';
import '../../domain/entities/cart_item.dart';

part 'cart_item_model.g.dart';

@HiveType(typeId: 1)
class CartItemModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final num price;

  @HiveField(3)
  final String image;

  @HiveField(4)
  final int quantity;

  CartItemModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.quantity,
  });

  factory CartItemModel.fromEntity(CartItem entity) {
    return CartItemModel(
      id: entity.id,
      title: entity.title,
      price: entity.price,
      image: entity.image,
      quantity: entity.quantity,
    );
  }

  CartItem toEntity() {
    return CartItem(
      id: id,
      title: title,
      price: price,
      image: image,
      quantity: quantity,
    );
  }
}
