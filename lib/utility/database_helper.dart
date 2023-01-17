import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:travel_app_v1/models/customer.dart';
import 'package:travel_app_v1/models/location.dart';
import 'package:travel_app_v1/models/schedule.dart';
import 'package:travel_app_v1/models/trip.dart';
import 'package:http/http.dart' as http;

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
      CREATE TABLE ${Customer.tblName}(
        ${Customer.colId} INTEGER PRIMARY KEY,
        ${Customer.colName} TEXT NOT NULL,
        ${Customer.colEmail} TEXT NOT NULL,
        ${Customer.colPassword} TEXT NOT NULL,
        ${Customer.colImage} TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE ${Trip.tblName}(
        ${Trip.colId} INTEGER PRIMARY KEY,
        ${Trip.colTitle} TEXT NOT NULL,
        ${Trip.colCategory} TEXT NOT NULL,
        ${Trip.colImage} TEXT NOT NULL,
        ${Trip.colDescription} TEXT,
        ${Trip.colPrice} TEXT
        )
    ''');

    await db.execute('''
      CREATE TABLE ${Location.tblName}(
        ${Location.colId} INTEGER PRIMARY KEY,
        ${Location.colImage} TEXT NOT NULL,
        ${Location.colTitle} TEXT NOT NULL,
        ${Location.colTrip} INTEGER NOT NULL,
        ${Location.colLongitude} TEXT,
        ${Location.colLatitude} TEXT
        )
    ''');

    await db.execute('''
      CREATE TABLE ${Schedule.tblName}(
        ${Schedule.colId} INTEGER PRIMARY KEY,
        ${Schedule.colTrip} INTEGER NOT NULL,
        ${Schedule.colStart} TEXT NOT NULL,
        ${Schedule.colEnd} TEXT NOT NULL
        )
    ''');
  }

  // Inserting Customer Details
  Future<bool> insertCustomer(Customer customer) async {
    Database db = await database;
    // Validate the Customer
    final List<Map<String, dynamic>> result = await db.query(Customer.tblName);
    if (result.length > 0) {
      await db.update(Customer.tblName, customer.toJson(),
          where: '${Customer.colId}=?', whereArgs: [customer.id]);
      return true;
    } else {
      await db.insert(Customer.tblName, customer.toJson());
      return true;
    }
  }

  // Validating the Customer
  Future<List<Map<String, dynamic>>> validateCustomer() async {
    Database db = await database;
    return await db.query(Customer.tblName);
  }

  // Asynchronous from server to client
  Future<void> syncData() async {
    var response = await http
        .get(Uri.parse('http://192.168.8.101/travelApp_API/trips.php'));
    List<dynamic> tripData = json.decode(response.body);
    print(tripData.length);

    // Synch with Local Database
    Database db = await database;
    await db.transaction((txn) async {
      for (var item in tripData) {
        // Check if the item already exists
        var existing = await txn.query(Trip.tblName,
            where: '${Trip.colId}=?', whereArgs: [item['id']]);
        if (existing.length > 0) {
          // Update the item in the database
          await txn.update(Trip.tblName, item,
              where: '${Trip.colId}=?', whereArgs: [item['id']]);
        } else {
          // Insert the item into the database
          await txn.insert(Trip.tblName, item);
        }
      }
    });

    var locationResponse = await http
        .get(Uri.parse("http://192.168.8.101/travelApp_API/locations.php"));
    List<dynamic> locationData = json.decode(locationResponse.body);

    await db.transaction((txn) async {
      for (var item in locationData) {
        // Check if the item already exists
        var existing = await txn.query(Location.tblName,
            where: '${Location.colId}=?', whereArgs: [item['id']]);
        if (existing.length > 0) {
          // Update the item in the database
          await txn.update(Location.tblName, item,
              where: '${Location.colId}=?', whereArgs: [item['id']]);
        } else {
          // Insert the item into the database
          await txn.insert(Location.tblName, item);
        }
      }
    });

    var scheduleResponse = await http
        .get(Uri.parse("http://192.168.8.101/travelApp_API/schedules.php"));
    List<dynamic> scheduleData = json.decode(scheduleResponse.body);

    await db.transaction((txn) async {
      for (var item in scheduleData) {
        // Check if the item already exists
        var existing = await txn.query(Schedule.tblName,
            where: '${Schedule.colId}=?', whereArgs: [item['id']]);
        if (existing.length > 0) {
          // Update the item in the database
          await txn.update(Schedule.tblName, item,
              where: '${Schedule.colId}=?', whereArgs: [item['id']]);
        } else {
          // Insert the item into the database
          await txn.insert(Schedule.tblName, item);
        }
      }
    });
  }
}
