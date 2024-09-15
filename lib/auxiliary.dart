import 'package:flutter/material.dart';

List<List<T>> getPages<T>(List<T> items, int itemsPerPage) {
  List<List<T>> pages = [];

  for (int i = 0; i < items.length; i += itemsPerPage) {
    int end = (i + itemsPerPage < items.length) ? i + itemsPerPage : items.length;
    pages.add(items.sublist(i, end));
  }

  return pages;
}

String upperFirstLetter(String input) {
  return input[0].toUpperCase() + input.substring(1);
}

String padronizeNumberFormat(int number) {
  return number.toString().padLeft(3, '0');
}

int getGeneration(String generation) {
  switch (generation) {
    case 'generation-i':
      return 1;
    case 'generation-ii':
      return 2;
    case 'generation-iii':
      return 3;
    case 'generation-iv':
      return 4;
    case 'generation-v':
      return 5;
    case 'generation-vi':
      return 6;
    case 'generation-vii':
      return 7;
    case 'generation-viii':
      return 8;
    case 'generation-ix':
      return 9;
    case 'generation-x':
      return 10;
    case 'generation-xi':
      return 11;
    case 'generation-xii':
      return 12;
    case 'generation-xiii':
      return 13;
    case 'generation-xiv':
      return 14;
    case 'generation-xv':
      return 15;
    default:
      return -1;
  }
}

Color getColorFromType(String type){
  switch(type) {
    case 'fire':
      return Color.fromARGB(255, 251, 108, 108);
    case 'water':
      return Color.fromARGB(255, 118, 189, 254);
    case 'grass':
      return Color.fromARGB(255, 70, 209, 177);
    default:
      return Color.fromARGB(255, 255, 248, 189);
  }
}

Color lightenColor(Color color, [double amount = 0.3]) {
  return Color.lerp(color, Colors.white, amount)!;
}