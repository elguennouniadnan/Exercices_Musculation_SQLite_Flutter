// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'app_ecrans/ecran_depart.dart';

void main() => {runApp(MaAppFlutter())};

class MaAppFlutter extends StatelessWidget {
  const MaAppFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo,
        textTheme: TextTheme(
          headline3: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.red[400],
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.indigoAccent),
      ),
      home: SafeArea(
        child: Scaffold(
          body: EcranDepart(),
        ),
      ),
    );
  }
}
