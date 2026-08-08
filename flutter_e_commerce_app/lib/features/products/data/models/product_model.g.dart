// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductRatingModelImpl _$$ProductRatingModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductRatingModelImpl(
      rate: json['rate'] as num,
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$$ProductRatingModelImplToJson(
        _$ProductRatingModelImpl instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'count': instance.count,
    };

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      price: json['price'] as num,
      description: json['description'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      rating: json['rating'] == null
          ? null
          : ProductRatingModel.fromJson(json['rating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
      'rating': instance.rating,
    };
