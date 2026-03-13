import 'package:gema/controller/db/db.dart';
import 'package:gema/controller/db/table_heads.dart';

class Queries {
  final tableHeads = TableHeads();
  /// 0owner info queries
  Future<int> insertOwnerInfo(Map<String, dynamic> data) async {
    final db = await DatabaseService().database;
    return await db.insert(tableHeads.ownerInfoTableName, data);
  }

  Future<List<Map<String, dynamic>>> getOwnerInfo() async {
    final db = await DatabaseService().database;
    return await db.query(tableHeads.ownerInfoTableName);
  }

  Future<int> updateOwnerInfo(int id, Map<String, dynamic> data) async {
    final db = await DatabaseService().database;
    return await db.update(tableHeads.ownerInfoTableName, data,
        where: '${tableHeads.id} = ?', whereArgs: [id]);
  }

  Future<int> deleteOwnerInfo(int id) async {
    final db = await DatabaseService().database;
    return await db.delete(tableHeads.ownerInfoTableName,
        where: '${tableHeads.id} = ?', whereArgs: [id]);
  }
}