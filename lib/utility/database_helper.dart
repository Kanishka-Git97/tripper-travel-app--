import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:travel_app_v1/models/customer.dart';

class DatabaseHelper {
  // Database Configuration
  static final _dbName = 'travel.db';
  static final _dbVersion = 1;

  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;
  Future<Database> get database async {
    // If Already Installed Database
    if (_database != null) return _database!;
    // Else Create Database
    _database = await _initiateDatabase();
    return _database!;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);

    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    // todo: Define Table Structures
    await db.execute('''
      CREATE TABLE ${Customer.tblCustomer}(
        ${Customer.colId} INTEGER PRIMARY KEY,
        ${Customer.colName} TEXT NOT NULL,
        ${Customer.colEmail} TEXT NOT NULL,
        ${Customer.colPassword} TEXT NOT NULL,
        ${Customer.colImage} TEXT
      )
    ''');
  }

  // Inserting Customer Details
  Future<bool> insertCustomer(Customer customer) async {
    Database db = await database;
    // Validate the Customer
    final List<Map<String, dynamic>> result =
        await db.query(Customer.tblCustomer);
    if (result.length > 0) {
      await db.update(Customer.tblCustomer, customer.toJson(),
          where: '${Customer.colId}=?', whereArgs: [customer.id]);
      return true;
    } else {
      await db.insert(Customer.tblCustomer, customer.toJson());
      return true;
    }
  }
}
