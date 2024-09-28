import 'package:uuid/uuid.dart';
import 'package:sqflite/sqflite.dart';
import 'package:my_first_app/Models/PokemonModel.dart';
import 'package:my_first_app/Database/database_helper.dart';
import 'package:my_first_app/Repository/PokemonRepository/IPokemonRepository.dart';

class PokemonRepository implements IPokemonRepository{
  Database? _db;

    void _ensureInicialized() {
    if (_db == null) {
      throw Exception('Database not initialized. Call init() first');
    }
  }

  @override
  Future<void> init() async {
    _db = await DatabaseHelper().database;
  }

  @override
  PokemonModel create(
    String name,
    String url,
    String? imageUrl,
    String? imageDefault,
    double? height,
    double? weight,
    int? generation,
    List<String>? types
  ) {
    var data = 
      PokemonModel(
        idPokemon: const Uuid().v4(), 
        name: name,
        url: url,
        imageUrl: imageUrl,
        imageDefault: imageDefault,
        height: height,
        weight: weight,
        generation: generation,
      );

    return data;
  }

  @override
  Future<int> save(PokemonModel pokemon) async {
    _ensureInicialized();
  
    final index = await _db!.insert('pokemon', pokemon.toMap());

    return index;
  }

  @override
  Future<int> update(PokemonModel pokemon) async {
    _ensureInicialized();

    final index = await _db!.update(
      'pokemon', 
      pokemon.toMap(),
      where: 'id_pokemon = ?',
      whereArgs: [pokemon.idPokemon]);

    return index;
  }

  @override
  Future<PokemonModel?> findById(String id) async {
    _ensureInicialized();

    final pokemon = await _db!.query(
      'pokemon',
      where: 'id_pokemon = ?',
      whereArgs: [id],
    );

    if(pokemon.isEmpty) return null;

    return PokemonModel.fromMap(pokemon.first);
  }

  @override
  Future<List<PokemonModel>> findByName(String name) async {
    _ensureInicialized();

    final pokemons = await _db!.query(
      'pokemon',
      where: 'name LIKE ?',
      whereArgs: ['%$name%'],
    );

    return pokemons.map((p) => PokemonModel.fromMap(p)).toList();
  }

  @override
  Future<List<PokemonModel>> findFavorites() async {
    _ensureInicialized();

    final pokemons = await _db!.query(
      'pokemon',
      where: 'favorite = 1',
    );

    return pokemons.map((p) => PokemonModel.fromMap(p)).toList();
  }

  @override
  Future<bool> delete(String id) async {
    _ensureInicialized();

    final result = await _db!.delete(
      'pokemon',
      where: 'id_pokemon = ?',
      whereArgs: [id]
    );

    return result > 0;
  }
}