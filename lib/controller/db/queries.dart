import 'package:gema/controller/db/db.dart';
import 'package:gema/controller/db/table_heads.dart';
import 'package:gema/controller/models/no_contact_model.dart';
import 'package:gema/controller/models/pass_property_model.dart';
import 'package:gema/controller/models/register_owner_model.dart';
import 'package:gema/controller/models/register_poc_model.dart';

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

  /// POC (Point of Contact) queries
  Future<int> insertPocInfo(Map<String, dynamic> data) async {
    final db = await DatabaseService().database;
    return await db.insert(tableHeads.pocInfoTableName, data);
  }

  Future<List<RegisterPocModel>> getPocInfo() async {
    final db = await DatabaseService().database;
    final List<Map<String, dynamic>> data = await db.query(tableHeads.pocInfoTableName);
    return data.map<RegisterPocModel>((e) => RegisterPocModel.fromJson(e)).toList();
  }

  Future<List<RegisterPocModel>> getPocInfoByPolygonId(String polygonId) async {
    final db = await DatabaseService().database;
    final List<Map<String, dynamic>> data = await db.query(
      tableHeads.pocInfoTableName,
      where: '${tableHeads.polygonID} = ?',
      whereArgs: [polygonId],
    );
    return data.map<RegisterPocModel>((e) => RegisterPocModel.fromJson(e)).toList();
  }

  Future<int> updatePocInfo(RegisterPocModel ownerInfo) async {
    final db = await DatabaseService().database;
    return await db.update(tableHeads.pocInfoTableName, ownerInfo.toJson(),
        where: '${tableHeads.id} = ?', whereArgs: [ownerInfo.id]);
  }

  Future<int> deletePocInfo(int id) async {
    final db = await DatabaseService().database;
    return await db.delete(tableHeads.pocInfoTableName,
        where: '${tableHeads.id} = ?', whereArgs: [id]);
  }


  /// Pass property queries
  Future<int> insertPassPropertyInfo(Map<String, dynamic> data) async {
    final db = await DatabaseService().database;
    return await db.insert(tableHeads.passPropertyTableName, data);
  }

  Future<List<PassPropertyModel>> getPassPropertyInfo() async {
    final db = await DatabaseService().database;
    final List<Map<String, dynamic>> data = await db.query(tableHeads.passPropertyTableName);
    return data.map<PassPropertyModel>((e) => PassPropertyModel.fromJson(e)).toList();
  }

  Future<List<PassPropertyModel>> getPassPropertyInfoByPolygonId(String polygonId) async {
    final db = await DatabaseService().database;
    final List<Map<String, dynamic>> data = await db.query(
      tableHeads.passPropertyTableName,
      where: '${tableHeads.polygonID} = ?',
      whereArgs: [polygonId],
    );
    return data.map<PassPropertyModel>((e) => PassPropertyModel.fromJson(e)).toList();
  }

  Future<int> updatePassPropertyInfo(PassPropertyModel ownerInfo) async {
    final db = await DatabaseService().database;
    return await db.update(tableHeads.passPropertyTableName, ownerInfo.toJson(),
        where: '${tableHeads.id} = ?', whereArgs: [ownerInfo.id]);
  }

  Future<int> deletePassPropertyInfo(int id) async {
    final db = await DatabaseService().database;
    return await db.delete(tableHeads.passPropertyTableName,
        where: '${tableHeads.id} = ?', whereArgs: [id]);
  }


  /// No contact queries

  Future<int> insertNoContactInfo(Map<String, dynamic> data) async {
    final db = await DatabaseService().database;
    return await db.insert(tableHeads.noContactTableName, data);
  }

  Future<List<NoContactModel>> getNoContactInfoByPolygonId(String polygonId) async {
    final db = await DatabaseService().database;
    final List<Map<String, dynamic>> data = await db.query(
      tableHeads.noContactTableName,
      where: '${tableHeads.polygonID} = ?',
      whereArgs: [polygonId],
    );
    return data.map<NoContactModel>((e) => NoContactModel.fromJson(e)).toList();
  }
}