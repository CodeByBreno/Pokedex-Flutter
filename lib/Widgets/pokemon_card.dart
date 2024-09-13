import 'package:flutter/material.dart';

class PokemonCard extends StatefulWidget {
  final String index;

  const PokemonCard({
    Key? key,
    required this.index
  }): super(key: key);

  @override
  _PokemonCardState createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
                Flexible(
                  child: Image.network('https://jangada.ag/wp-content/uploads/2017/04/jangada-v2-baby-do-brasil-7-capa-quadrada.jpg',
                  fit: BoxFit.cover)
                ),
                const SizedBox(height: 5.0),
                Text(
                  widget.index,
                  style: const TextStyle(
                      fontSize: 14,
                    )
                  ),
              ],
          ),
    );
  }
}