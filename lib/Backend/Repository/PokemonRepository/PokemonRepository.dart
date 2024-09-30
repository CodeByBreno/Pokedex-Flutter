import 'package:uuid/uuid.dart';
import 'package:sqflite/sqflite.dart';
import 'package:my_first_app/Backend/Models/PokemonModel.dart';
import 'package:my_first_app/Backend/Database/database_helper.dart';
import 'package:my_first_app/Backend/Repository/PokemonRepository/IPokemonRepository.dart';

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
    _ensureInicialized();
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
    final index = await _db!.insert(PokemonModel.table, pokemon.toMap());

    return index;
  }

  @override
  Future<int> update(PokemonModel pokemon) async {
    final index = await _db!.update(
      PokemonModel.table, 
      pokemon.toMap(),
      where: 'idPokemon = ?',
      whereArgs: [pokemon.idPokemon]);

    return index;
  }

  @override
  Future<PokemonModel?> findById(String id) async {
    final pokemon = await _db!.query(
      PokemonModel.table,
      where: 'idPokemon = ?',
      whereArgs: [id],
    );

    if(pokemon.isEmpty) return null;

    return PokemonModel.fromMap(pokemon.first);
  }

  @override
  Future<List<PokemonModel>> findByName(String name) async {
    final pokemons = await _db!.query(
      PokemonModel.table,
      where: 'name LIKE ?',
      whereArgs: ['%$name%'],
    );

    return pokemons.map((p) => PokemonModel.fromMap(p)).toList();
  }

  @override
  Future<List<PokemonModel>> findFavorites() async {
    final pokemons = await _db!.query(
      PokemonModel.table,
      where: 'favorite = 1',
    );

    return pokemons.map((p) => PokemonModel.fromMap(p)).toList();
  }

  @override
  Future<bool> delete(String id) async {
    final result = await _db!.delete(
      PokemonModel.table,
      where: 'idPokemon = ?',
      whereArgs: [id]
    );

    return result > 0;
  }
}