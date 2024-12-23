// ignore_for_file: file_names, non_constant_identifier_names, depend_on_referenced_packages,
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:amt_cgs_groupe/page/database/data/fare.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';


class FareDatabase {
  FareDatabase._();
  static final FareDatabase instance = FareDatabase._();
  // ignore: not_initialized_non_nullable_variable
  Database? _database;


  Future <Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async { 
    //sqfliteFfiInit();
    //databaseFactory = databaseFactoryFfi;


    WidgetsFlutterBinding.ensureInitialized();
    return await openDatabase(
      join(await getDatabasesPath(), 'fare_database.db'),
      onCreate: (db, version) {
        return db.execute(
        "CREATE TABLE fare("
        "ID_fare INTEGER PRIMARY KEY,"
        "title TEXT,"
        "Date TEXT," 
        "Hour TEXT," 
        "ID_client INTEGER," 
        "Category TEXT," 
        "ID_depart INTEGER," 
        "ID_arrive INTEGER," 
        "payement TEXT," 
        "option TEXT)"
        );
      },
      version: 1,
      );
  }

  void insertFare(Fare fare) async {
    final Database db = await database;

    if (fare.title.isEmpty) {
      fare.title = '${fare.Date} - ${fare.Hour} - ${fare.ID_depart} -> ${fare.ID_arrive}';
    }

    await db.insert('fare',fare.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
      );
  }

  void updateFare(Fare fare) async {
    final Database db = await database;

    if (fare.title.isEmpty) {
      fare.title = '${fare.Date} - ${fare.Hour} - ${fare.ID_depart} -> ${fare.ID_arrive}';
    }

    await db.update("fare", fare.toMap(),
    where: "ID_fare = ?", whereArgs: [fare.ID_fare]);
  }

  void deleteFare(Fare fare) async {
    final Database db = await database;
    await db.delete("fare", where: "ID_fare = ?", whereArgs: [fare.ID_fare]);
  }

  Future <List<Fare>> fare() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('fare');
    List<Fare> fareList = List.generate(maps.length, (i) {
      return Fare.fromMap(maps[i]);
    });

    if (fareList.isEmpty) {
      for (Fare fare in defaultFares) {
        insertFare(fare);
      }
      fareList = defaultFares;
    }
    return fareList;
  }
  final List<Fare> defaultFares = [
    Fare(1,"01/11/24 - 14:00\nTour Bollore -> CDG","01/11/24","14:00",1,"Profesionel",20,4,"En Compte","Van"),
    Fare(2,"02/11/24 - 18:00\nCDG -> Tour Bollore","02/11/24","18:00",1,"Profesionel",4,20,"En compte","Van"),
    Fare(3,"15/11/24 - 15:38\nGare de Lyon -> Gare du Nord",'15/11/24','15:38',1,"Particulier",1,5,"Paye","Van",)];
}