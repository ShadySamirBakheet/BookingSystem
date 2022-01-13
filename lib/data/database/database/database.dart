import 'package:booking_system/data/database/database/run_queries.dart';
import 'package:booking_system/data/models/booking/booking.dart';
import 'package:booking_system/data/models/booking/room_booked.dart';
import 'package:booking_system/data/models/hotel/branch.dart';
import 'package:booking_system/data/models/hotel/room.dart';
import 'package:booking_system/data/models/users/user.dart';
import 'package:sqflite/sqflite.dart';

part '../dao/dao_user.dart';
part '../dao/dao_branch.dart';
part '../dao/dao_room.dart';
part '../dao/dao_room_booking.dart';
part '../dao/dao_booking.dart';

class AppDatabase {
  static Database? _db;
  String? _path;

  static String nameUser = 'User';
  static String nameBranch = 'Branch';
  static String nameRoom = 'Room';
  static String nameBooking = 'Booking';
  static String nameRoomBooked = 'RoomBooked';

  UserDao get userDao => UserDao();
  BranchDao get branchDao => BranchDao();
  RoomDao get roomDao => RoomDao();
  RoomBookedDao get roomBookedDao => RoomBookedDao();
  BookingDao get bookingDao => BookingDao();

  Future get database async {
    if (_db == null) {
      open(await path);
    }
  }

  Future<String> get path async {
    var databasesPath = await getDatabasesPath();
    _path = join(databasesPath, 'demo.db');
    return _path ?? '';
  }

  Future<Database> open(String path) async {
    _db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      RunQueries().runQueries(db);
    });

    return _db!;
  }

  Future close() async => _db!.close();

  String join(String databasesPath, String databasesName) {
    return '$databasesPath/$databasesName';
  }
}
