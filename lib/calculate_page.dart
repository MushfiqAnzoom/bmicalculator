import 'package:bmicalculator/reusablecard.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {

  ResultPage({
    required this.bmiResult,
    required this.result,
    required this.review,
  });

  final String bmiResult;
  final String result;
  final String review;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Color(0xFF3E3656),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Container(
                child: Text(
                  'Your Results',
                  style: KTitleTextStyle,

                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
                onPress: () {},
                colour: kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      result.toString(),
                      style: KResultTextStyle,

                    ),
                    Text(
                      bmiResult,
                      style: KBMITextStyle,
                    ),
                    Text(
                      review,
                      style: KBodyTextStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                )
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              height: kBottomContainerHeight,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(bottom: 10),
              color: kBottomContainerColor,
              child: Center(

                child: Text('Re-Calculate',
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 30),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}