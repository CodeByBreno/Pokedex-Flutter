import 'Widgets/Utils/input_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_first_app/notifier.dart';
import 'package:my_first_app/Widgets/pokemon_grid.dart';
import 'package:my_first_app/Widgets/Utils/page_counter.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PageNotifier(),
      child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(
            left: 20, 
            top: 80, 
            right: 20, 
            bottom: 5
            ),
          child: Column(
            children: [
              InputText(input: 'Pesquise pelo nome do pokemon'),
              Expanded(child: 
                PokemonGrid()),
              PageCounter(),
            ]),
        ),
      ),
    );
  }
}