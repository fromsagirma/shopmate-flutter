class UserProfile {
  final int id;
  final String email;
  final String username;
  final UserName name;
  final String phone;
  final UserAddress address;

  UserProfile({
    required this.id,
    required this.email,
    required this.username,
    required this.name,
    required this.phone,
    required this.address,
  });
}

class UserName {
  final String firstname;
  final String lastname;

  UserName({
    required this.firstname,
    required this.lastname,
  });
}

class UserAddress {
  final String city;
  final String street;
  final int number;
  final String zipcode;

  UserAddress({
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });
}
