import 'dart:convert';

class User {
  int? uid;
  String? name;
  String? uImage;
  String? phone;
  String email;
  String? address;
  String password;
  int isAdmin;
  int country;
  User({
    this.uid,
    required this.name,
    this.uImage,
    required this.phone,
    required this.email,
    this.address,
    required this.password,
    this.isAdmin = 0,
    this.country = 0,
  });

  User copyWith({
    String? name,
    String? uImage,
    String? phone,
    String? email,
    String? address,
    String? password,
    int? isAdmin,
    int? country,
  }) {
    return User(
      uid: uid,
      name: name ?? this.name,
      uImage: uImage ?? this.uImage,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      password: password ?? this.password,
      isAdmin: isAdmin ?? this.isAdmin,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'uImage': uImage,
      'phone': phone,
      'email': email,
      'address': address,
      'password': password,
      'isAdmin': isAdmin,
      'country': country,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid']?.toInt(),
      name: map['name'] ?? '',
      uImage: map['uImage'],
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      address: map['address'],
      password: map['password'] ?? '',
      isAdmin: map['isAdmin']?.toInt() ?? 0,
      country: map['country']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(uid: $uid, name: $name, uImage: $uImage, phone: $phone, email: $email, address: $address, password: $password, isAdmin: $isAdmin, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.uid == uid &&
        other.name == name &&
        other.uImage == uImage &&
        other.phone == phone &&
        other.email == email &&
        other.address == address &&
        other.password == password &&
        other.isAdmin == isAdmin &&
        other.country == country;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        uImage.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        address.hashCode ^
        password.hashCode ^
        isAdmin.hashCode ^
        country.hashCode;
  }

  bool get getIsAdmin => isAdmin == 1;
}
