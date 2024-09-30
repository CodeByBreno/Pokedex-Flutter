import 'package:uuid/uuid.dart';
import 'package:sqflite/sqflite.dart';
import 'package:my_first_app/Database/database_helper.dart';
import 'package:my_first_app/Models/EvolutionLineModel.dart';
import 'package:my_first_app/Repository/EvolutionLineRepository/IEvolutionLineRepository.dart';

class EvolutionLineRepository implements IEvolutionLineRepository{
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
  EvolutionLineModel create() {
    var data = EvolutionLineModel(
      idEvolutionLine: const Uuid().v4(),
    );

    return data;
  }

  @override
  Future<int> save(EvolutionLineModel data) async {
    final index = await _db!.insert(
      EvolutionLineModel.table, 
      data.toMap());

    return index;
  }
  
  @override
  Future<int> update(EvolutionLineModel data) async {
    final index = await _db!.update(
      EvolutionLineModel.table, 
      data.toMap(),
      where: 'idEvolutionLine = ?',
      whereArgs: [data.idEvolutionLine]);

    return index;
  }

  @override
  Future<EvolutionLineModel?> findById(String id) async {
    final data = await _db!.query(
      EvolutionLineModel.table,
      where: 'idEvolutionLine = ?',
      whereArgs: [id]
    );

    if (data.isEmpty) return null;

    return EvolutionLineModel.fromMap(data.first);
  }

  @override
  Future<bool> delete(String id) async {
    final data = await _db!.delete(
      EvolutionLineModel.table,
      where: 'idEvolutionLine = ?',
      whereArgs: [id]
    );

    return data > 0;
  }
}