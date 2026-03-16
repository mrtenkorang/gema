import 'package:flutter/material.dart';
import 'package:gema/controller/db/table_heads.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  final tableHeads = TableHeads();
  // Singleton instance of DatabaseService
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  static Database? _database;

  DatabaseService._internal();

  // Getter for database instance
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'property_rate.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Create necessary tables in the database

  Future<void> _onCreate(Database db, int version) async {
    // await db.execute('''
    //   CREATE TABLE ${DbNames.societyLimitCheckTable} (
    //   id INTEGER PRIMARY KEY AUTOINCREMENT,
    //   society_code TEXT,
    //   society_limit REAL,
    //
    // '''
    // );
    await db.execute('''
  CREATE TABLE ${tableHeads.ownerInfoTableName} (
  ${tableHeads.id} INTEGER PRIMARY KEY AUTOINCREMENT,
  ${tableHeads.title} TEXT,
  ${tableHeads.agentID} TEXT,
  ${tableHeads.polygonID} TEXT,
  ${tableHeads.location} TEXT,
  ${tableHeads.propertyType} TEXT,
  ${tableHeads.propertyState} TEXT,
  ${tableHeads.rooms} INTEGER,
  ${tableHeads.occupier} TEXT,
  ${tableHeads.propertyDetails} TEXT,
  ${tableHeads.communicationMethod} TEXT,
  ${tableHeads.paymentMethod} TEXT,
  ${tableHeads.ownerName} TEXT,
  ${tableHeads.contactNumber} TEXT,
  ${tableHeads.ghanaCardNumber} TEXT,
  ${tableHeads.email} TEXT,
  ${tableHeads.gpsLocation} TEXT,
  ${tableHeads.streetName} TEXT,
  ${tableHeads.status} INTEGER
)
''');


    await db.execute('''
  CREATE TABLE ${tableHeads.pocInfoTableName} (
  ${tableHeads.id} INTEGER PRIMARY KEY AUTOINCREMENT,
  ${tableHeads.title} TEXT,
  ${tableHeads.agentID} TEXT,
  ${tableHeads.polygonID} TEXT,
  ${tableHeads.location} TEXT,
  ${tableHeads.propertyType} TEXT,
  ${tableHeads.propertyState} TEXT,
  ${tableHeads.rooms} INTEGER,
  ${tableHeads.relationship} TEXT,
  ${tableHeads.propertyDetails} TEXT,
  ${tableHeads.communicationMethod} TEXT,
  ${tableHeads.paymentMethod} TEXT,
  ${tableHeads.ownerName} TEXT,
  ${tableHeads.contactNumber} TEXT,
  ${tableHeads.ghanaCardNumber} TEXT,
  ${tableHeads.email} TEXT,
  ${tableHeads.gpsLocation} TEXT,
  ${tableHeads.streetName} TEXT,
  ${tableHeads.status} INTEGER
)
''');


    await db.execute('''
  CREATE TABLE ${tableHeads.passPropertyTableName} (
  ${tableHeads.id} INTEGER PRIMARY KEY AUTOINCREMENT,
  ${tableHeads.reason} TEXT,
  ${tableHeads.notes} TEXT,
  ${tableHeads.agentID} TEXT,
  ${tableHeads.polygonID} TEXT,
  ${tableHeads.status} INTEGER
)
''');
  }
}