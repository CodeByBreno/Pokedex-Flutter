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
    case 'bug':
      return Color.fromARGB(255, 143, 180, 51);
    case 'electric':
      return Color.fromARGB(255, 255, 191, 43);
    case 'poison':
      return Color.fromARGB(255, 144, 60, 255);
    case 'dark':
      return Color.fromARGB(255, 82, 82, 82);
    case 'psychic':
      return Color.fromARGB(255, 255, 82, 212);
    case 'ground':
      return Color.fromARGB(255, 205, 183, 38);
    case 'ghost':
      return Color.fromARGB(255, 105, 83, 227);
    case 'rock': 
      return Color.fromARGB(255, 99, 99, 99);
    case 'fairy':
      return Color.fromARGB(255, 255, 175, 220);
    case 'normal':
      return Color.fromARGB(255, 193, 193, 193);
    case 'ice':
      return Color.fromARGB(255, 111, 224, 255);
    case 'fighting':
      return Color.fromARGB(255, 185, 65, 65);
    case 'flying':
      return Color.fromRGBO(134, 132, 106, 1);
    case 'dragon':
      return Color.fromARGB(255, 176, 123, 195);
    case 'steel':
      return Color.fromARGB(255, 152, 183, 185);
    default:
      return Colors.grey;
  }
}

Color lightenColor(Color color, [double amount = 0.3]) {
  return Color.lerp(color, Colors.white, amount)!;
}

Color darkenColor(Color color, [double amount = 0.08]) {
  return Color.lerp(color, Colors.black, amount)!;
}