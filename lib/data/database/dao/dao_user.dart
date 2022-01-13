part of '../database/database.dart';

class UserDao extends AppDatabase {
  Future<List<User>?>? findAllusers() async {
    List<Map<String, dynamic>> maps =
        await AppDatabase._db!.query(AppDatabase.nameUser);
    List<User> items = [];
    if (maps.isNotEmpty) {
      for (var item in maps) {
        items.add(User.fromMap(item));
      }

      return items;
    }
    return null;
  }

  Future<User?> findUser(int uid) async {
    List<Map<String, dynamic>> maps = await AppDatabase._db!
        .query(AppDatabase.nameUser, where: 'uid = ?', whereArgs: [uid]);
    List<User> items = [];
    if (maps.isNotEmpty) {
      for (var item in maps) {
        items.add(User.fromMap(item));
      }
      return items.first;
    }
    return null;
  }

  Future<User?> findUserLogin(String email) async {
    List<Map<String, dynamic>> maps = await AppDatabase._db!
        .query(AppDatabase.nameUser, where: 'email = ?', whereArgs: [email]);
    List<User> items = [];
    if (maps.isNotEmpty) {
      for (var item in maps) {
        items.add(User.fromMap(item));
      }
      return items.first;
    }
    return null;
  }

  Future<User?> insert(User user) async {
    user.uid =
        await AppDatabase._db!.insert(AppDatabase.nameUser, user.toMap());
    return user;
  }

  Future<int> delete(int uid) async {
    return await AppDatabase._db!
        .delete(AppDatabase.nameUser, where: 'uid = ?', whereArgs: [uid]);
  }

  Future<User?> update(User user) async {
    int updated = await AppDatabase._db!.update(
        AppDatabase.nameUser, user.toMap(),
        where: 'uid = ?', whereArgs: [user.uid]);
    return (updated == 1) ? user : null;
  }
}
