import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds:3), () {
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>BMICalculator()));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0A0E21),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/bmi.png',height: 250.0,),
              Text('BMI\nCALCULATOR',textAlign: TextAlign.center,style: TextStyle(color: Colors.teal,fontSize: 40.0,fontWeight:FontWeight.bold),),
            ],
          ),
        ),
      );
  }
}


