import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_first_app/notifier.dart';
import 'package:my_first_app/auxiliary.dart';
import 'package:my_first_app/recepters.dart';
import 'package:my_first_app/Widgets/pokemon_card.dart';

class PokemonGrid extends StatelessWidget {
  final int itemsPerPage = 15;
 
  @override
  Widget build(BuildContext context) {
    final pageNotifier = Provider.of<PageNotifier>(context);

    if (pageNotifier.pokemons == null) {
      pageNotifier.fetchData();
      return const Center(child: CircularProgressIndicator());
    }

    if (pageNotifier.pokemons == null) {
      throw Exception('Erro na listagem de pokemons');
    }

    List<Pokemon> _pokemons = pageNotifier.pokemons!.results;
    
    List<List<Pokemon>> pages = getPages(_pokemons, itemsPerPage);

    return PageView.builder(
      onPageChanged: (pageIndex) => {
        pageNotifier.setPage(pageIndex)
      },
      itemCount: pages.length,
      itemBuilder: (context, pageIndex) {
        return GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: pages[pageIndex].map( (pokemon) {
                return PokemonCard(
                  name: pokemon.name, 
                  imageUrl: pokemon.imageUrl);
            }).toList()
        );
      }
    );
  }
}