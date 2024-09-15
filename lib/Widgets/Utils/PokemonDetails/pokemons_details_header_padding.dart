import 'package:flutter/material.dart';
import 'package:my_first_app/Widgets/Utils/PokemonDetails/pokemons_details_header.dart';

class PokemonDetailsHeaderPadding extends StatelessWidget{
  final String name;
  final List<String> types;
  final int id;

  const PokemonDetailsHeaderPadding({
    super.key, 
    required this.name,
    required this.types,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return 
      Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 100),
            PokemonsDetaisHeader(name: name, types: types, id: id),
            const SizedBox(height: 50),
            ]
          ),
      );
  }
}