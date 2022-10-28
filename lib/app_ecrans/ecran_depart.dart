// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'liste_exercises.dart';

class EcranDepart extends StatefulWidget {
  const EcranDepart({Key? key}) : super(key: key);

  @override
  EcranDepartState createState() => EcranDepartState();
}

class EcranDepartState extends State<EcranDepart> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF8C95E8),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 160,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 4,
              ),
              // borderRadius: BorderRadius.only(
              //   bottomRight: Radius.circular(10),
              //   bottomLeft: Radius.circular(10),
              // ),
              color: Color(0xFF363f93),
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 42,
                    left: -3,
                    child: Container(
                      height: 70,
                      width: 230,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 4,
                        ),
                        color: Color(0xFF8C95E8),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(75),
                          bottomRight: Radius.circular(75),
                        ),
                      ),
                    )),
                Positioned(
                  //top:20,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerRight,
                        image: AssetImage('assets/images/icones/logo13.png'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 52,
                  left: 22,
                  child: Text("GymGorillas",
                      style: TextStyle(
                          fontSize: 36, fontFamily: 'Gorilla', fontWeight: FontWeight.w600, color: Color(0xFF363f93))),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Container(
            height: 140,
            width: 340,
            child: Stack(children: [
              Row(children: [
                Column(
                  children: [
                    Card(
                      elevation: 15.0,
                      // shadowColor: Colors.grey.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/icones/favorite6.png'),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              navigerEcrans(context, ListeExercises('favorite'));
                            },
                          )),
                    ),
                    Text(
                      'Favoris',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Color(0xFF363f93)),
                    )
                  ],
                ),
                Spacer(flex: 120),
                Column(
                  children: [
                    Card(
                      elevation: 15.0,
                      //shadowColor: Colors.grey.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/exercises/abdominaux.jpg'),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              navigerEcrans(context, ListeExercises('Abdominaux'));
                            },
                          )),
                    ),
                    Text(
                      'Abdominaux',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Color(0xFF363f93)),
                    )
                  ],
                ),
              ])
            ]),
          ),
          Container(
            height: 140,
            width: 340,
            child: Stack(children: [
              Row(children: [
                Column(
                  children: [
                    Card(
                      elevation: 15.0,
                      //shadowColor: Colors.grey.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/exercises/biceps.jpg'),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              navigerEcrans(context, ListeExercises('Biceps'));
                            },
                          )),
                    ),
                    Text(
                      'Biceps',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Color(0xFF363f93)),
                    ),
                  ],
                ),
                Spacer(flex: 120),
                Column(
                  children: [
                    Card(
                      elevation: 15.0,
                      //shadowColor: Colors.grey.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/exercises/CuissesEtFessiers.jpg'),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              navigerEcrans(context, ListeExercises('Cuisses-Fessiers'));
                            },
                          )),
                    ),
                    Text(
                      'Cuisses et Fessiers',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Color(0xFF363f93)),
                    ),
                  ],
                ),
              ])
            ]),
          ),
          Container(
            height: 140,
            width: 340,
            child: Stack(children: [
              Row(children: [
                Column(
                  children: [
                    Card(
                      elevation: 15.0,
                      //shadowColor: Colors.grey.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/exercises/dos.jpg'),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              navigerEcrans(context, ListeExercises('Dos'));
                            },
                          )),
                    ),
                    Text(
                      'Dos',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Color(0xFF363f93)),
                    ),
                  ],
                ),
                Spacer(flex: 120),
                Column(
                  children: [
                    Card(
                      elevation: 15.0,
                      //shadowColor: Colors.grey.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/exercises/épaules.jpg'),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              navigerEcrans(context, ListeExercises('Épaules'));
                            },
                          )),
                    ),
                    Text(
                      'Épaules',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Color(0xFF363f93)),
                    ),
                  ],
                ),
              ])
            ]),
          ),
          Container(
            height: 140,
            width: 340,
            child: Stack(children: [
              Row(children: [
                Column(
                  children: [
                    Card(
                      elevation: 15.0,

                      ///shadowColor: Colors.grey.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/exercises/mollets.jpg'),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              navigerEcrans(context, ListeExercises('Mollets'));
                            },
                          )),
                    ),
                    Text(
                      'Mollets',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Color(0xFF363f93)),
                    ),
                  ],
                ),
                Spacer(flex: 120),
                Column(
                  children: [
                    Card(
                      elevation: 15.0,
                      //shadowColor: Colors.grey.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/exercises/pectoraux.jpg'),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              navigerEcrans(context, ListeExercises('Pectoraux'));
                            },
                          )),
                    ),
                    Text(
                      'Pectoraux',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Color(0xFF363f93)),
                    ),
                  ],
                ),
              ])
            ]),
          ),
          Container(
            height: 140,
            width: 340,
            child: Stack(children: [
              Row(children: [
                Column(
                  children: [
                    Card(
                      elevation: 15.0,
                      //shadowColor: Colors.grey.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/exercises/triceps.jpg'),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              navigerEcrans(context, ListeExercises('Triceps'));
                            },
                          )),
                    ),
                    Text(
                      'Triceps',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Color(0xFF363f93)),
                    ),
                  ],
                ),
                Spacer(flex: 120),
                Column(
                  children: [
                    Card(
                      elevation: 15.0,
                      //shadowColor: Colors.grey.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/exercises/Avant-bras.jpg'),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              navigerEcrans(context, ListeExercises('Avant Bras'));
                            },
                          )),
                    ),
                    Text(
                      'Avant-bras',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Color(0xFF363f93)),
                    ),
                  ],
                ),
              ])
            ]),
          ),
        ],
      )),
    );
  }
}





































                    // Positioned(
                    //   top: 15,
                    //   left: 25,
                    //   child: Material(

                    //     child: Container(
                    //       height: 100.0,
                    //       width: width*0.4,
                    //       decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(0.0),
                    //         boxShadow: [BoxShadow(
                    //           color: Colors.grey.withOpacity(0.3),
                    //           offset: Offset(-5.0, 5.0),
                    //           blurRadius: 20.0,
                    //           spreadRadius: 8.0,
                    //         )],
                    //       ),
                    //     ),
                    //   )
                    // ),



