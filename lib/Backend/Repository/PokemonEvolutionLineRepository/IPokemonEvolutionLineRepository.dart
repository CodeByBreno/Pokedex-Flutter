import 'package:my_first_app/Backend/Models/PokemonEvolutionLineModel.dart';

abstract class IPokemonEvolutionLineRepository {
  Future<void> init();
  PokemonEvolutionLineModel create(
    String pokemonId,
    String evolutionLineId,
    int position
  );
  Future<int> save(PokemonEvolutionLineModel data);
  Future<int> update(PokemonEvolutionLineModel data);
  Future<PokemonEvolutionLineModel?> findById(String id);
  Future<List<PokemonEvolutionLineModel>?> findByPokemonId(String id);
  Future<bool> delete(String id);
}