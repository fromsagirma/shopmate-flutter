// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) {
  return _UserProfileModel.fromJson(json);
}

/// @nodoc
mixin _$UserProfileModel {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  UserNameModel get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  UserAddressModel get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileModelCopyWith<UserProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileModelCopyWith<$Res> {
  factory $UserProfileModelCopyWith(
          UserProfileModel value, $Res Function(UserProfileModel) then) =
      _$UserProfileModelCopyWithImpl<$Res, UserProfileModel>;
  @useResult
  $Res call(
      {int id,
      String email,
      String username,
      UserNameModel name,
      String phone,
      UserAddressModel address});

  $UserNameModelCopyWith<$Res> get name;
  $UserAddressModelCopyWith<$Res> get address;
}

/// @nodoc
class _$UserProfileModelCopyWithImpl<$Res, $Val extends UserProfileModel>
    implements $UserProfileModelCopyWith<$Res> {
  _$UserProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? username = null,
    Object? name = null,
    Object? phone = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as UserNameModel,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as UserAddressModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserNameModelCopyWith<$Res> get name {
    return $UserNameModelCopyWith<$Res>(_value.name, (value) {
      return _then(_value.copyWith(name: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserAddressModelCopyWith<$Res> get address {
    return $UserAddressModelCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProfileModelImplCopyWith<$Res>
    implements $UserProfileModelCopyWith<$Res> {
  factory _$$UserProfileModelImplCopyWith(_$UserProfileModelImpl value,
          $Res Function(_$UserProfileModelImpl) then) =
      __$$UserProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String email,
      String username,
      UserNameModel name,
      String phone,
      UserAddressModel address});

  @override
  $UserNameModelCopyWith<$Res> get name;
  @override
  $UserAddressModelCopyWith<$Res> get address;
}

/// @nodoc
class __$$UserProfileModelImplCopyWithImpl<$Res>
    extends _$UserProfileModelCopyWithImpl<$Res, _$UserProfileModelImpl>
    implements _$$UserProfileModelImplCopyWith<$Res> {
  __$$UserProfileModelImplCopyWithImpl(_$UserProfileModelImpl _value,
      $Res Function(_$UserProfileModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? username = null,
    Object? name = null,
    Object? phone = null,
    Object? address = null,
  }) {
    return _then(_$UserProfileModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as UserNameModel,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as UserAddressModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileModelImpl extends _UserProfileModel {
  const _$UserProfileModelImpl(
      {required this.id,
      required this.email,
      required this.username,
      required this.name,
      required this.phone,
      required this.address})
      : super._();

  factory _$UserProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileModelImplFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  final String username;
  @override
  final UserNameModel name;
  @override
  final String phone;
  @override
  final UserAddressModel address;

  @override
  String toString() {
    return 'UserProfileModel(id: $id, email: $email, username: $username, name: $name, phone: $phone, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, email, username, name, phone, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileModelImplCopyWith<_$UserProfileModelImpl> get copyWith =>
      __$$UserProfileModelImplCopyWithImpl<_$UserProfileModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileModelImplToJson(
      this,
    );
  }
}

abstract class _UserProfileModel extends UserProfileModel {
  const factory _UserProfileModel(
      {required final int id,
      required final String email,
      required final String username,
      required final UserNameModel name,
      required final String phone,
      required final UserAddressModel address}) = _$UserProfileModelImpl;
  const _UserProfileModel._() : super._();

  factory _UserProfileModel.fromJson(Map<String, dynamic> json) =
      _$UserProfileModelImpl.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  String get username;
  @override
  UserNameModel get name;
  @override
  String get phone;
  @override
  UserAddressModel get address;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileModelImplCopyWith<_$UserProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserNameModel _$UserNameModelFromJson(Map<String, dynamic> json) {
  return _UserNameModel.fromJson(json);
}

/// @nodoc
mixin _$UserNameModel {
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserNameModelCopyWith<UserNameModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserNameModelCopyWith<$Res> {
  factory $UserNameModelCopyWith(
          UserNameModel value, $Res Function(UserNameModel) then) =
      _$UserNameModelCopyWithImpl<$Res, UserNameModel>;
  @useResult
  $Res call({String firstname, String lastname});
}

/// @nodoc
class _$UserNameModelCopyWithImpl<$Res, $Val extends UserNameModel>
    implements $UserNameModelCopyWith<$Res> {
  _$UserNameModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstname = null,
    Object? lastname = null,
  }) {
    return _then(_value.copyWith(
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserNameModelImplCopyWith<$Res>
    implements $UserNameModelCopyWith<$Res> {
  factory _$$UserNameModelImplCopyWith(
          _$UserNameModelImpl value, $Res Function(_$UserNameModelImpl) then) =
      __$$UserNameModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String firstname, String lastname});
}

/// @nodoc
class __$$UserNameModelImplCopyWithImpl<$Res>
    extends _$UserNameModelCopyWithImpl<$Res, _$UserNameModelImpl>
    implements _$$UserNameModelImplCopyWith<$Res> {
  __$$UserNameModelImplCopyWithImpl(
      _$UserNameModelImpl _value, $Res Function(_$UserNameModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstname = null,
    Object? lastname = null,
  }) {
    return _then(_$UserNameModelImpl(
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserNameModelImpl extends _UserNameModel {
  const _$UserNameModelImpl({required this.firstname, required this.lastname})
      : super._();

  factory _$UserNameModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserNameModelImplFromJson(json);

  @override
  final String firstname;
  @override
  final String lastname;

  @override
  String toString() {
    return 'UserNameModel(firstname: $firstname, lastname: $lastname)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserNameModelImpl &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, firstname, lastname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserNameModelImplCopyWith<_$UserNameModelImpl> get copyWith =>
      __$$UserNameModelImplCopyWithImpl<_$UserNameModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserNameModelImplToJson(
      this,
    );
  }
}

abstract class _UserNameModel extends UserNameModel {
  const factory _UserNameModel(
      {required final String firstname,
      required final String lastname}) = _$UserNameModelImpl;
  const _UserNameModel._() : super._();

  factory _UserNameModel.fromJson(Map<String, dynamic> json) =
      _$UserNameModelImpl.fromJson;

  @override
  String get firstname;
  @override
  String get lastname;
  @override
  @JsonKey(ignore: true)
  _$$UserNameModelImplCopyWith<_$UserNameModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserAddressModel _$UserAddressModelFromJson(Map<String, dynamic> json) {
  return _UserAddressModel.fromJson(json);
}

/// @nodoc
mixin _$UserAddressModel {
  String get city => throw _privateConstructorUsedError;
  String get street => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;
  String get zipcode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAddressModelCopyWith<UserAddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAddressModelCopyWith<$Res> {
  factory $UserAddressModelCopyWith(
          UserAddressModel value, $Res Function(UserAddressModel) then) =
      _$UserAddressModelCopyWithImpl<$Res, UserAddressModel>;
  @useResult
  $Res call({String city, String street, int number, String zipcode});
}

/// @nodoc
class _$UserAddressModelCopyWithImpl<$Res, $Val extends UserAddressModel>
    implements $UserAddressModelCopyWith<$Res> {
  _$UserAddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? street = null,
    Object? number = null,
    Object? zipcode = null,
  }) {
    return _then(_value.copyWith(
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      zipcode: null == zipcode
          ? _value.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAddressModelImplCopyWith<$Res>
    implements $UserAddressModelCopyWith<$Res> {
  factory _$$UserAddressModelImplCopyWith(_$UserAddressModelImpl value,
          $Res Function(_$UserAddressModelImpl) then) =
      __$$UserAddressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String city, String street, int number, String zipcode});
}

/// @nodoc
class __$$UserAddressModelImplCopyWithImpl<$Res>
    extends _$UserAddressModelCopyWithImpl<$Res, _$UserAddressModelImpl>
    implements _$$UserAddressModelImplCopyWith<$Res> {
  __$$UserAddressModelImplCopyWithImpl(_$UserAddressModelImpl _value,
      $Res Function(_$UserAddressModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? street = null,
    Object? number = null,
    Object? zipcode = null,
  }) {
    return _then(_$UserAddressModelImpl(
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      zipcode: null == zipcode
          ? _value.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAddressModelImpl extends _UserAddressModel {
  const _$UserAddressModelImpl(
      {required this.city,
      required this.street,
      required this.number,
      required this.zipcode})
      : super._();

  factory _$UserAddressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAddressModelImplFromJson(json);

  @override
  final String city;
  @override
  final String street;
  @override
  final int number;
  @override
  final String zipcode;

  @override
  String toString() {
    return 'UserAddressModel(city: $city, street: $street, number: $number, zipcode: $zipcode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAddressModelImpl &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.zipcode, zipcode) || other.zipcode == zipcode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, city, street, number, zipcode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAddressModelImplCopyWith<_$UserAddressModelImpl> get copyWith =>
      __$$UserAddressModelImplCopyWithImpl<_$UserAddressModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAddressModelImplToJson(
      this,
    );
  }
}

abstract class _UserAddressModel extends UserAddressModel {
  const factory _UserAddressModel(
      {required final String city,
      required final String street,
      required final int number,
      required final String zipcode}) = _$UserAddressModelImpl;
  const _UserAddressModel._() : super._();

  factory _UserAddressModel.fromJson(Map<String, dynamic> json) =
      _$UserAddressModelImpl.fromJson;

  @override
  String get city;
  @override
  String get street;
  @override
  int get number;
  @override
  String get zipcode;
  @override
  @JsonKey(ignore: true)
  _$$UserAddressModelImplCopyWith<_$UserAddressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
