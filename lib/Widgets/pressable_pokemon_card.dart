import 'package:flutter/material.dart';
import 'package:my_first_app/recepters.dart';
import 'package:my_first_app/Widgets/pokemon_card.dart';

class PressablePokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  PressablePokemonCard({
    required this.pokemon
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => Text('teste')),
          );
      },
      child: PokemonCard(pokemon: pokemon),
    );
  }
}