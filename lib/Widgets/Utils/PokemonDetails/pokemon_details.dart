import 'package:flutter/material.dart';
import 'package:my_first_app/auxiliary.dart';
import 'package:my_first_app/recepters.dart';
import 'package:my_first_app/Widgets/Utils/PokemonDetails/pokemon_details_info.dart';
import 'package:my_first_app/Widgets/Utils/PokemonDetails/pokemons_details_image.dart';
import 'package:my_first_app/Widgets/Utils/PokemonDetails/pokemons_details_header_padding.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final Pokemon pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;

    return Scaffold(
      body: 
        Container(
          color: getColorFromType(pokemon.types[0]),
          child: 
            Stack(
              children: [
                PokemonDetailsHeaderPadding(name: pokemon.name, types: pokemon.types, id: pokemon.id),
                PokemonDetailsInfo(pokemon: pokemon),
                PokemonDetailsImage(imageUrl: pokemon.imageUrl)
              ],
            ),
        ),
    );
  }
}