import 'dart:convert';

class Booking {
  int? id;
  int peopleNum;
  int uid;
  int price;
  DateTime checkIn;
  DateTime checkOut;
  Booking({
    this.id,
    required this.peopleNum,
    required this.uid,
    required this.price,
    required this.checkIn,
    required this.checkOut,
  });

  Booking copyWith({
    int? id,
    int? peopleNum,
    int? uid,
    int? price,
    DateTime? checkIn,
    DateTime? checkOut,
  }) {
    return Booking(
      id: id ?? this.id,
      peopleNum: peopleNum ?? this.peopleNum,
      uid: uid ?? this.uid,
      price: price ?? this.price,
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'peopleNum': peopleNum,
      'uid': uid,
      'price': price,
      'checkIn': checkIn.millisecondsSinceEpoch,
      'checkOut': checkOut.millisecondsSinceEpoch,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      id: map['id']?.toInt(),
      peopleNum: map['peopleNum']?.toInt(),
      uid: map['uid']?.toInt() ?? 0,
      price: map['price']?.toInt() ?? 0,
      checkIn: DateTime.fromMillisecondsSinceEpoch(map['checkIn']),
      checkOut: DateTime.fromMillisecondsSinceEpoch(map['checkOut']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Booking.fromJson(String source) =>
      Booking.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Booking(id: $id, peopleNum: $peopleNum, uid: $uid, price: $price, checkIn: $checkIn, checkOut: $checkOut)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Booking &&
        other.id == id &&
        other.peopleNum == peopleNum &&
        other.uid == uid &&
        other.price == price &&
        other.checkIn == checkIn &&
        other.checkOut == checkOut;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        peopleNum.hashCode ^
        uid.hashCode ^
        price.hashCode ^
        checkIn.hashCode ^
        checkOut.hashCode;
  }
}
