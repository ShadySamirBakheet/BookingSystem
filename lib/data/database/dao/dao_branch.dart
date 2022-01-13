part of '../database/database.dart';

class BranchDao extends AppDatabase {
  Future<List<Branch>?>? findAllbranchs() async {
    List<Map<String, dynamic>> maps = await AppDatabase._db!
        .query(AppDatabase.nameBranch, where: ' status = ? ', whereArgs: [1]);
    List<Branch> items = [];
    if (maps.isNotEmpty) {
      for (var item in maps) {
        items.add(Branch.fromMap(item));
      }

      return items;
    }
    return null;
  }

  Future<Branch?> findbranch(int id) async {
    List<Map<String, dynamic>> maps = await AppDatabase._db!.query(
        AppDatabase.nameBranch,
        where: 'id = ? and status = ? ',
        whereArgs: [id, 1]);
    List<Branch> items = [];
    if (maps.isNotEmpty) {
      for (var item in maps) {
        items.add(Branch.fromMap(item));
      }
      return items.first;
    }
    return null;
  }

  Future<Branch?> insert(Branch branch) async {
    branch.id =
        await AppDatabase._db!.insert(AppDatabase.nameBranch, branch.toMap());
    return branch;
  }

  Future<int> delete(int id) async {
    return await AppDatabase._db!
        .delete(AppDatabase.nameBranch, where: 'id = ?', whereArgs: [id]);
  }

  Future<Branch?> update(Branch branch) async {
    int updated = await AppDatabase._db!.update(
        AppDatabase.nameBranch, branch.toMap(),
        where: 'id = ?', whereArgs: [branch.id]);
    return (updated == 1) ? branch : null;
  }
}
