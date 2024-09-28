class PokemonEvolutionLineModel {
  final String idPokemonEvolutionLineModel;
  final String pokemonId;
  final String evolutionLineId;
  final int position;

  PokemonEvolutionLineModel({
    required this.idPokemonEvolutionLineModel,
    required this.pokemonId,
    required this.evolutionLineId,
    required this.position
  });

  Map<String, dynamic> toMap() {
    return {
      'idPokemonEvolutionLineModel': idPokemonEvolutionLineModel,
      'pokemonId': pokemonId,
      'evolutionLineId': evolutionLineId,
      'position': position,
    };
  }

  factory PokemonEvolutionLineModel.fromMap(Map<String, dynamic> map) {
    return PokemonEvolutionLineModel(
      idPokemonEvolutionLineModel: map['idPokemonEvolutionLineModel'],
      pokemonId: map['pokemonId'],
      evolutionLineId: map['evolutionLineId'],
      position: map['position'],
      );
  }
}