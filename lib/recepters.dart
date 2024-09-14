class PokemonList {
  List<Pokemon> results;
  final int length;

  PokemonList({ required this.results, required this.length });

  factory PokemonList.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<Pokemon> pokemonList = list.map(
      (i) => Pokemon.fromJson(i)).toList();
    return PokemonList(results: pokemonList, length: pokemonList.length);
  }
}

class Pokemon {
  int? _id;
  final String name;
  final String url;
  String? _imageUrl;
  String? _imageFrontDefault;
  List<String> _types = [];
  double? _height;
  double? _weight;
  int? _generation;

  Pokemon({ 
    required this.name, 
    required this.url,
  });

  int get id => _id ?? -1;
  String get imageUrl => _imageUrl ?? '';
  String get imageFrontDefault => _imageFrontDefault ?? '';
  List<String> get types => _types;
  double get height => _height ?? 0;
  double get weight => _weight ?? 0;
  int get generation => _generation ?? -1;

  set id(int id) {
    _id = id;
  }

  set imageUrl(String imageUrl) {
    _imageUrl = imageUrl;
  }

  set imageFrontDefault(String imageFrontDefault) {
    _imageFrontDefault = imageFrontDefault;
  }

  set types(List<String> types) {
    _types = [];
    _types.addAll(types);
  }

  set height(double height) {
    _height = height;
  }

  set weight(double weight) {
    _weight = weight;
  }

  set generation(int generation) {
    _generation = generation;
  }
  
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(name: json['name'], url: json['url']);
  }
}