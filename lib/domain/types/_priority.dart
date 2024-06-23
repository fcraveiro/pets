import 'package:flutter/material.dart';

import '../../screens/_components/text_styles/text_styles.dart';

enum PriorityType {
  one,
  two,
  theree,
  four,
  five,
  six,
  hundred;

  bool get isOne => this == PriorityType.one;
  bool get isTwo => this == PriorityType.two;
  bool get isThree => this == PriorityType.theree;
  bool get isFour => this == PriorityType.four;
  bool get isFive => this == PriorityType.five;
  bool get isSix => this == PriorityType.six;
  bool get ishundred => this == PriorityType.hundred;

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
      case 6:
        return Colors.red.shade400;
      case 100:
        return Colors.red.shade400;
    }
  }

  static fromIdName(int value) {
    switch (value) {
      case 1:
        return 'Básico';
      case 2:
        return 'Temporário';
      case 3:
        return 'Preciso';
      case 4:
        return 'Necessário';
      case 5:
        return 'Importante';
      case 6:
        return 'Emergência';
      case 100:
        return 'Emergência';
    }
  }

  static fromIdTitle(int value) {
    switch (value) {
      case 1:
        return GFont().noticeBlackText(13);
      case 2:
        return GFont().noticeBlackText(13);
      case 3:
        return GFont().noticeBlackText(13);
      case 4:
        return GFont().noticeBlackText(13);
      case 5:
        return GFont().noticeBlackText(13);
      case 6:
        return GFont().noticeBlackText(13);
      case 100:
        return GFont().noticeWhiteText(14);
    }
  }

  static fromIdSubTitle(int value) {
    switch (value) {
      case 1:
        return GFont().normalGreyText(12);
      case 2:
        return GFont().normalGreyText(12);
      case 3:
        return GFont().normalGreyText(12);
      case 4:
        return GFont().normalGreyText(12);
      case 5:
        return GFont().normalGreyText(12);
      case 6:
        return GFont().normalGreyText(12);
      case 100:
        return GFont().normalWhiteText(12);
    }
  }
}
