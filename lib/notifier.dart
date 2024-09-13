import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_app/main.dart';
import 'package:my_first_app/recepters.dart';

class PageNotifier extends ChangeNotifier {
  int _currentPage = 0;
  PokemonList? _pokemons;
  bool _isLoading = false;
  String _error = '';


  int get currentPage => _currentPage;
  PokemonList? get pokemons => _pokemons;
  bool get isLoading => _isLoading;
  String get error => _error;

  void setPage(int page) {
    if (_currentPage != page) {
      _currentPage = page;
      fetchData();
    }
  }

  void cleanPokemons() {
    _pokemons = PokemonList(results: [], length: 0);
    notifyListeners();
  }

  Future<void> fetchData() async {
    if (_isLoading) return;

    _isLoading = true;
    cleanPokemons();
    notifyListeners();

    _pokemons = await getNewPokemons(currentPage * ITEMS_PER_PAGE);
   
    _isLoading = false;
    notifyListeners(); 
  }

  Future<PokemonList> getNewPokemons(int startGetPokemons, {int? amount = 15}) async {
    try {
      final url = Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=$amount&offset=$startGetPokemons');
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception('Erro no GET da listagem');
      }

      var jsonResponse = json.decode(response.body);
      PokemonList pokemons = PokemonList.fromJson(jsonResponse);

      final jsonDataList = await Future.wait(
        pokemons.results.map((pokemon) {
          return http.get(Uri.parse(pokemon.url));
        }).toList(),
      );

      if (jsonDataList.any((response) => response.statusCode != 200)) {
        throw Exception('Erro na requisição de dados específicos de algum pokemon');
      }

      final List<Map<String, dynamic>> datalist = jsonDataList
          .map((e) => jsonDecode(e.body) as Map<String, dynamic>)
          .toList();

      for (int i = 0; i < pokemons.length; i++) {
        pokemons.results[i].imageUrl = datalist[i]['sprites']['other']['official-artwork']['front_default'] ?? '';
      }

      return pokemons;
    } catch (e) {
      debugPrint('Erro ao obter pokémons: $e');
      rethrow; // Propaga o erro para ser tratado no nível superior
    }
  }
}

