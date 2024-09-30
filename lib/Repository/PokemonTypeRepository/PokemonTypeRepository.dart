import 'package:uuid/uuid.dart';
import 'package:sqflite/sqflite.dart';
import 'package:my_first_app/Models/PokemonTypeModel.dart';
import 'package:my_first_app/Database/database_helper.dart';
import 'package:my_first_app/Repository/PokemonTypeRepository/IPokemonTypeRepository.dart';

class PokemonTypeRepository extends IPokemonTypeRepository {
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
  PokemonTypeModel create(
    String pokemonId,
    String typeId
  ) {
    var data = PokemonTypeModel(
      idPokemonType: Uuid().v4(), 
      pokemonId: pokemonId, 
      typeId: typeId);

    return data;
  }

  @override
  Future<int> save(PokemonTypeModel pokemonType) async {
    final index = await _db!.insert('pokemonType', pokemonType.toMap());

    return index;
  }

  @override
  Future<int> update(PokemonTypeModel pokemonType) async {
    final index = await _db!.update(
      PokemonTypeModel.table,
      pokemonType.toMap(),
      where: 'idPokemonType = ?',
      whereArgs: [pokemonType.idPokemonType]);

    return index;
  }

  @override
  Future<PokemonTypeModel?> findById(String id) async {
    final pokemonType = await _db!.query(
      PokemonTypeModel.table,
      where: 'idPokemonType = ?',
      whereArgs: [id]
    );

    if (pokemonType.isEmpty) return null;

    return PokemonTypeModel.fromMap(pokemonType.first);
  }

  @override
  Future<bool> delete(String id) async {
    final result = await _db!.delete(
      PokemonTypeModel.table,
      where: 'idPokemonType = ?',
      whereArgs: [id]
    );

    return result > 0;
  }
}