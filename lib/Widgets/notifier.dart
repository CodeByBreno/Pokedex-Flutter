import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_app/Widgets/recepters.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });

    try {
      final url = Uri.parse('https://pokeapi.co/api/v2/pokemon');
      final response = await http.get(url);

      print(response);

      var jsonResponse = json.decode(response.body);
      _pokemons = PokemonList.fromJson(jsonResponse);

    } catch(e) {
      _error = 'Error: ${e}';

    } finally {
      _isLoading = false;
    }
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
  }
}