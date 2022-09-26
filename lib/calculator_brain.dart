import 'dart:math';

class calculatorbrain {
  calculatorbrain({required this.height, required this.weight});

  final int height;
  final int weight;
  double _bmi = 0;

  String calculateBMI() {
    double bmi = weight / pow(height / 100, 2);

    return bmi.toStringAsFixed(1);
  }

  String getrsult() {
    if (_bmi >= 25) {
      return 'overweight';
    } else if (_bmi >= 18.5) {
      return ' normal';
    } else {
      return 'underweight';
    }
  }

  String advice() {
    if (_bmi >= 25) {
      return 'Need to work!!';
    } else if (_bmi >= 18.5) {
      return ' Great work!';
    } else {
      return 'Eat somehting';
    }
  }
}
