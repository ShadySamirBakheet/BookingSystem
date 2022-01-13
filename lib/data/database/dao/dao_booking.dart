part of '../database/database.dart';

class BookingDao extends AppDatabase {
  Future<List<Booking>?>? findAllBookings() async {
    List<Map<String, dynamic>> maps =
        await AppDatabase._db!.query(AppDatabase.nameBooking);
    List<Booking> items = [];
    if (maps.isNotEmpty) {
      for (var item in maps) {
        items.add(Booking.fromMap(item));
      }

      return items;
    }
    return null;
  }

  Future<Booking?> findBooking(int uid) async {
    List<Map<String, dynamic>> maps = await AppDatabase._db!
        .query(AppDatabase.nameBooking, where: 'uid = ?', whereArgs: [uid]);
    List<Booking> items = [];
    if (maps.isNotEmpty) {
      for (var item in maps) {
        items.add(Booking.fromMap(item));
      }
      return items.first;
    }
    return null;
  }

  Future<Booking?> findBookingLogin(String email) async {
    List<Map<String, dynamic>> maps = await AppDatabase._db!
        .query(AppDatabase.nameBooking, where: 'email = ?', whereArgs: [email]);
    List<Booking> items = [];
    if (maps.isNotEmpty) {
      for (var item in maps) {
        items.add(Booking.fromMap(item));
      }
      return items.first;
    }
    return null;
  }

  Future<Booking?> insert(Booking booking) async {
    booking.uid =
        await AppDatabase._db!.insert(AppDatabase.nameBooking, booking.toMap());
    return booking;
  }

  Future<int> delete(int uid) async {
    return await AppDatabase._db!
        .delete(AppDatabase.nameBooking, where: 'uid = ?', whereArgs: [uid]);
  }

  Future<Booking?> update(Booking booking) async {
    int updated = await AppDatabase._db!.update(
        AppDatabase.nameBooking, booking.toMap(),
        where: 'uid = ?', whereArgs: [booking.uid]);
    return (updated == 1) ? booking : null;
  }
}
