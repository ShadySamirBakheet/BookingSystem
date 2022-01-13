import 'dart:convert';

class RoomBooked {
  int? id;
  DateTime checkIn;
  DateTime checkOut;
  int bookingId;
  int roomId;
  RoomBooked({
    this.id,
    required this.checkIn,
    required this.checkOut,
    required this.bookingId,
    required this.roomId,
  });

  RoomBooked copyWith({
    int? id,
    DateTime? checkIn,
    DateTime? checkOut,
    int? bookingId,
    int? roomId,
  }) {
    return RoomBooked(
      id: id ?? this.id,
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
      bookingId: bookingId ?? this.bookingId,
      roomId: roomId ?? this.roomId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'checkIn': checkIn.millisecondsSinceEpoch,
      'checkOut': checkOut.millisecondsSinceEpoch,
      'bookingId': bookingId,
      'roomId': roomId,
    };
  }

  factory RoomBooked.fromMap(Map<String, dynamic> map) {
    return RoomBooked(
      id: map['id']?.toInt(),
      checkIn: DateTime.fromMillisecondsSinceEpoch(map['checkIn']),
      checkOut: DateTime.fromMillisecondsSinceEpoch(map['checkOut']),
      bookingId: map['bookingId']?.toInt() ?? 0,
      roomId: map['roomId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RoomBooked.fromJson(String source) =>
      RoomBooked.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RoomBooked(id: $id, checkIn: $checkIn, checkOut: $checkOut, bookingId: $bookingId, roomId: $roomId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RoomBooked &&
        other.id == id &&
        other.checkIn == checkIn &&
        other.checkOut == checkOut &&
        other.bookingId == bookingId &&
        other.roomId == roomId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        checkIn.hashCode ^
        checkOut.hashCode ^
        bookingId.hashCode ^
        roomId.hashCode;
  }
}
