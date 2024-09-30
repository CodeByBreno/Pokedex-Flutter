import 'package:uuid/uuid.dart';
import 'package:sqflite/sqflite.dart';
import 'package:my_first_app/Backend/Database/database_helper.dart';
import 'package:my_first_app/Backend/Models/PokemonEvolutionLineModel.dart';
import 'package:my_first_app/Backend/Repository/PokemonEvolutionLineRepository/IPokemonEvolutionLineRepository.dart';

class PokemonEvolutionLineRepository implements IPokemonEvolutionLineRepository
{
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
  PokemonEvolutionLineModel create(
    String pokemonId,
    String evolutionLineId,
    int position
  ) {
    var data = PokemonEvolutionLineModel(
      idPokemonEvolutionLine: const Uuid().v4(), 
      pokemonId: pokemonId, 
      evolutionLineId: evolutionLineId, 
      position: position);

    return data;
  }

  @override
  Future<int> save(PokemonEvolutionLineModel data) async {
    final index = await _db!.insert(
      PokemonEvolutionLineModel.table, 
      data.toMap());

    return index;
  }

  @override
  Future<int> update(PokemonEvolutionLineModel data) async {
    final index = await _db!.update(
      PokemonEvolutionLineModel.table, 
      data.toMap(),
      where: 'idPokemonEvolutionLine = ?',
      whereArgs: [data.idPokemonEvolutionLine]);

    return index;
  }
  
  @override
  Future<PokemonEvolutionLineModel?> findById(String id) async {
    final data = await _db!.query(
      PokemonEvolutionLineModel.table,
      where: 'idPokemonEvolutionLine = ?',
      whereArgs: [id]
    );

    if (data.isEmpty) return null;

    return PokemonEvolutionLineModel.fromMap(data.first);
  }

  @override
  Future<List<PokemonEvolutionLineModel>?> findByPokemonId(String id) async {
    final data = await _db!.query(
      PokemonEvolutionLineModel.table,
      where: 'pokemonId = ?',
      whereArgs: [id]
    );

    if (data.isEmpty) return null;

    return data.map((each) => PokemonEvolutionLineModel.fromMap(each)).toList();
  }

  @override
  Future<bool> delete(String id) async {
    final data = await _db!.delete(
      PokemonEvolutionLineModel.table,
      where: 'idPokemonEvolutionLine = ?',
      whereArgs: [id]
    );

    return data > 0;
  }
}