import 'dart:convert';

class Branch {
  int? id;
  String branchName;
  String branchDesc;
  String branchAddress;
  int? status;
  Branch({
    this.id,
    required this.branchName,
    required this.branchDesc,
    required this.branchAddress,
    this.status,
  });

  Branch copyWith({
    int? id,
    String? branchName,
    String? branchDesc,
    String? branchAddress,
    int? status,
  }) {
    return Branch(
      id: id ?? this.id,
      branchName: branchName ?? this.branchName,
      branchDesc: branchDesc ?? this.branchDesc,
      branchAddress: branchAddress ?? this.branchAddress,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'branchName': branchName,
      'branchDesc': branchDesc,
      'branchAddress': branchAddress,
      'status': status,
    };
  }

  factory Branch.fromMap(Map<String, dynamic> map) {
    return Branch(
      id: map['id']?.toInt(),
      branchName: map['branchName'] ?? '',
      branchDesc: map['branchDesc'] ?? '',
      branchAddress: map['branchAddress'] ?? '',
      status: map['status']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Branch.fromJson(String source) => Branch.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Branch(id: $id, branchName: $branchName, branchDesc: $branchDesc, branchAddress: $branchAddress, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Branch &&
        other.id == id &&
        other.branchName == branchName &&
        other.branchDesc == branchDesc &&
        other.branchAddress == branchAddress &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        branchName.hashCode ^
        branchDesc.hashCode ^
        branchAddress.hashCode ^
        status.hashCode;
  }
}
