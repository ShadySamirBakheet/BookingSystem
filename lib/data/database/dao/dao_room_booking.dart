part of '../database/database.dart';

class RoomBookedDao extends AppDatabase {
  Future<List<RoomBooked>?>? findAllroomBookeds() async {
    List<Map<String, dynamic>> maps =
        await AppDatabase._db!.query(AppDatabase.nameRoomBooked);
    List<RoomBooked> items = [];
    if (maps.isNotEmpty) {
      for (var item in maps) {
        items.add(RoomBooked.fromMap(item));
      }

      return items;
    }
    return null;
  }

  Future<RoomBooked?> findroomBooked(int id) async {
    List<Map<String, dynamic>> maps = await AppDatabase._db!
        .query(AppDatabase.nameRoomBooked, where: 'id = ?', whereArgs: [id]);
    List<RoomBooked> items = [];
    if (maps.isNotEmpty) {
      for (var item in maps) {
        items.add(RoomBooked.fromMap(item));
      }
      return items.first;
    }
    return null;
  }

  ///SELECT DISTINCT checkIn,roomId, id,checkout FROM RoomBooked

  Future<List<RoomBooked>?> findroomBookedAll() async {
    List<Map<String, dynamic>> maps = await AppDatabase._db!.rawQuery(
        'SELECT DISTINCT checkIn,roomId, peopleNum,id,checkout FROM RoomBooked');
    List<RoomBooked> items = [];
    if (maps.isNotEmpty) {
      for (var item in maps) {
        items.add(RoomBooked.fromMap(item));
      }
      return items;
    }
    return null;
  }

  Future<List<Room>?> findRooms(DateTime dateTime) async {
    List<Map<String, dynamic>> maps = await AppDatabase._db!.rawQuery(
        'SELECT Room.*,branchName FROM Room,RoomBooked,Branch WHERE Room.id == RoomBooked.roomId and Room.branchID == Branch.id and ("${dateTime.microsecondsSinceEpoch}" BETWEEN checkIn AND checkOut)');
    List<Room> items = [];
    print('object   ddd ' + dateTime.microsecondsSinceEpoch.toString());
    if (maps.isNotEmpty) {
      for (var item in maps) {
        items.add(Room.fromMap(item));
      }
      return items;
    }
    return null;
  }

  Future<RoomBooked?> insert(RoomBooked roomBooked) async {
    roomBooked.id = await AppDatabase._db!
        .insert(AppDatabase.nameRoomBooked, roomBooked.toMap());
    return roomBooked;
  }

  Future<int> delete(int id) async {
    return await AppDatabase._db!
        .delete(AppDatabase.nameRoomBooked, where: 'id = ?', whereArgs: [id]);
  }

  Future<RoomBooked?> update(RoomBooked roomBooked) async {
    int updated = await AppDatabase._db!.update(
        AppDatabase.nameRoomBooked, roomBooked.toMap(),
        where: 'id = ?', whereArgs: [roomBooked.id]);
    return (updated == 1) ? roomBooked : null;
  }
}
