import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_pro/db/model/user.dart';

class DbHelper {
  static final DbHelper dbHelper = new DbHelper();
//  DbHelper.openDb() {
//    openDb();
//  }

  Future<Database> openDb() async {
    return openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'flutter_chat.db'),
      // When the database is first created, create a table to store dogs
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT, password TEXT)",
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  static DbHelper getInstace() {
    return dbHelper;
  }

  Future<void> insertUser(String userName,String pwd) async {
    final Database db = await openDb();
    Map<String, dynamic> map = Map<String, dynamic>();
    map["username"] = userName;
    map["password"] = pwd;
    await db.insert(
      'users',
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<User> queryUser(String userName) async {
    // Get a reference to the database
    final Database db = await openDb();
    List<dynamic> arguments = List();
    arguments.add(userName);
    // Query the table for All The Dogs.
    final List<Map<String, dynamic>> users = await db.rawQuery("select * from users where username= ?",arguments);
    return List.generate(users.length, (i) {
      return User(
        users[i]['username'],
        users[i]['password'],
      );
    }).first;
  }
}
