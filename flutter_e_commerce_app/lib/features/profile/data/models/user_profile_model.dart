import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_profile.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

@freezed
class UserProfileModel with _$UserProfileModel {
  const UserProfileModel._();

  const factory UserProfileModel({
    required int id,
    required String email,
    required String username,
    required UserNameModel name,
    required String phone,
    required UserAddressModel address,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  UserProfile toEntity() {
    return UserProfile(
      id: id,
      email: email,
      username: username,
      name: name.toEntity(),
      phone: phone,
      address: address.toEntity(),
    );
  }
}

@freezed
class UserNameModel with _$UserNameModel {
  const UserNameModel._();

  const factory UserNameModel({
    required String firstname,
    required String lastname,
  }) = _UserNameModel;

  factory UserNameModel.fromJson(Map<String, dynamic> json) =>
      _$UserNameModelFromJson(json);

  UserName toEntity() {
    return UserName(
      firstname: firstname,
      lastname: lastname,
    );
  }
}

@freezed
class UserAddressModel with _$UserAddressModel {
  const UserAddressModel._();

  const factory UserAddressModel({
    required String city,
    required String street,
    required int number,
    required String zipcode,
  }) = _UserAddressModel;

  factory UserAddressModel.fromJson(Map<String, dynamic> json) =>
      _$UserAddressModelFromJson(json);

  UserAddress toEntity() {
    return UserAddress(
      city: city,
      street: street,
      number: number,
      zipcode: zipcode,
    );
  }
}
