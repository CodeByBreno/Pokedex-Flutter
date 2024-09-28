class PokemonTypeModel {
  final String idPokemonType;
  final String pokemonId;
  final String typeId;

  PokemonTypeModel({
    required this.idPokemonType,
    required this.pokemonId,
    required this.typeId
  });

  Map<String, dynamic> toMap(){
    return {
      'idPokemonType': idPokemonType,
      'pokemonId': pokemonId,
      'typeId': typeId
    };
  }

  factory PokemonTypeModel.fromMap(Map<String, dynamic> map){
    return PokemonTypeModel(
      idPokemonType: map['idPokemonType'],
      pokemonId: map['pokemonId'],
      typeId: map['typeId']
    );
  }
}