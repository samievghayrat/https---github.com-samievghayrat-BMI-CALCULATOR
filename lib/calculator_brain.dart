import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;
  late double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  dynamic getResult() {
    if (29.9 >= _bmi && _bmi >= 25.0) {
      return 'Overweight';
    } else if (24.9 > _bmi && _bmi >= 18.5) {
      return 'NORMAL';
    } else if (_bmi < 18.5) {
      return 'Underweight';
    } else if (_bmi > 30) {
      return 'OBESE';
    }
  }

  dynamic getInterpretation() {
    if (29.9 > _bmi && _bmi > 25) {
      return 'You are recommended losign weight through healthy eating and being more physically active. Kids are teens who are overweight are more likely to develop diabetes and other health issues.\n';
    } else if (24.9 > _bmi && _bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else if (_bmi < 18.5) {
      return 'You are in the underweight range, for you it is recommended to eat more, eat 5 or 6 smaller meals instead of 2 ir 3 large meals during the day . Look for nutrient rich foods.\n';
    } else if (_bmi > 30) {
      return 'Obesity is caused by eating too much and moving little. The basic solution for obesity consists of weight loss with dieting and physical exercise. Dieting can result in weight loss in the short term and in the long term, also combining with exercise and counseling provide greater results. ';
    }
  }
}
