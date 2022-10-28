// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'dart:async';
import 'package:flutter/material.dart';
import '../models/exercise.dart';
import '../utilitaires/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import '../app_ecrans/operations_exercises.dart';
import './detail_exercice.dart';

Future<String> navigerEcrans(context, ecran) async {
  String reponse = await Navigator.push(context, MaterialPageRoute(builder: (context) => ecran));

  return reponse;
}

class ListeExercises extends StatefulWidget {
  final String categorie;
  const ListeExercises(this.categorie, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListeExercisesState();
  }
}

class ListeExercisesState extends State<ListeExercises> {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  List<Exercise>? listeExercises;

  final _listeExercisesStateKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var categorie = widget.categorie;

    if (listeExercises == null) {
      listeExercises = <Exercise>[];
      reactualiserListView(categorie);
    } else {
      setState(() {});
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF8C95E8),
        key: _listeExercisesStateKey,
        appBar: AppBar(
          title: Text('Liste des exercises', style: TextStyle(color: Colors.orange[300])),
          backgroundColor: Color(0xFF363f93),
        ),
        body: Column(children: [
          ListeViewExercises(listeExercises!, this, categorie),
        ]),
        bottomNavigationBar: BottomAppBar(
          color: Color(0xFF363f93),
          shape: const CircularNotchedRectangle(),
          child: Container(height: 50.0),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF363f93),
          onPressed: () async {
            Exercise unExercise = Exercise(null, '', '', '', '', '', '', '', '', 0);
            String action = await navigerEcrans(
              context,
              OperationsExercises(unExercise, 'enregistrer', this),
            );
            reactualiserListView(categorie);
            montrerSnackBar(action);
          },
          tooltip: 'Ajouter un exercise',
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  //FIX: FONCTION

  void reactualiserListView(categorie) async {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      if (categorie == 'favorite') {
        Future<List<Exercise>?> listeExercisesMap = databaseHelper.obtenirExerciseListFavorite();

        listeExercisesMap.then((listeExercises) {
          setState(() {
            this.listeExercises = listeExercises;
          });
        });
      } else {
        Future<List<Exercise>?> listeExercisesMap = databaseHelper.obtenirExerciseListParCategorie(categorie);

        listeExercisesMap.then((listeExercises) {
          setState(() {
            this.listeExercises = listeExercises;
          });
        });
      }
    });
  }

  void montrerSnackBar(item) {
    var snackBar = SnackBar(
      backgroundColor: Color.fromARGB(255, 28, 37, 117),
      content: Text(
        item,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF8C95E8)),
      ),
      action: SnackBarAction(label: "Fermer", onPressed: () {}),
    );

    //Scaffold.of(context).showSnackBar(snackBar);
    // ignore: deprecated_member_use
    _listeExercisesStateKey.currentState!.showSnackBar(snackBar);
  }
}

//FIX: LISTE

class ListeViewExercises extends StatelessWidget {
  final List<Exercise> listeExercises;
  final String categorie;
  final dynamic _occurrenceListeExercisesState;
  late String _action;
  final DatabaseHelper helper = DatabaseHelper();

  ListeViewExercises(this.listeExercises, this._occurrenceListeExercisesState, this.categorie, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        //separated
        padding: const EdgeInsets.all(4),
        itemCount: listeExercises.length,
        itemBuilder: listBuilder,
      ),
    );
  }

  Widget listBuilder(BuildContext context, int index) {
    return Card(
      //bonne façon de mettre une couleur dans ListTile
      color: Color.fromARGB(255, 76, 89, 207),
      child: ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage(listeExercises[index].img!)),
          title: Text(listeExercises[index].title!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 197, 203, 255))),
          subtitle: Text(listeExercises[index].repeat!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 197, 203, 255))),
          onTap: () async {
            _action = await navigerEcrans(
              context,
              DetailExercice(listeExercises[index]),
            );

            _occurrenceListeExercisesState.reactualiserListView(listeExercises[index].categorie);
            await _occurrenceListeExercisesState.montrerSnackBar(_action);
          },
          trailing: Column(children: <Widget>[
            //MARK: ELLIPSIS
            GestureDetector(
              child: Icon(
                Icons.more_horiz_rounded,
                color: Colors.orange[300],
                size: 30,
              ),
              onTap: () async {
                _action = await navigerEcrans(
                  context,
                  OperationsExercises(listeExercises[index], 'Liste les exercises', _occurrenceListeExercisesState),
                );

                //[ALEX]---Changed this line, added categories

                await _occurrenceListeExercisesState.reactualiserListView(listeExercises[index].categorie);
                //await _occurrenceListeExercisesState.montrerSnackBar(_action);
              },
            ),
            //MARK: FAVORI
            GestureDetector(
              child: listeExercises[index].favorite == 1
                  ? Icon(
                      Icons.favorite,
                      color: Color.fromARGB(255, 255, 134, 125),
                      size: 26,
                    )
                  : Icon(
                      Icons.favorite,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 26,
                    ),
              onTap: () async {
                setFavorite(listeExercises[index]);
                _occurrenceListeExercisesState.reactualiserListView(categorie);
              },
            ),
          ])),
    );
  }

  dynamic setFavorite(unExercise) async {
    _occurrenceListeExercisesState.setState(() {});

    if (unExercise.favorite == 1) {
      unExercise.favorite = 0;
      _occurrenceListeExercisesState.montrerSnackBar("${unExercise.title} a été supprimé de favoris");
    } else if (unExercise.favorite == 0) {
      unExercise.favorite = 1;

      _occurrenceListeExercisesState.montrerSnackBar("${unExercise.title} a été ajouté aux favoris");
    }

    helper.modifierExercise(unExercise);
  }
}
