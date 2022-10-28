// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, import_of_legacy_library_into_null_safe
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';
import '../utilitaires/database_helper.dart';
import '/app_ecrans/ecran_depart.dart';
import '/models/exercise.dart';

Future<String> navigerEcrans(context, ecran) async {
  String reponse = await Navigator.push(context, MaterialPageRoute(builder: (context) => ecran));
  return reponse;
}

class DetailExercice extends StatelessWidget {
  final Exercise _unExercise;
  final DatabaseHelper databaseHelper = DatabaseHelper();

  DetailExercice(this._unExercise, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle appBarActionStyle = TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    final double width = MediaQuery.of(context).size.width * 0.90;

    // https://www.youtube.com/watch?v=V89BOZhJFlI // how to install video
    // https://www.youtube.com/watch?v=KaBmao5e_54  // Cool gym video
    String? videoID = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=KaBmao5e_54");

    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: videoID as String,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
        loop: false,
        forceHD: false,
        isLive: false,
        disableDragSeek: false,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(_unExercise.title as String,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 197, 203, 255))),
        backgroundColor: Color(0xFF363f93),
        actions: <Widget>[
          GestureDetector(
            child: _unExercise.favorite == 1
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
              //On utilise juste pour indiquer si l'exercice est favorite ou pas. Pas d'action.
            },
          ),
          TextButton(
              style: appBarActionStyle,
              onPressed: () {
                navigerEcrans(context, EcranDepart());
              },
              child: Icon(
                Icons.home,
                color: Color.fromARGB(255, 197, 203, 255),
                size: 26,
              )),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          //
          //
          //
          //
          //MARK: image or video
          //Image.asset(_unExercise.img as String),
          YoutubePlayer(
            controller: controller,
            liveUIColor: Colors.amber,
          ),
          //
          //
          //
          //
          //
          //
          //
          //
          //MARK: EXERCICE DESCRIPTION
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF363f93),
              ),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: SizedBox(
                        height: 160,
                        width: width,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFF8C95E8),
                            border: Border.all(
                              color: Colors.orange,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Text(
                                _unExercise.description as String,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF363f93),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //MARK: EXERCICE REP & SET
                  Center(
                    child: SizedBox(
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: width * 0.40,
                            decoration: BoxDecoration(
                              color: Color(0xFF8C95E8),
                              border: Border.all(
                                color: Colors.orange,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              _unExercise.sets as String,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF363f93),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: width * 0.40,
                            decoration: BoxDecoration(
                              color: Color(0xFF8C95E8),
                              border: Border.all(
                                color: Colors.orange,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              //_unExercise.repeat as String,
                              'x10',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF363f93),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SizedBox(
                      width: width * 0.70,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF8C95E8),
                          border: Border.all(
                            color: Colors.orange,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              '${_unExercise.pause as String} de pause',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF363f93),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Image.asset('assets/images/icones/logo9-4.png'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  dynamic setFavorite(unExercise) async {
    if (unExercise.favorite == 1) {
      unExercise.favorite = 0;
      //montrerSnackBar("${_unExercise.title} a été supprimé de favoris");
    } else if (unExercise.favorite == 0) {
      _unExercise.favorite = 1;
      //montrerSnackBar("${_unExercise.title} a été ajouté aux favoris");
    }

    databaseHelper.modifierExercise(unExercise);
  }
}
