// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileModelImpl _$$UserProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileModelImpl(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      username: json['username'] as String,
      name: UserNameModel.fromJson(json['name'] as Map<String, dynamic>),
      phone: json['phone'] as String,
      address:
          UserAddressModel.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserProfileModelImplToJson(
        _$UserProfileModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
    };

_$UserNameModelImpl _$$UserNameModelImplFromJson(Map<String, dynamic> json) =>
    _$UserNameModelImpl(
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
    );

Map<String, dynamic> _$$UserNameModelImplToJson(_$UserNameModelImpl instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
    };

_$UserAddressModelImpl _$$UserAddressModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserAddressModelImpl(
      city: json['city'] as String,
      street: json['street'] as String,
      number: (json['number'] as num).toInt(),
      zipcode: json['zipcode'] as String,
    );

Map<String, dynamic> _$$UserAddressModelImplToJson(
        _$UserAddressModelImpl instance) =>
    <String, dynamic>{
      'city': instance.city,
      'street': instance.street,
      'number': instance.number,
      'zipcode': instance.zipcode,
    };
