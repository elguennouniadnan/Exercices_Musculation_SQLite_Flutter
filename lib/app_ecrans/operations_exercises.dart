// ignore_for_file: prefer_const_constructors, deprecated_member_use, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../models/exercise.dart';
import '../utilitaires/database_helper.dart';

Future<String> navigerEcrans(context, ecran) async {
  String reponse = await Navigator.push(context, MaterialPageRoute(builder: (context) => ecran));
  return reponse;
}

class OperationsExercises extends StatefulWidget {
  final String _action;
  final Exercise _unExercise;
  final dynamic _occurrenceListeExercisesState;
  const OperationsExercises(this._unExercise, this._action, this._occurrenceListeExercisesState, {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OperationsExercisesState();
  }
}

class _OperationsExercisesState extends State<OperationsExercises> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  TextEditingController titleController = TextEditingController();
  TextEditingController imgController = TextEditingController();
  TextEditingController repeatController = TextEditingController();
  TextEditingController categorieController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final _formEnregKey = GlobalKey<FormState>();
  final _operationsExercisesStateKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    //Pour modifier et enlever
    titleController.text = widget._unExercise.title as String;
    imgController.text = widget._unExercise.img as String;
    repeatController.text = widget._unExercise.repeat as String;
    categorieController.text = widget._unExercise.categorie as String;
    descriptionController.text = widget._unExercise.description as String;
  }

  @override
  Widget build(BuildContext context) {
    String action = widget._action;
    final Exercise unExercise = widget._unExercise;

    //Cas modifier et enlever
    bool estVisibleButtonModifier = true;
    bool estVisibleButtonEnlever = true;
    bool estVisibleButtonEnregistrer = false;

    if (action == 'enregistrer') {
      estVisibleButtonModifier = false;
      estVisibleButtonEnlever = false;
      estVisibleButtonEnregistrer = true;
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF8C95E8),
        appBar: AppBar(
          leading: null,
          title: Text(action, style: TextStyle(color: Colors.orange[300])),
          backgroundColor: Color(0xFF363f93),
        ),
        body: Form(
          key: _formEnregKey,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                //
                //
                //MARK: TITLE
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    controller: titleController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Vous devez entrer un titre';
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF363f93),
                    ),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Titre',
                      hintText: 'Maximum 20 caractères',
                      errorStyle: TextStyle(
                        color: Color(0xFF363f93),
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                //
                //
                //MARK: IMAGE
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    controller: imgController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Vous devez entrer le lien d\'une image';
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF363f93),
                    ),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Image',
                      hintText: 'Maximum 20 caractères',
                      errorStyle: TextStyle(
                        color: Color(0xFF363f93),
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                //
                //
                //MARK: REPEAT
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    controller: repeatController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Vous devez entrer le nombre de répétitions';
                      }
                      return null;
                    },
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF363f93)),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Nombre de répétitions',
                      hintText: 'Maximum 20 caractères',
                      errorStyle: TextStyle(
                        color: Color(0xFF363f93),
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                //
                //
                //MARK: CATEGORY
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    controller: categorieController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Vous devez entrer la catégorie';
                      }
                      return null;
                    },
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF363f93)),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Catégorie',
                      hintText: 'Maximum 20 caractères',
                      errorStyle: TextStyle(
                        color: Color(0xFF363f93),
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                //
                //
                //MARK: DESCRIPTION
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    controller: descriptionController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Vous devez entrer la description';
                      }
                      return null;
                    },
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF363f93)),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      hintText: 'Maximum 100 caractères',
                      errorStyle: TextStyle(
                        color: Color(0xFF363f93),
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                //
                //
                //MARK: BUTTONS
                Padding(
                  padding: EdgeInsets.only(bottom: 5, top: 5),
                  child: Row(
                    children: <Widget>[
                      //
                      //
                      //MARK: MODIFIER
                      Visibility(
                        visible: estVisibleButtonModifier,
                        child: Expanded(
                          child: RaisedButton(
                            color: Color(0xFF363f93),
                            textColor: Theme.of(context).cardColor,
                            child: Text(
                              'Modifier',
                              textScaleFactor: 1.5,
                              style: TextStyle(color: Colors.orange[300]),
                            ),
                            onPressed: () async {
                              // ignore: unnecessary_this
                              String reponse = await this._enregistrerChangements('modifier');

                              Navigator.pop(context, reponse);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      //
                      //
                      //MARK: ENLEVER
                      Visibility(
                        visible: estVisibleButtonEnlever,
                        child: Expanded(
                          child: RaisedButton(
                            color: Color.fromARGB(255, 98, 112, 239),
                            textColor: Theme.of(context).cardColor,
                            child: Text(
                              'Enlever',
                              textScaleFactor: 1.5,
                              style: TextStyle(color: Colors.orange[300]),
                            ),
                            onPressed: () async {
                              String reponse = await _enregistrerChangements('enlever');
                              Navigator.pop(context, reponse);
                            },
                          ),
                        ),
                      ),
                      //
                      //
                      //MARK: ENREGISTRER
                      Visibility(
                        visible: estVisibleButtonEnregistrer,
                        child: Expanded(
                          child: RaisedButton(
                            color: Color(0xFF363f93),
                            textColor: Theme.of(context).cardColor,
                            child: Text(
                              'Enregistrer',
                              textScaleFactor: 1.5,
                              style: TextStyle(color: Colors.orange[300]),
                            ),
                            onPressed: () async {
                              String reponse = await _enregistrerChangements('enregistrer');
                              Navigator.pop(context, reponse);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  //TODO: REMOVE UNUSED FUNCTION
  // void _vider() {
  //   titleController.text = '';
  //   imgController.text = '';
  //   repeatController.text = '';
  //   categorieController.text = '';
  //   descriptionController.text = '';
  // }

  dynamic _enregistrerChangements(provenance) async {
    dynamic resultat;
    String msg;
    widget._unExercise.title = titleController.text;
    widget._unExercise.img = imgController.text;
    widget._unExercise.repeat = repeatController.text;
    widget._unExercise.categorie = categorieController.text;
    widget._unExercise.description = descriptionController.text;

    if (provenance == 'modifier') {
      resultat = await databaseHelper.modifierExercise(widget._unExercise);

      msg = 'modifié';
    } else if (provenance == 'enlever') {
      resultat = await databaseHelper.enleverExercise(widget._unExercise.ref!);
      msg = 'enlevé';
    } else {
      //enregistrer
      //_unExercise.ref = 1;
      resultat = await databaseHelper.ajouterExercise(widget._unExercise); //Retourne le dernier ref inséré
      widget._unExercise.ref = resultat;
      msg = 'enregistré';
    }
    if (resultat != 0) {
      msg = "Exercise ${widget._unExercise.ref} a été $msg";
    } else {
      msg = "Impossible pour $msg le exercise ${widget._unExercise.ref}";
    }
    return msg;
  }

  void montrerSnackBar(item) {
    var snackBar = SnackBar(
      content: Text(item),
      action: SnackBarAction(label: "Fermer", onPressed: () {}),
    );

    _operationsExercisesStateKey.currentState!.showSnackBar(snackBar);
  }

  dynamic setFavorite(unExercise) async {
    widget._occurrenceListeExercisesState.setState(() {});

    if (unExercise.favorite == 1) {
      unExercise.favorite = 0;
      montrerSnackBar("${unExercise.title} a été supprimé de favoris");
    } else if (unExercise.favorite == 0) {
      unExercise.favorite = 1;

      montrerSnackBar("${unExercise.title} a été ajouté aux favoris");
    }

    databaseHelper.modifierExercise(unExercise);
  }

  void reactualiserListView(categorie) async {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      if (categorie == 'favorite') {
        Future<List<Exercise>?> listeExercisesMap = databaseHelper.obtenirExerciseListFavorite();

        listeExercisesMap.then((listeExercises) {
          setState(() {
            listeExercises = listeExercises;
          });
        });
      } else {
        Future<List<Exercise>?> listeExercisesMap = databaseHelper.obtenirExerciseListParCategorie(categorie);

        listeExercisesMap.then((listeExercises) {
          setState(() {
            listeExercises = listeExercises;
          });
        });
      }
    });
  }
}
