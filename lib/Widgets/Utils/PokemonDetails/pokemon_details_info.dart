import 'package:flutter/material.dart';
import 'package:my_first_app/recepters.dart';

class PokemonDetailsInfo extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetailsInfo({
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return 
      Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: 
            Container(
              width: double.infinity,
              height: 400,
              color: Colors.white,
              child: 
                const Padding(
                  padding: EdgeInsets.only(
                    top: 50,
                    left: 20,
                    right: 20,
                    bottom: 10,
                  ),
                  child: Text('INFORMAÇÕES'),
                ),
              ),
          )
      );
  }
}