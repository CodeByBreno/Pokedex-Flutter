import 'package:flutter/material.dart';
import 'package:my_first_app/Widgets/Utils/title.dart';
import 'package:my_first_app/Widgets/pokemon_grid.dart';
import 'package:my_first_app/Widgets/Utils/input_text.dart';
import 'package:my_first_app/Widgets/Utils/page_counter.dart';
import 'package:my_first_app/Widgets/Utils/pokeball_background.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 248, 255),
        body: 
        Stack( 
          children: [
            const PokeballBackground(
                  color: Color.fromARGB(100, 214, 214, 214),
                  top: -40,
                  left: 230,
                  dimension: 270,),
            Container(
                padding: const EdgeInsets.only(
                  left: 20, 
                  top: 80, 
                  right: 20, 
                  bottom: 5
                  ),
                child: 
                  Column(
                    children: [
                      MyTitle(),
                      const InputText(input: 'Pesquise pelo nome do pokemon'),
                      const SizedBox(height: 10,),
                      const Expanded(child: 
                        PokemonGrid()),
                      PageCounter(),
                    ]
                  ),
              ),
            ],
        ),
    );
  }
}