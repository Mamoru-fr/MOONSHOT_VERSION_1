// ignore_for_file: file_names, non_constant_identifier_names
import 'package:amt_cgs_groupe/Page/Database/Data/Chauffeur.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class ChauffeurDatabase {
  ChauffeurDatabase._();
  static final ChauffeurDatabase instance = ChauffeurDatabase._();
  // ignore: not_initialized_non_nullable_variable
  static Database _database;

  Future <Database> get database async {
    // ignore: unnecessary_null_comparison
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    return await openDatabase(
      join(await getDatabasesPath(), 'chauffeur_database.db'),
      onCreate: (db, version) {
        return db.execute(
        "CREATE TABLE chauffeur(ID INTEGER PRIMARY KEY, nickname TEXT, name TEXT, surname TEXT, Tel INTEGER, e_mail TEXT, vehicul_type TEXT, plaque TEXT)"
        );
      },
      version: 1,
      );
  }

  void insertChauffeur(Chauffeur chauffeur) async {
    final Database db = await database;

    await db.insert('chauffeur', chauffeur.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
      );
  }

  void updateChauffeur(Chauffeur chauffeur) async {
    final Database db = await database;
    await db.update("chauffeur", chauffeur.toMap(),
    where: "ID = ?", whereArgs: [chauffeur.ID_chauffeur]);
  }

  void deleteChauffeur(Chauffeur chauffeur) async {
    final Database db = await database;
    // ignore: extra_positional_arguments
    await db.delete('chauffeur', chauffeur.toMap(),
    where: 'ID = ?', whereArgs: [chauffeur.ID_chauffeur]);
  }

  Future <List<Chauffeur>> chauffeur() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Chauffeur');
    List<Chauffeur> chauffeur = List.generate(maps.length, (i) {
      return Chauffeur.fromMap(maps[i]);
    });

    if (chauffeur.isEmpty) {
      for (Chauffeur chauffeur in defaultChauffeur) {
        insertChauffeur(chauffeur);
      }
      chauffeur = defaultChauffeur;
    }
    return chauffeur;
  }
  final List<Chauffeur> defaultChauffeur = [Chauffeur(1, "Georges", "SANTOS", "Carlos", 0607476122, "cgs.taxi@orange.fr", "Breack", "AP-848-GD")];
}