import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'models/user_details_model.dart';

// ignore: prefer_typing_uninitialized_variables
var opendatabase;
Future<void> database() async {
  WidgetsFlutterBinding.ensureInitialized();
  String dbPath = await getDatabasesPath();

  opendatabase = openDatabase(
    join(dbPath, 'jagbhandh_service_app.db'),
    onCreate: (db, version) async {
      await db.execute(
        '''CREATE TABLE IF NOT EXISTS userDetails(id INTEGER , firstName TEXT,lastName TEXT, mobile VARCHAR(12),gender VARCHAR(10),dob VARCHAR(30),email VARCHAR(50),state VARCHAR(20),district VARCHAR(20),country VARCHAR(40),address VARCHAR(100),status VARCHAR(10))''',
      );
    },
    version: 1,
  );
  userdata = await user();
  return opendatabase;
}

Future insertUser(UserProfileData user) async {
  final db = await opendatabase;
  //try {
  await db.insert(
    'userDetails',
    user.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );

  debugPrint('inserted  is $user');
}

Future<List<UserProfileData>> user() async {
  final db = await opendatabase;

  final List<Map<String, dynamic>> maps = await db.query('userDetails');

  List<UserProfileData> userslist = List.generate(maps.length, (i) {
    return UserProfileData(
      id: (maps[i]['id'].toString()),
      firstName: maps[i]['firstName'].toString(),
      lastname: maps[i]['lastName'].toString(),
      phonenumber: maps[i]['mobile'].toString(),
      email: maps[i]['email'].toString(),
      dob: maps[i]['dob'].toString(),
      state: maps[i]['state'].toString(),
      city: maps[i]['city'].toString(),
      address: maps[i]['address'].toString(),
      country: maps[i]['country'].toString(),
      gender: maps[i]['gender'].toString(),
    );
  });

  userdata = userslist;
  return userslist;
}

Future<void> deleteUserDetails() async {
  final db = await opendatabase;
  await db.delete('userDetails');
  debugPrint('users list is deleted');
}

Future updateUser(UserProfileData editUser) async {
  final db = await opendatabase;

  await db.update(
    'userDetails',
    editUser.toMap(),
    // Ensure that the Dog has a matching id.
    where: 'id = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [editUser.id],
  );
  debugPrint(editUser.toString());
}
