import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';
import 'inputpage.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: InputPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kPrimaryColor,
      ),
    );
  }
}