import 'package:flutter/material.dart';
import 'package:my_first_app/home.dart';
import 'package:my_first_app/Widgets/PokemonDetails/pokemon_details.dart';

dynamic routes(BuildContext context) {
  return(
    {
      '/': (context) => HomeScreen(),
      '/details': (context) => PokemonDetails(),
    }
  );
}

class myRoutes{
  static const String home = '/';
  static const String details = '/details';
}