import 'dart:ffi';
import 'package:sqflite/sqflite.dart';
import 'package:my_first_app/Models/TypeModel.dart';
import 'package:my_first_app/Database/database_helper.dart';

class TypesRepository {
  Database? _db;

  Future<void> init() async {
    _db = await DatabaseHelper().database;
  }

  void _ensureInicialized() {
    if (_db == null) {
      throw Exception('Database not initialized. Call init() first');
    }
  }

  Future<TypeModel> getTypeByName(String name) async {
    _ensureInicialized();

    List<Map<String, dynamic>> result = await _db!.query(
      'type',
      where: 'name = ?',
      whereArgs: [name],
    );

    return TypeModel.fromMap(result.first);
  }

  Future<bool> containsTypeByName(String name) async {
    _ensureInicialized();

    List<Map<String, dynamic>> result = await _db!.query(
      'type',
      where: 'name = ?',
      whereArgs: [name],
      limit: 1,
    );

    return result.isNotEmpty;
  }
}