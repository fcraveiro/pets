import 'package:flutter/material.dart';

enum PriorityType {
  one,
  two,
  theree,
  four,
  five;

  bool get isOne => this == PriorityType.one;
  bool get isTwo => this == PriorityType.two;
  bool get isThree => this == PriorityType.theree;
  bool get isFour => this == PriorityType.four;
  bool get isFive => this == PriorityType.five;

  static fromIdColor(int value) {
    switch (value) {
      case 1:
        return Colors.cyan.shade100;
      case 2:
        return Colors.green.shade100;
      case 3:
        return Colors.blue.shade100;
      case 4:
        return Colors.yellow.shade100;
      case 5:
        return Colors.red.shade100;
    }
  }

  static fromIdName(int value) {
    switch (value) {
      case 1:
        return 'Básico';
      case 2:
        return 'Preciso';
      case 3:
        return 'Necessário';
      case 4:
        return 'Importante';
      case 5:
        return 'Emergência';
    }
  }
}
