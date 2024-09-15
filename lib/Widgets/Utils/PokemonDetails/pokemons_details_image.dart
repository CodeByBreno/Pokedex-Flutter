import 'package:flutter/material.dart';
import 'package:my_first_app/Widgets/pokemon_image.dart';

class PokemonDetailsImage extends StatelessWidget {
  final String imageUrl;

  PokemonDetailsImage({
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return 
      Positioned(
        top: 270,
        right: 0,
        left: 0,
        child: Center(
          child: 
            SizedBox(
              height: 250,
              width: 250,
              child: PokemonImage(imageUrl: imageUrl),
            ),
        ),
      );
  }
}