part of '../database/database.dart';

class RoomDao extends AppDatabase {
  Future<List<Room>?>? findAllrooms(DateTime dateTime) async {
    List<Map<String, dynamic>> maps = await AppDatabase._db!.rawQuery(
        'SELECT Room.*,branchName  FROM Room,Branch WHERE  Room.branchID == Branch.id  and Room.id not in (SELECT Room.id FROM Room,RoomBooked WHERE Room.id == RoomBooked.roomId  and  ("${dateTime.microsecondsSinceEpoch}" BETWEEN checkIn AND checkOut))');
    List<Room> items = [];
    if (maps.isNotEmpty) {
      for (var item in maps) {
        items.add(Room.fromMap(item));
      }

      return items;
    }
    return null;
  }

  Future<List<Room>?>? findAllRoomsBranch(int bid) async {
    List<Map<String, dynamic>> maps = await AppDatabase._db!
        .query(AppDatabase.nameRoom, where: ' branchID = ?', whereArgs: [bid]);
    List<Room> items = [];
    if (maps.isNotEmpty) {
      for (var item in maps) {
        items.add(Room.fromMap(item));
      }

      return items;
    }
    return null;
  }

  Future<Room?> findroom(int id) async {
    List<Map<String, dynamic>> maps = await AppDatabase._db!
        .query(AppDatabase.nameRoom, where: 'id = ?', whereArgs: [id]);
    List<Room> items = [];
    if (maps.isNotEmpty) {
      for (var item in maps) {
        items.add(Room.fromMap(item));
      }
      return items.first;
    }
    return null;
  }

  Future<Room?> insert(Room room) async {
    room.id = await AppDatabase._db!.insert(AppDatabase.nameRoom, room.toMap());
    return room;
  }

  Future<int> delete(int id) async {
    return await AppDatabase._db!
        .delete(AppDatabase.nameRoom, where: 'id = ?', whereArgs: [id]);
  }

  Future<Room?> update(Room room) async {
    int updated = await AppDatabase._db!.update(
        AppDatabase.nameRoom, room.toMap(),
        where: 'id = ?', whereArgs: [room.id]);
    return (updated == 1) ? room : null;
  }
}
