import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'constants.dart';
class ResultPage extends StatelessWidget {
  ResultPage({required this.bmiResult,required this.resultText,required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(45.0),
            child: Text('BMI CALCULATOR'),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:<Widget> [
            Expanded(child: Center(child: Text('Your Result',style:TextStyle(fontSize: 40.0,fontWeight: FontWeight.w700),))),
            Expanded(
              flex: 5,
              child: ReusableCard(colour: activeCardColour,
              cardChild: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment:CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(resultText,style: resultTextStyle,),
                    Text(bmiResult,style: bmiTextStyle),
                    Text(interpretation,textAlign:TextAlign.center, style:TextStyle(fontSize: 22.0),),
                  ],
                ),
              ),
            ),),
            GestureDetector(
              onTap:(){
                Navigator.pop(context);
              },
              child: Container(
                color: bottomCardColour,
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.only(bottom: 10.0),
                width: double.infinity,
                height: bottomCardHeight,
                child: Center(child: Text('RE-CALCULATE',style:TextStyle(fontSize: 25.0,fontWeight: FontWeight.w700),),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
