import 'package:flutter/material.dart';
import 'package:my_first_app/auxiliary.dart';
import 'package:my_first_app/recepters.dart';
import 'package:my_first_app/Widgets/Utils/pokeball_background.dart';
import 'package:my_first_app/Widgets/PokemonDetails/pokemon_details_info.dart';
import 'package:my_first_app/Widgets/PokemonDetails/pokemons_details_image.dart';
import 'package:my_first_app/Widgets/PokemonDetails/pokemon_details_control_bar.dart';
import 'package:my_first_app/Widgets/PokemonDetails/pokemons_details_header_padding.dart';

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
                PokeballBackground(color: getColorFromType(pokemon.types[0]), top: 270, left: 220, dimension: 200),
                PokemonDetailsHeaderPadding(name: pokemon.name, types: pokemon.types, id: pokemon.id),
                PokemonDetailsInfo(pokemon: pokemon),
                const ControlBarPokemonDetails(top: 60,),
                PokemonDetailsImage(imageUrl: pokemon.imageUrl)
              ],
            ),
        ),
    );
  }
}