// ignore_for_file: prefer_conditional_assignment, depend_on_referenced_packages

import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import '../models/exercise.dart';
import 'package:flutter/services.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper; // Singleton DatabaseHelper
  static Database? _database; // Singleton Database

  String tableExercises = 'exercises';

  String colRef = 'ref';
  String colTitle = 'title';
  String colImg = 'img';

  String colRepeat = 'repeat';
  String colCategorie = 'categorie';
  String colSets = 'sets';

  String colDuree = 'duree';
  String colDescription = 'description';
  String colPause = 'pause';

  String colFavorite = 'favorite';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper =
          DatabaseHelper._createInstance(); //Ceci est exécuté une seule fois, c'est la notion singleton object
    }
    return _databaseHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    //Obtenir le chemin où Android et iOS stockent les bases de données.
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'dbExercises');

    //Créer et ouvrir la base de données
    var dbExercises = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbExercises;
  }

  void _createDb(Database db, int laVersion) async {
    await db.execute('CREATE TABLE $tableExercises($colRef INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT,'
        '$colImg TEXT, $colRepeat TEXT, $colCategorie TEXT, $colSets TEXT, $colDuree TEXT, $colDescription TEXT, $colPause TEXT, $colFavorite INTEGER)');

    //LOAD JSON AND ADD TO DATABASE
    String data = await rootBundle.loadString("assets/db.json");
    var allExercice = jsonDecode(data);

    for (var unique in allExercice) {
      await db.execute("INSERT INTO exercises values (?,?,?,?,?,?,?,?,?,?)", unique);
    }
  }

  //Opérations de CRUD
  //Obtention de tous les exercises (map)
  Future<List<Map<String, dynamic>>> obtenirExercisesMapList() async {
    Database db = await database; //Appel à la méthode get database
    //var resultat =
    //await db.rawQuery('SELECT * FROM $tableExercises order by $colTitre ASC');
    var resultat = await db.query(tableExercises, orderBy: '$colTitle ASC');

    //print(resultat);
    return resultat;
  }

  Future<List<Map<String, dynamic>>> obtenirExercisesMapListParCategorie(categorie) async {
    Database db = await database; //Appel à la méthode get database
    //var resultat =
    //await db.rawQuery('SELECT * FROM $tableExercises WHERE  order by $colTitre ASC');
    var resultat =
        await db.query(tableExercises, orderBy: '$colTitle ASC', where: '$colCategorie = ?', whereArgs: [categorie]);
    //print(resultat);
    return resultat;
  }

  Future<List<Map<String, dynamic>>> obtenirExercisesMapListFavorite() async {
    Database db = await database; //Appel à la méthode get database
    //var resultat =
    //await db.rawQuery('SELECT * FROM $tableExercises order by $colTitre ASC');
    var resultat = await db.query(tableExercises, orderBy: '$colTitle ASC', where: '$colFavorite = ?', whereArgs: [1]);

    //print(resultat);
    return resultat;
  }

  //Insertion d'un exercise
  Future<int> ajouterExercise(Exercise unExercise) async {
    Database db = await database;
    var resultat = await db.insert(tableExercises, unExercise.deObjetVersMap());
    return resultat;
  }

  //Mise-à-jour d'un exercise
  Future<int> modifierExercise(Exercise unExercise) async {
    var db = await database;
    var resultat =
        await db.update(tableExercises, unExercise.deObjetVersMap(), where: '$colRef = ?', whereArgs: [unExercise.ref]);
    return resultat;
  }

  //Supprimer un exercise
  Future<int> enleverExercise(int id) async {
    var db = await database;
    int resultat = await db.rawDelete('DELETE FROM exercises WHERE $colRef = $id');
    return resultat;
  }

  //À partir de la liste de Map on va générer une liste d'objets Exercise
  Future<List<Exercise>?> obtenirExerciseList() async {
    List<Exercise>? listeObjetsExercise = <Exercise>[];
    var exerciseMapList = await obtenirExercisesMapList(); //Liste map de la base de données
    //Créer la liste d'objets Exercise à partir de exerciseMapList
    listeObjetsExercise =
        exerciseMapList.map((unMapExercise) => Exercise.deMapVersObjet(unMapExercise)).cast<Exercise>().toList();
    return listeObjetsExercise;
  }

  Future<List<Exercise>?> obtenirExerciseListParCategorie(categorie) async {
    List<Exercise>? listeObjetsExercise = <Exercise>[];
    var exerciseMapList = await obtenirExercisesMapListParCategorie(categorie); //Liste map de la base de données
    //Créer la liste d'objets Exercise à partir de exerciseMapList
    listeObjetsExercise =
        exerciseMapList.map((unMapExercise) => Exercise.deMapVersObjet(unMapExercise)).cast<Exercise>().toList();
    return listeObjetsExercise;
  }

  Future<List<Exercise>?> obtenirExerciseListFavorite() async {
    List<Exercise>? listeObjetsExercise = <Exercise>[];
    var exerciseMapList = await obtenirExercisesMapListFavorite(); //Liste map de la base de données
    //Créer la liste d'objets Exercise à partir de exerciseMapList
    listeObjetsExercise =
        exerciseMapList.map((unMapExercise) => Exercise.deMapVersObjet(unMapExercise)).cast<Exercise>().toList();
    return listeObjetsExercise;
  }
}
