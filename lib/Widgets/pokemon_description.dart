import 'package:flutter/material.dart';
import 'package:my_first_app/auxiliary.dart';

class PokemonDescription extends StatelessWidget {
  final String name;
  final int id;

  PokemonDescription({
      required this.name,
      required this.id
    }
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          upperFirstLetter(name),
          style: const TextStyle(
              fontFamily: 'MonoSans',
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16,
            )
          ),
        Text(
          '#${padronizeNumberFormat(id)}',
          style: const TextStyle(
              fontFamily: 'MonoSans',
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 15,
            )
          ),
      ],
    );
  }
}