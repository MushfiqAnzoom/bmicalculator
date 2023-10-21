import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/reusablecard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/calculate_page.dart';
import 'package:bmicalculator/calculator.dart';

enum Gender{male,female}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender activeGender = Gender.male;
  int height = 120;
  int weight = 50;
  int age = 18;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI Calculator"),
        backgroundColor: Color(0xFF5B529A),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                      colour: activeGender == Gender.male? kActiveCardColor:kInActiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.person,size: 80,),
                          SizedBox(
                            height: 15,
                          ),
                          Text('MALE',style: KLabelTextStyle,)
                        ],
                      ),
                      onPress: (){
                        setState(() {
                          activeGender = Gender.male;
                        });
                      },
                    ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeGender == Gender.female? kActiveCardColor:kInActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.personDress,size: 80,),
                        SizedBox(
                          height: 15,
                        ),
                        Text('FEMALE',style: KLabelTextStyle,)
                      ],
                    ),
                    onPress: (){
                      setState(() {
                        activeGender = Gender.female;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
                colour: kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(
                          height.toString(),
                          style: KNumberTextStyle,
                        ),
                        Text('cm',style: KLabelTextStyle,),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFF331F46),
                        activeTrackColor: Color(0xFF331F46),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7.5),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 15),
                        trackHeight: 1,
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 100,
                        max: 250,
                        onChanged: (double value){
                          setState(() {
                            height = value.toInt();
                          });
                        },
                      ),
                    ),
                    Text(
                      'HEIGHT',style: KLabelTextStyle,
                    ),
                  ],
                ),
                onPress: (){},
              )
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT',style: KLabelTextStyle,),
                        SizedBox(height: 5,),
                        Text(
                          weight.toString(),
                          style: KNumberTextStyle,
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: Icon(FontAwesomeIcons.minus, color: Colors.white,),
                                onTap: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RoundIconButton(
                              icon: Icon(FontAwesomeIcons.plus, color: Colors.white,),
                              onTap: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )

                      ],
                    ),
                    onPress: (){},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE',style: KLabelTextStyle,),
                        SizedBox(height: 5,),
                        Text(
                          age.toString(),
                          style: KNumberTextStyle,
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icon(FontAwesomeIcons.minus, color: Colors.white,),
                              onTap: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RoundIconButton(
                              icon: Icon(FontAwesomeIcons.plus, color: Colors.white,),
                              onTap: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )

                      ],
                    ),
                    onPress: (){},
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: ()
            {
              Calculate bmiCalculate = new Calculate(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: bmiCalculate.calculateBMI(),
                    result: bmiCalculate.getResults(),
                    review:bmiCalculate.getReview(),
                  ),
                )
              );
            },
            child: Container(
              width: double.infinity,
              height: kBottomContainerHeight,
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.only(bottom: 5),
              color: kBottomContainerColor,
              child: Center(
                child: Text('CALCULATE',
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 30),)
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget{
  RoundIconButton({required this.icon, required this.onTap});
  final Icon icon;
  final Function onTap;

  @override
  Widget build(BuildContext){
    return RawMaterialButton(
      child: icon,
      shape: CircleBorder(),
      fillColor: kButtonColor,
      onPressed: (){
        onTap();
      },
      constraints: BoxConstraints.tightFor(
        width: 40, height: 40,
      ),
      elevation: 7,
    );
  }
}