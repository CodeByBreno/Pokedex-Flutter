import 'package:flutter/material.dart';
import 'package:my_first_app/auxiliary.dart';
import 'package:my_first_app/recepters.dart';
import 'package:my_first_app/Widgets/pokemon_image.dart';
import 'package:my_first_app/Widgets/pokemon_description.dart';

class PokemonCard extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonCard({
    Key? key,
    required this.pokemon,
  }): super(key: key);

  @override
  PokemonCardState createState() => PokemonCardState();
}

class PokemonCardState extends State<PokemonCard> {
  @override
  Widget build(BuildContext context) {
    final pokemon = widget.pokemon;
    
    return Card(
          color: getColorFromType(pokemon.types[0]),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
                const SizedBox(height: 5.0),
                Flexible( child: PokemonImage(imageUrl: pokemon.imageUrl)),
                const SizedBox(height: 4.0),
                PokemonDescription(name: pokemon.name, id: pokemon.id),
              ],
            ),
          ),
    );
  }
}