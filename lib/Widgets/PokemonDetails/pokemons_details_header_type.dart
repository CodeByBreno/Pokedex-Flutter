import 'package:flutter/material.dart';
import 'package:my_first_app/auxiliary.dart';

class PokemonDetailsHeaderType extends StatelessWidget {
  final String type;

  PokemonDetailsHeaderType({
    required this.type
  });

  @override
  Widget build(BuildContext context) {
    return 
      Container(
        decoration: BoxDecoration(
          color: darkenColor(getColorFromType(type)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: 
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
              bottom: 5,
              left: 20,
              right: 20,
            ),
            child: 
              Text(
                upperFirstLetter(type),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'MonoSans',
                )
              ),
          ),
      );
      
  }
}