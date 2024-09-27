class PokemonModel {
  final String idPokemon;
  final String name;
  final String url;
  final String? imageUrl;
  final String? imageDefault;
  final double? height;
  final double? weight;
  final int? generation;


  PokemonModel({
    required this.idPokemon,
    required this.name,
    required this.url,
    this.imageUrl,
    this.imageDefault,
    this.height,
    this.weight,
    this.generation
  });

  Map<String, dynamic> toMap() {
    return {
      'id_pokemon': idPokemon,
      'name': name,
      'url': url,
      'image_url': imageUrl,
      'image_default': imageDefault,
      'height': height,
      'weight': weight,
      'generation': generation
    };
  }
}