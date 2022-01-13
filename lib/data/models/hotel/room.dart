import 'dart:convert';

class Room {
  int? id;
  String roomNub;
  String roomName;
  int? status;
  int? smoke;
  int roomType;
  int maxCapcity;
  int branchID;
  int priceRoom;

  String? branchName;

  bool choosed = false;
  Room({
    this.id,
    required this.roomNub,
    required this.roomName,
    this.status,
    this.smoke,
    required this.roomType,
    required this.maxCapcity,
    required this.branchID,
    required this.priceRoom,
    this.branchName,
  });

  Room copyWith({
    int? id,
    String? roomNub,
    String? roomName,
    int? status,
    int? smoke,
    int? roomType,
    int? maxCapcity,
    int? branchID,
    int? priceRoom,
  }) {
    return Room(
      id: id ?? this.id,
      roomNub: roomNub ?? this.roomNub,
      roomName: roomName ?? this.roomName,
      status: status ?? this.status,
      smoke: smoke ?? this.smoke,
      roomType: roomType ?? this.roomType,
      maxCapcity: maxCapcity ?? this.maxCapcity,
      branchID: branchID ?? this.branchID,
      priceRoom: priceRoom ?? this.priceRoom,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'roomNub': roomNub,
      'roomName': roomName,
      'status': status,
      'smoke': smoke,
      'roomType': roomType,
      'maxCapcity': maxCapcity,
      'branchID': branchID,
      'priceRoom': priceRoom,
    };
  }

  factory Room.fromMap(Map<String, dynamic> map) {
    return Room(
      id: map['id']?.toInt(),
      roomNub: map['roomNub'] ?? '',
      roomName: map['roomName'] ?? '',
      status: map['status']?.toInt(),
      smoke: map['smoke']?.toInt(),
      roomType: map['roomType']?.toInt() ?? 0,
      maxCapcity: map['maxCapcity']?.toInt() ?? 0,
      branchID: map['branchID']?.toInt() ?? 0,
      priceRoom: map['priceRoom']?.toInt() ?? 0,
      branchName: map['branchName']?.toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Room.fromJson(String source) => Room.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Room(id: $id, roomNub: $roomNub, roomName: $roomName, status: $status, smoke: $smoke, roomType: $roomType, maxCapcity: $maxCapcity, branchID: $branchID, priceRoom: $priceRoom)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Room &&
        other.id == id &&
        other.roomNub == roomNub &&
        other.roomName == roomName &&
        other.status == status &&
        other.smoke == smoke &&
        other.roomType == roomType &&
        other.maxCapcity == maxCapcity &&
        other.branchID == branchID &&
        other.priceRoom == priceRoom;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        roomNub.hashCode ^
        roomName.hashCode ^
        status.hashCode ^
        smoke.hashCode ^
        roomType.hashCode ^
        maxCapcity.hashCode ^
        branchID.hashCode ^
        priceRoom.hashCode;
  }
}
