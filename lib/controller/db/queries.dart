import 'package:gema/controller/db/db.dart';
import 'package:gema/controller/db/table_heads.dart';
import 'package:gema/controller/models/register_owner_model.dart';

class Queries {
  final tableHeads = TableHeads();
  /// 0owner info queries
  Future<int> insertOwnerInfo(Map<String, dynamic> data) async {
    final db = await DatabaseService().database;
    return await db.insert(tableHeads.ownerInfoTableName, data);
  }

  Future<List<RegisterOwnerModel>> getOwnerInfo() async {
    final db = await DatabaseService().database;
    final List<Map<String, dynamic>> data = await db.query(tableHeads.ownerInfoTableName);
    return data.map<RegisterOwnerModel>((e) => RegisterOwnerModel.fromJson(e)).toList();
  }


  Future<List<RegisterOwnerModel>> getOwnerInfoByPolygonId(String polygonId) async {
    final db = await DatabaseService().database;
    final List<Map<String, dynamic>> data = await db.query(
      tableHeads.ownerInfoTableName,
      where: '${tableHeads.polygonID} = ?',
      whereArgs: [polygonId],
    );
    return data.map<RegisterOwnerModel>((e) => RegisterOwnerModel.fromJson(e)).toList();
  }

  Future<int> updateOwnerInfo(RegisterOwnerModel ownerInfo) async {
    final db = await DatabaseService().database;
    return await db.update(tableHeads.ownerInfoTableName, ownerInfo.toJson(),
        where: '${tableHeads.id} = ?', whereArgs: [ownerInfo.id]);
  }

  Future<int> deleteOwnerInfo(int id) async {
    final db = await DatabaseService().database;
    return await db.delete(tableHeads.ownerInfoTableName,
        where: '${tableHeads.id} = ?', whereArgs: [id]);
  }
}