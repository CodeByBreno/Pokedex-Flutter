import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PokemonImage extends StatelessWidget {
  final String imageUrl;

  PokemonImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => Image.asset('assets/images/sem_imagem.png'),
            fit: BoxFit.cover);
  }
}