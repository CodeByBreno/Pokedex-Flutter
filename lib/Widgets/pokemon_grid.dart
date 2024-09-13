import 'package:flutter/material.dart';
import 'package:my_first_app/main.dart';
import 'package:provider/provider.dart';
import 'package:my_first_app/notifier.dart';
import 'package:my_first_app/recepters.dart';
import 'package:my_first_app/Widgets/pokemon_card.dart';

class PokemonGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageNotifier = Provider.of<PageNotifier>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (pageNotifier.pokemons == null) {
        pageNotifier.fetchData();
      }
    });

    if (pageNotifier.error.isNotEmpty) {
      return Center(child: Text(pageNotifier.error));
    }

    if (pageNotifier.pokemons == null) {
      return const Center(child: Text('No data found'));
    }

    List<Pokemon> _pokemons = pageNotifier.pokemons!.results;

    return PageView.builder(
      onPageChanged: (pageIndex) {
        pageNotifier.setPage(pageIndex); 
      },
      itemCount: 200,
      itemBuilder: (context, pageIndex) {
        return GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3/4,
          children: List.generate(
            _pokemons.length, 
            (index) {
              int pokemonNumber = pageIndex * ITEMS_PER_PAGE + index;
              return PokemonCard(
                name: _pokemons[index].name,
                imageUrl: _pokemons[index].imageUrl,
                index: pageNotifier.currentPage * ITEMS_PER_PAGE + index
              );
            })
        );
      },
    );
  }
}
