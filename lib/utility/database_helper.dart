import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:travel_app_v1/constant/constant.dart';
import 'package:travel_app_v1/models/booking.dart';
import 'package:travel_app_v1/models/customer.dart';
import 'package:travel_app_v1/models/location.dart';
import 'package:travel_app_v1/models/schedule.dart';
import 'package:travel_app_v1/models/trip.dart';
import 'package:http/http.dart' as http;

import '../models/review.dart';
import '../models/wishList.dart';
import '../provider/user_provider.dart';

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

    await db.execute('''
      CREATE TABLE ${Review.tblName}(
        ${Review.colId} INTEGER PRIMARY KEY,
        ${Review.colCusRef} INTEGER NOT NULL,
        ${Review.colTripRef} INTEGER NOT NULL,
        ${Review.colRate} INTEGER NOT NULL,
        ${Review.colReview} TEXT NOT NULL
        )
    ''');

    await db.execute('''
      CREATE TABLE ${Booking.tblName}(
        ${Booking.colId} INTEGER PRIMARY KEY,
        ${Booking.colCus} INTEGER NOT NULL,
        ${Booking.colTrip} INTEGER NOT NULL,
        ${Booking.colDate} TEXT NOT NULL,
        ${Booking.colPaymentStat} TEXT NOT NULL,
        ${Booking.colBookingStat} TEXT NOT NULL,
        ${Booking.colPerson} INTEGER NOT NULL,
        ${Booking.colPerPerson} TEXT NOT NULL
        )
    ''');
    
     await db.execute('''
      CREATE TABLE ${WishList.tblName}(
         ${WishList.colId} INTEGER PRIMARY KEY,
        ${WishList.colCustomerRef} INTEGER NOT NULL,
        ${WishList.colTripRef} INTEGER NOT NULL
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
    var response = await http.get(Uri.parse('$baseUrl/trips.php'));
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

    var locationResponse = await http.get(Uri.parse("$baseUrl/locations.php"));
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

    var scheduleResponse = await http.get(Uri.parse("$baseUrl/schedules.php"));
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

    /*----update review data-------*/
    var reviewResponse = await http.get(Uri.parse("$baseUrl/reviews.php"));
    List<dynamic> reviewData = json.decode(reviewResponse.body);

    await db.transaction((txn) async {
      for (var item in reviewData) {
        // Check if the item already exists
        var existing = await txn.query(Review.tblName,
            where: '${Review.colId}=?', whereArgs: [item['id']]);
        if (existing.length > 0) {
          // Update the item in the database
          await txn.update(Review.tblName, item,
              where: '${Review.colId}=?', whereArgs: [item['id']]);
        } else {
          // Insert the item into the database
          await txn.insert(Review.tblName, item);
        }
      }
    });

    print("Data Synced");


    /*----update wishlist local database-------*/
    var wishlistResponse = await http.get(Uri.parse("$baseUrl/wishlist.php"));
    List<dynamic> wishlistData = json.decode(wishlistResponse.body);

    await db.transaction((txn) async {
      for (var item in wishlistData) {
        // Check if the item already exists
        var existing = await txn.query(WishList.tblName,
            where: '${WishList.colId}=?', whereArgs: [item['id']]);
        if (existing.length > 0) {
          // Update the item in the database
          await txn.update(WishList.tblName, item,
              where: '${WishList.colId}=?', whereArgs: [item['id']]);
        } else {
          // Insert the item into the database
          await txn.insert(WishList.tblName, item);
        }
      }
    });

  }

  /*----------fetch all data-----*/
  //Future<List<Map<String, dynamic>>>
  Future<List<Trip>> queryAll() async {
    Database? db = await instance.database;
    List<Map> results = await db.query('trip');

    List<Trip> data = [];
    for (var i = 0; i < results.length; i++) {
      var tempTripId = results[i]['id'];
      /*----Add trip data to Trip model----------*/
      data.add(Trip(
          id: int.parse(results[i]['id'].toString()),
          title: results[i]['title'],
          category: results[i]['category'],
          image: results[i]['image'],
          description: results[i]['description'],
          price: double.parse(results[i]['price']),
          locations: [],
          schedule: [],
          review: []));
      /**---fetch data from location table--------- */
      var resultLocation =
          await db.rawQuery('SELECT * FROM location WHERE trip=$tempTripId');
      for (var j = 0; j < resultLocation.length; j++) {
        data[i].locations!.add(Location(
            id: int.parse(resultLocation[j]['id'].toString()),
            image: resultLocation[j]['image'].toString(),
            title: resultLocation[j]['title'].toString(),
            longitude: double.parse(resultLocation[j]['longitude'].toString()),
            latitude: double.parse(resultLocation[j]['latitude'].toString()),
            trip: int.parse(resultLocation[j]['trip'].toString())));
      }

      /**----fetch data from schedule table--------- */
      var resultSchedule =
          await db.rawQuery('SELECT * FROM schedule WHERE trip=$tempTripId');
      for (var k = 0; k < resultSchedule.length; k++) {
        data[i].schedule!.add(Schedule(
            id: int.parse(resultSchedule[k]['id'].toString()),
            trip: int.parse(resultSchedule[k]['trip'].toString()),
            start: resultSchedule[k]['start'].toString(),
            end: resultSchedule[k]['end'].toString()));
      }

      /**----fetch trip reviews--------- */
      var resultReviews =
          await db.rawQuery('SELECT * FROM reviews WHERE trip_ref=$tempTripId');
      for (var l = 0; l < resultReviews.length; l++) {
        data[i].review!.add(Review(
            id: int.parse(resultReviews[l]['id'].toString()),
            cusRef: int.parse(resultReviews[l]['cus_ref'].toString()),
            tripRef: int.parse(resultReviews[l]['trip_ref'].toString()),
            rate: int.parse(resultReviews[l]['rate'].toString()),
            review: resultReviews[l]['review'].toString()));
      }
    }

    return data;
  }


  Future<void> authSync(Customer customer) async {
    Database db = await database;
    // Define Data
    var data = {"c_id": customer.id};
    // Booking History Sync
    var bookingResponse = await http.post(Uri.parse("$baseUrl/bookings.php"),
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));

    List<dynamic> bookingData = json.decode(bookingResponse.body);

    await db.transaction((txn) async {
      for (var item in bookingData) {
        // Check if the item already exists
        var existing = await txn.query(Booking.tblName,
            where: '${Booking.colId}=?', whereArgs: [item['id']]);
        if (existing.length > 0) {
          // Update the item in the database
          await txn.update(Booking.tblName, item,
              where: '${Booking.colId}=?', whereArgs: [item['id']]);
        } else {
          // Insert the item into the database
          await txn.insert(Booking.tblName, item);
        }
      }
    });
  }

  Future<Trip> getTrip(int id) async {
    Database? db = await instance.database;
    List<Map> results = await db.rawQuery('SELECT * FROM trip WHERE id=$id');

    List<Trip> data = [];
    for (var i = 0; i < results.length; i++) {
      var tempTripId = results[i]['id'];
      /*----Add trip data to Trip model----------*/
      data.add(Trip(
          id: int.parse(results[i]['id'].toString()),
          title: results[i]['title'],
          category: results[i]['category'],
          image: results[i]['image'],
          description: results[i]['description'],
          price: double.parse(results[i]['price']),
          locations: [],
          schedule: [],
          review: []));
      /**---fetch data from location table--------- */
      var resultLocation =
          await db.rawQuery('SELECT * FROM location WHERE trip=$tempTripId');
      for (var j = 0; j < resultLocation.length; j++) {
        data[i].locations!.add(Location(
            id: int.parse(resultLocation[j]['id'].toString()),
            image: resultLocation[j]['image'].toString(),
            title: resultLocation[j]['title'].toString(),
            longitude: double.parse(resultLocation[j]['longitude'].toString()),
            latitude: double.parse(resultLocation[j]['latitude'].toString()),
            trip: int.parse(resultLocation[j]['trip'].toString())));
      }

      /**----fetch data from schedule table--------- */
      var resultSchedule =
          await db.rawQuery('SELECT * FROM schedule WHERE trip=$tempTripId');
      for (var k = 0; k < resultSchedule.length; k++) {
        data[i].schedule!.add(Schedule(
            id: int.parse(resultSchedule[k]['id'].toString()),
            trip: int.parse(resultSchedule[k]['trip'].toString()),
            start: resultSchedule[k]['start'].toString(),
            end: resultSchedule[k]['end'].toString()));
      }

      /**----fetch trip reviews--------- */
      var resultReviews =
          await db.rawQuery('SELECT * FROM reviews WHERE trip_ref=$tempTripId');
      for (var l = 0; l < resultReviews.length; l++) {
        data[i].review!.add(Review(
            id: int.parse(resultReviews[l]['id'].toString()),
            cusRef: int.parse(resultReviews[l]['cus_ref'].toString()),
            tripRef: int.parse(resultReviews[l]['trip_ref'].toString()),
            rate: int.parse(resultReviews[l]['rate'].toString()),
            review: resultReviews[l]['review'].toString()));
      }
    }

    return data[0];
  }

  Future<List<Booking>> getBookings() async {
    Database db = await database;
    List<Map> response = await db.query(Booking.tblName);
    List<Booking> data = [];
    var i = 0;
    for (var item in response) {
      data.add(new Booking(
          id: int.parse(item['id'].toString()),
          customerRef: Customer(),
          tripRef: await getTrip(item["trip"]),
          date: item['date'],
          paymentStatus: item['payment_status'],
          bookingStatus: item['booking_status'],
          persons: int.parse(item['person'].toString()),
          perPerson: double.parse(item['per_person'].toString())));
    }
    return data;

  /*-----fetch all data from wishlist-----*/
  Future<List<Map<String, Object?>>> fetchAllWishList(int customerId) async {
    Database? db = await instance.database;
    String sql = '''
                  SELECT * FROM trip 
                  LEFT JOIN wishlist ON trip.id=wishlist.trip_ref
                ''';
    final result = await db.rawQuery(sql);

    // List<Map> results = await db.query('wishlist');
    // List<WishList> data = [];
    // for (var i = 0; i < results.length; i++) {
    //   data.add(WishList(
    //       id: int.parse(results[i]["id"].toString()),
    //       customer_ref: int.parse(results[i]["customer_ref"].toString()),
    //       trip_ref: int.parse(results[i]["trip_ref"].toString())));
    // }
    return result;

  }
}
