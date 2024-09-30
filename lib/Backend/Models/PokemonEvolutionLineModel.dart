class PokemonEvolutionLineModel {
  final String idPokemonEvolutionLine;
  final String pokemonId;
  final String evolutionLineId;
  final int position;

  static const String table = 'pokemonEvolutionLine';

  PokemonEvolutionLineModel({
    required this.idPokemonEvolutionLine,
    required this.pokemonId,
    required this.evolutionLineId,
    required this.position
  });

  Map<String, dynamic> toMap() {
    return {
      'idPokemonEvolutionLineModel': idPokemonEvolutionLine,
      'pokemonId': pokemonId,
      'evolutionLineId': evolutionLineId,
      'position': position,
    };
  }

  factory PokemonEvolutionLineModel.fromMap(Map<String, dynamic> map) {
    return PokemonEvolutionLineModel(
      idPokemonEvolutionLine: map['idPokemonEvolutionLineModel'],
      pokemonId: map['pokemonId'],
      evolutionLineId: map['evolutionLineId'],
      position: map['position'],
      );
  }
}