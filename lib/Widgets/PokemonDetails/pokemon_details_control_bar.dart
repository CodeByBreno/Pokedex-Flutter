import 'package:flutter/material.dart';

class ControlBarPokemonDetails extends StatelessWidget {
  final double? top;

  const ControlBarPokemonDetails(
    {
      super.key, 
      this.top,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      child: Column(
        children: [
          const SizedBox(height: 5),
          Padding(
              padding: const EdgeInsets.only(left: 5),
              child: 
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, 
                      child: 
                        const Icon(
                          Icons.arrow_back, 
                          color: Colors.white,
                          size: 40,),
                          )
                  ],
              ),
            )
        ]
      )
    );
  }
}