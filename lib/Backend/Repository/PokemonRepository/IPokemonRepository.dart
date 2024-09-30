import 'package:my_first_app/Backend/Models/PokemonModel.dart';

abstract class IPokemonRepository {
  Future<void> init();
  PokemonModel create(
    String name,
    String url,
    String? imageUrl,
    String? imageDefault,
    double? height,
    double? weight,
    int? generation,
    List<String>? types
  );
  Future<int> save(PokemonModel pokemon);
  Future<int> update(PokemonModel pokemon);
  Future<PokemonModel?> findById(String id);
  Future<List<PokemonModel>> findByName(String name);
  Future<List<PokemonModel>> findFavorites();
  Future<bool> delete(String id);
}