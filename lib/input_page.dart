import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'results_page.dart';


enum Gender { male, female }
Gender selectedGender =Gender.male;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardColour;
  Color femaleCardColour = inactiveCardColour;
  int height = 180;
  int weight = 50;
  int age=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                    print('Male card pressed');
                  },
                  child: ReusableCard(
                    colour: selectedGender == Gender.male
                        ? selectedCardColor
                        : inactiveCardColour,
                    cardChild: IconContent(
                      genderIcon: FontAwesomeIcons.mars,
                      gender: 'MALE',
                    ),
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                    print('Female card pressed');
                  },
                  child: ReusableCard(
                    colour: selectedGender == Gender.female
                        ? selectedCardColor
                        : inactiveCardColour,
                    cardChild: IconContent(
                      genderIcon: FontAwesomeIcons.venus,
                      gender: 'FEMALE',
                    ),
                  ),
                )),
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                    colour: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: labelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            //SizedBox(width: 15.0),
                            Text(
                              height.toString(),
                              style: numberTextStyle,
                            ),
                            SizedBox(width: 3.0),
                            Text(
                              'cm',
                              style: labelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            thumbColor: Color(0xFFEB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                            overlayColor: Color(0x16EB1555),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                            min: 100,
                            max: 220,
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  colour: activeCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT', style: labelTextStyle),
                      Text(
                        weight.toString(),
                        style: numberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            style:TextButton.styleFrom(
                              backgroundColor: Color(0xFF4C4F5E),
                              elevation: 5.0,
                              fixedSize:Size(50.0, 50.0),
                              shape:CircleBorder(),
                              shadowColor: Colors.black,
                            ),
                            child: Icon(
                              FontAwesomeIcons.plus,
                            ),
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          SizedBox(width:10.0),
                          ElevatedButton(
                            style:TextButton.styleFrom(
                              backgroundColor: Color(0xFF4C4F5E),
                              elevation: 5.0,
                              fixedSize:Size(50.0, 50.0),
                              shape:CircleBorder(),
                              shadowColor: Colors.black,
                            ),
                            child: Icon(
                              FontAwesomeIcons.minus,
                            ),
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
                Expanded(child: ReusableCard(colour: activeCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('AGE', style: labelTextStyle),
                    Text(
                      age.toString(),
                      style: numberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          style:TextButton.styleFrom(
                            backgroundColor: Color(0xFF4C4F5E),
                            elevation: 5.0,
                            fixedSize:Size(50.0, 50.0),
                            shape:CircleBorder(),
                            shadowColor: Colors.black,
                          ),
                          child: Icon(
                            FontAwesomeIcons.plus,
                          ),
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                        SizedBox(width:10.0),
                        ElevatedButton(
                          style:TextButton.styleFrom(
                            backgroundColor: Color(0xFF4C4F5E),
                            elevation: 5.0,
                            fixedSize:Size(50.0, 50.0),
                            shape:CircleBorder(),
                            shadowColor: Colors.black,
                          ),
                          child: Icon(
                            FontAwesomeIcons.minus,
                          ),
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                )),
              ],
            ),
          ),
          GestureDetector(
            onTap:(){
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight, gender: selectedGender, age: age);
              Navigator.push(context,MaterialPageRoute(builder: (context)=>ResultPage(
                resultText:calc.getResult().toUpperCase(),
                bmiResult:calc.calculateBMI(),
                interpretation: calc.getInterpretation(),
              )));
            },
            child: Container(
              color: bottomCardColour,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 10.0),
              width: double.infinity,
              height: bottomCardHeight,
              child: Center(child: Text('CALCULATE',style:TextStyle(fontSize: 25.0,fontWeight: FontWeight.w700),),),
            ),
          ),
        ],
      ),
    );
  }
}

/*class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  RoundIconButton({required this.icon,required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed(),
      //elevation: 5.0,
      constraints: BoxConstraints.tightFor(width: 50.0, height: 50.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
*/
