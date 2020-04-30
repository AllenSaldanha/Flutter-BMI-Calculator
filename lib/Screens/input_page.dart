import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/reusable_card.dart';
import '../Components/Icon_content.dart';
import'../Components/Constants.dart';
import 'results_page.dart';
import '../Components/Bottom_Button.dart';
import '../Components/RoundIconButton.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender==Gender.male? kContainerColor:kinactiveCardColor,//ternary operator if true ContainerColor else inactiveCardColor
                      cardChild: IconContent(gender:'MALE',genderIcon:FontAwesomeIcons.mars),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender==Gender.female? kContainerColor:kinactiveCardColor,
                      cardChild: IconContent(gender: 'FEMALE', genderIcon: FontAwesomeIcons.venus),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                colour: kContainerColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      textAlign: TextAlign.center,
                      style: kgendertextstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: knumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kgendertextstyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      colour: kContainerColor,
                      cardChild: Column(
                        children: <Widget>[
                          Text(
                              'WEIGHT',
                              style: kgendertextstyle,
                          ),
                          Text(
                            weight.toString(),
                            style: knumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      colour: kContainerColor,
                      cardChild: Column(
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kgendertextstyle,
                          ),
                          Text(
                            age.toString(),
                            style: knumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                    ],
                              ),
                        ],
                      ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(buttonTitle: 'CALCULATE',onTap:(){

            CalculatorBrain calc = CalculatorBrain(
              height: height,
              weight: weight,
            );

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultsPage(
                  bmiResult:calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                ),
              ),
            );
          },
          ),
        ],
      ),
    );
  }
}




