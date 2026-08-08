import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/product.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductRatingModel with _$ProductRatingModel {
  const factory ProductRatingModel({
    required num rate,
    required int count,
  }) = _ProductRatingModel;

  factory ProductRatingModel.fromJson(Map<String, dynamic> json) =>
      _$ProductRatingModelFromJson(json);
}

@freezed
class ProductModel with _$ProductModel {
  const ProductModel._();
  const factory ProductModel({
    required int id,
    required String title,
    required num price,
    required String description,
    required String category,
    required String image,
    ProductRatingModel? rating,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Product toEntity() {
    return Product(
      id: id,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
      rating: rating != null
          ? ProductRating(rate: rating!.rate, count: rating!.count)
          : null,
    );
  }
}
