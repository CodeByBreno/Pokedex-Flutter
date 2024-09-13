import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_app/recepters.dart';

class PageNotifier extends ChangeNotifier {
  int _currentPage = 0;
  String? _query;
  PokemonList? _pokemons;
  bool _isLoading = false;
  String _error = '';

  int get currentPage => _currentPage;
  String? get query => _query;
  PokemonList? get pokemons => _pokemons;
  bool get isLoading => _isLoading;
  String get error => _error;

  void setPage(int page) {
    if (_currentPage != page) {
      _currentPage = page;
      notifyListeners();
    }
  }

  Future<void> fetchData() async {
    _isLoading = true;
    safeNotify();

    try {
      final url = Uri.parse('https://pokeapi.co/api/v2/pokemon');
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception('Erro no GET da listagem');
      }

      var jsonResponse = json.decode(response.body);
      _pokemons = PokemonList.fromJson(jsonResponse);

      if (_pokemons == null){
        throw Exception('Erro na conversão do JSON recebido');
      }

      final pokemons = _pokemons!;

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

      for (int i = 0; i < pokemons.length; i++){
        pokemons.results[i].imageUrl = datalist[i]['sprites']['front_default'] ?? '';
      }

      safeNotify();
    } catch(e) {
      _error = 'Error: $e';

    } finally {
      _isLoading = false;
    }
  }

  void safeNotify() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}

