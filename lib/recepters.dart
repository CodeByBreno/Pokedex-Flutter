class PokemonList {
  List<Pokemon> results;
  final int length;

  PokemonList({ required this.results, required this.length });

  factory PokemonList.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<Pokemon> pokemonList = list.map((i) => Pokemon.fromJson(i)).toList();
    return PokemonList(results: pokemonList, length: pokemonList.length);
  }
}

class Pokemon {
  final String name;
  final String url;
  String? _imageUrl;

  Pokemon({ 
    required this.name, 
    required this.url,
  });

  String get imageUrl => _imageUrl ?? '';

  set imageUrl(String imageUrl) {
    _imageUrl = imageUrl;
  }
  
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(name: json['name'], url: json['url']);
  }

}