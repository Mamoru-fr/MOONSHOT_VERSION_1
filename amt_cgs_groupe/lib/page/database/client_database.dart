// ignore_for_file: file_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:amt_cgs_groupe/page/database/data/client.dart';

class ClientDatabase {
  ClientDatabase._();
  static final ClientDatabase instance = ClientDatabase._();
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
      join(await getDatabasesPath(), 'client_database.db'),
      onCreate: (db, version) {
        return db.execute(
        "CREATE TABLE client(ID INT PRIMARY KEY, name TEXT, surname TEXT, Tel INTEGER, e_mail TEXT, Production TEXT)"
        );
      },
      version: 1,
      );
  }

  void insertClient(Client client) async {
    final Database db = await database;

    await db.insert('client',client.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
      );
  }

  void updateClient(Client client) async {
    final Database db = await database;
    await db.update("client", client.toMap(),
    where: "ID = ?", whereArgs: [client.ID_client]);
  }

  void deleteClient(Client client) async {
    final Database db = await database;
    await db.delete("client", where: "ID = ?", whereArgs: [client.ID_client]);
  }

  Future <List<Client>> client() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('client');
    List<Client> client = List.generate(maps.length, (i) {
      return Client.fromMap(maps[i]);
    });

    if (client.isEmpty) {
      for (Client client in defaultClient) {
        insertClient(client);
      }
      client = defaultClient;
    }
    return client;
  }
  final List<Client> defaultClient = [Client(1, "SANTOS", "Alexis", "Gest@ctiv", 0680039122, "contact.gestactiv@gmail.com")];
}