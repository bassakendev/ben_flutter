// ignore_for_file: file_names

import 'dart:async';

import '/dataBase/Tache.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseAction {
  Database? database;

  Future<void> creatDataBase() async {
    // Avoid errors caused by flutter upgrade.
    // Importing 'package:flutter/widgets.dart' is required.
    WidgetsFlutterBinding.ensureInitialized();
    // Open the database and store the reference.
    database = await openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'task_database.db'),
      // When the database is first created, create a table to store tasks.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE taches(id INTEGER PRIMARY KEY AUTOINCREMENT, titre TEXT, description TEXT, createdAt TEXT)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  // Define a function that inserts tasks into the database
  Future<void> insertTache(Tache tache) async {
    // Get a reference to the database.
    final db = database;

    // Insert the Task into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same task is inserted twice.
    //
    // In this case, replace any previous data.
    await db!.insert(
      'taches',
      tache.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the tasks from the tasks table.
  Future<List<Tache>> allTaches() async {
    // Get a reference to the database.
    final db = database;

    // Query the table for all The tasks.
    final List<Map<String, dynamic>> maps = await db!.query('taches');

    // Convert the List<Map<String, dynamic> into a List<task>.
    return List.generate(maps.length, (i) {
      return Tache(
          maps[i]['titre'], maps[i]['description'], maps[i]['createdAt']);
    });
  }

  Future<void> updateTache(int id, String titre, String description) async {
    // Get a reference to the database.
    final db = database;
    
    // Create a map of the updated values.
    final updatedValues = {
      'titre': titre,
      'description': description,
    };
    // Update the given task.
    await db!.update(
      'taches',
      updatedValues,
      // Ensure that the task has a matching id.
      where: 'id = ?',
      // Pass the task's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future<void> deleteTache(int id) async {
    // Get a reference to the database.
    final db = database;

    // Remove the task from the database.
    await db!.delete(
      'taches',
      // Use a `where` clause to delete a specific task.
      where: 'id = ?',
      // Pass the task's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}
