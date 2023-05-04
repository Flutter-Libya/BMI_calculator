import 'dart:math';

class Calculator_brain {
  Calculator_brain({this.weight, this.height});
  final int height;
  final int weight;
  double _bmi;

  String calculateBMI() {
     _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Over Weight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Under Weight";
    }
  }
  String getInterpretaition() {
    if (_bmi >= 25) {
      return "try to go to the gym you need to lose some weight";
    } else if (_bmi > 18.5) {
      return "you are all good and there are nothing to be scared of";
    } else {
      return "you need to eat more because you are underweight and try to grow some muscles";
    }
  }
}
