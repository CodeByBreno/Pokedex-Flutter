import 'package:flutter/material.dart';
import 'package:my_first_app/auxiliary.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PokemonCard extends StatefulWidget {
  final String name;
  final String imageUrl;
  final int index;

  const PokemonCard({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.index,
  }): super(key: key);

  @override
  _PokemonCardState createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  @override
  Widget build(BuildContext context) {
    
    return Card(
          color: Color.fromARGB(255, 224, 255, 242),
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
                const SizedBox(height: 5.0),
                Flexible(
                  child: CachedNetworkImage(
                    imageUrl: widget.imageUrl != '' ? widget.imageUrl : 'https://jangada.ag/wp-content/uploads/2017/04/jangada-v2-baby-do-brasil-7-capa-quadrada.jpg',
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    fit: BoxFit.cover)
                ),
                const SizedBox(height: 4.0),
                Text(
                  upperFirstLetter(widget.name),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )
                  ),
                Text(
                  padronizeNumberFormat(widget.index),
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    )
                ),
              ],
            ),
          ),
    );
  }
}