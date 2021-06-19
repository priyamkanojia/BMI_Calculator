import 'dart:math';
import 'input_page.dart';
class CalculatorBrain {
  final int height;
  final int weight;
  final Gender gender;
  double _bmi=1;
  double _overweight = 25.0;
  double _underweight = 20;
  int age;
  CalculatorBrain({required this.height,required this.weight,required this.gender,required this.age}){
    _bmi= weight / pow(height / 100, 2);

    if(gender == Gender.female) {
      _overweight--;
      _underweight--;
      print(_underweight);
      print(_overweight);
    }
    if (age <= 24) {
      _overweight--;
      _underweight--;
      // 25 -34 is the normal Rate
    } else if (age >= 35 && age <= 44) {
      _overweight++;
      _underweight++;
    } else if (age >= 45 && age <= 54) {
      _overweight = _overweight + 2;
      _underweight = _underweight + 2;
    } else if (age >= 55 && age <= 64) {
      _overweight = _overweight + 3;
      _underweight = _underweight + 3;
    } else if (age > 64) {
      _overweight = _overweight + 4;
      _underweight = _underweight + 4;
    }
  }
  String calculateBMI (){
    return _bmi.toStringAsFixed(1);
  }
  String getResult() {
    if (_bmi >= _overweight) {
      return 'Overweight';
    } else if (_bmi > _underweight && _bmi<_overweight) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }



  String getInterpretation() {
      if (_bmi >= _overweight){
        return 'You have a higher than normal body weight. Try to exercise more.';
      }
      else if (_bmi > _underweight && _bmi<_overweight) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
void main(){
  CalculatorBrain calc = CalculatorBrain(height:150, weight:80, gender: Gender.male,age:25);
  //print(calc._overweight);
  print(calc.calculateBMI());
  print(calc.getResult());
  print(calc.getInterpretation());
}
