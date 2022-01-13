import 'package:booking_system/data/database/database/database.dart';
import 'package:booking_system/data/models/booking/booking.dart';
import 'package:booking_system/data/models/booking/room_booked.dart';
import 'package:booking_system/data/models/hotel/branch.dart';
import 'package:booking_system/data/models/hotel/room.dart';
import 'package:booking_system/data/models/users/user.dart';

class DatabaseRepository {
  final AppDatabase _database = AppDatabase();

  static UserDao? userDao;
  static BranchDao? branchDao;
  static RoomDao? roomDao;
  static RoomBookedDao? roomBookedDao;
  static BookingDao? bookingDao;

  initDb() async {
    await _database.database;
    userDao = _database.userDao;
    branchDao = _database.branchDao;
    roomDao = _database.roomDao;
    roomBookedDao = _database.roomBookedDao;
    bookingDao = _database.bookingDao;
  }

  Future<User?>? userLogin(String email) async =>
      await userDao!.findUserLogin(email);

  Future<User?>? getUser(int uid) async => await userDao!.findUser(uid);

  Future<User?>? userSignUp(User user) async => await userDao!.insert(user);
  Future<User?>? userUpdate(User user) async => await userDao!.update(user);

  Future<Booking?>? insertBooking(Booking booking) async =>
      await bookingDao!.insert(booking);

  Future<RoomBooked?>? insertRoomBooked(RoomBooked booking) async =>
      await roomBookedDao!.insert(booking);

  Future<List<Branch>?>? findAllbranchs() async =>
      await branchDao!.findAllbranchs();

  Future<List<Room>?>? findAllRoomsBranch(int id) async =>
      await roomDao!.findAllRoomsBranch(id);

  Future<List<Room>?>? findAllRooms(DateTime dateTime) async =>
      await roomDao!.findAllrooms(dateTime);

  Future<List<Room>?>? findRooms(DateTime dateTime) async =>
      await roomBookedDao!.findRooms(dateTime);

  Future<List<RoomBooked>?>? findroomBookedAll() async =>
      await roomBookedDao!.findroomBookedAll();

  Future<List<Booking>?>? findBookingAll() async =>
      await bookingDao!.findAllBookings();
}
