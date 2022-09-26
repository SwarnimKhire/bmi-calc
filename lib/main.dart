// ignore_for_file: prefer_const_constructors

import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'result_page.dart';

void main() => runApp(bmicalculator());

class bmicalculator extends StatelessWidget {
  const bmicalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(backgroundColor: Color(0xFF101639)),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        // textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
      ),
      home: InputPage(),
    );
  }
}
