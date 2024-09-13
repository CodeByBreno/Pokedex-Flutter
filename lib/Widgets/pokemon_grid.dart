import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_first_app/Widgets/notifier.dart';
import 'package:my_first_app/Widgets/recepters.dart';
import 'package:my_first_app/Widgets/auxiliary.dart';
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

    List<Pokemon> _pokemons = pageNotifier.pokemons?.results ?? [];

    List<String> _items = _pokemons.map((pokemon) => pokemon.name).toList();
    
    List<List<String>> pages = getPages(_items, itemsPerPage);

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
            children: pages[pageIndex].map( (item) {
                return PokemonCard(index: item);
            }).toList()
        );
      }
    );
  }
}