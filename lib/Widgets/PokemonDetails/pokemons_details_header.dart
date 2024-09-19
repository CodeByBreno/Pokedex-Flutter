import 'package:flutter/material.dart';
import 'package:my_first_app/auxiliary.dart';
import 'package:my_first_app/Widgets/PokemonDetails/pokemons_details_header_type.dart';

class PokemonsDetaisHeader extends StatelessWidget{
  final String name;
  final List<String> types;
  final int id;

  PokemonsDetaisHeader({
    required this.name,
    required this.types,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              upperFirstLetter(name),
              style: const TextStyle(
                fontFamily: 'MonoSans',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                ),
            ),
            Row (
              children: 
                types.map((type) => [
                          PokemonDetailsHeaderType(type: type),
                          const SizedBox(width: 5),
                          ])
                      .expand((widgetList) => widgetList)
                      .toList(),
            ),
          ],
        ),
        Text(
          '#${padronizeNumberFormat(id)}',
          style: const TextStyle(
            fontFamily: 'MonoSans',
            fontSize: 18,
            color: Colors.white,
          ),
        )
      ],);
  }
}