import 'dart:math';

import 'main.dart';

class CalculatorBrain {

  CalculatorBrain({this.altura, this.peso});

  final int altura;
  final int peso;
  double _bmi;

  String calcularBMI() {
    _bmi = peso / pow((altura / 100), 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25) {
      return "Sobrepeso";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Abajo del peso";
    }
  }

  String getInerpretation() {
    if (_bmi > 25) {
      return "Estas un poco arriba de lo normal, te recomiendo hacer ejercicio";
    } else if (_bmi > 18.5) {
      return "Felicidades! Estas en tu peso correcto. Buen Trabajo";
    } else {
      return "Te falta un poco de peso, Intenta comer más";
    }
  }

}