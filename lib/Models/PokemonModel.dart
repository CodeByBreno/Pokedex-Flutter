class PokemonModel {
  final String idPokemon;
  final String name;
  final String url;
  final String? imageUrl;
  final String? imageDefault;
  final double? height;
  final double? weight;
  final int? generation;
  final bool? favorite;

  static const String table = 'pokemon';

  PokemonModel({
    required this.idPokemon,
    required this.name,
    required this.url,
    this.imageUrl,
    this.imageDefault,
    this.height,
    this.weight,
    this.generation,
    this.favorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'idPokemon': idPokemon,
      'name': name,
      'url': url,
      'image_url': imageUrl,
      'image_default': imageDefault,
      'height': height,
      'weight': weight,
      'generation': generation,
      'favorite': favorite
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      idPokemon: map['idPokemon'],
      name: map['name'],
      url: map['url'],
      imageUrl: map['imageUrl'],
      imageDefault: map['imageDefault'],
      height: map['height'],
      weight: map['weight'],
      generation: map['generation'],
      favorite: map['favorite']
    );
  }
}