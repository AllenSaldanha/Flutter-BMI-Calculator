import 'package:flutter/material.dart';
import '../Components/Constants.dart';
import '../Components/reusable_card.dart';
import '../Components/Bottom_Button.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResult,@required this.interpretation,@required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex:1,
            child: Container(
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex:5,
            child: ReusableCard(
              colour: kContainerColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style:kresultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(buttonTitle: 'RE-CALCULATE',onTap: (){
            Navigator.pop(context);
          },),
        ],
      ),
    );
  }
}
