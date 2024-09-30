import 'package:my_first_app/Models/PokemonTypeModel.dart';

abstract class IPokemonTypeRepository{
  Future<void> init();
  PokemonTypeModel create(
    String pokemonId,
    String typeId
  );
  Future<int> save(PokemonTypeModel pokemonType);
  Future<int> update(PokemonTypeModel pokemonType);
  Future<PokemonTypeModel?> findById(String id);
  Future<bool> delete(String id);
}