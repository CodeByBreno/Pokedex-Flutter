import 'package:uuid/uuid.dart';
import 'package:sqflite/sqflite.dart';
import 'package:my_first_app/Models/TypeModel.dart';
import 'package:my_first_app/Database/database_helper.dart';
import 'package:my_first_app/Repository/TypesRepository/ITypesRepository.dart';

class TypesRepository implements ITypesRepository {
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
  TypeModel create(
    String name,
    String? imageUrl
  ) {
    var data = TypeModel(
      idType: const Uuid().v4(), 
      name: name,
      imageUrl: imageUrl);

    return data;
  }

  @override
  Future<int> save(TypeModel type) async {
    final index = await _db!.insert(TypeModel.table, type.toMap());

    return index;
  }

  @override
  Future<int> update(TypeModel type) async {
    final index = await _db!.update(
      TypeModel.table, 
      type.toMap(),
      where: 'idType = ?',
      whereArgs: [type.idType]);

    return index;
  }

  @override
  Future<TypeModel?> findById(String id) async {
    final type = await _db!.query(
      TypeModel.table,
      where: 'idType = ?',
      whereArgs: [id]
    );

    if (type.isEmpty) return null;

    return TypeModel.fromMap(type.first);
  }

  @override
  Future<List<TypeModel>> getTypeByName(String name) async {
    List<Map<String, dynamic>> types = await _db!.query(
      TypeModel.table,
      where: 'name LIKE ?',
      whereArgs: ['%$name%'],
    );

    return types.map((t) => TypeModel.fromMap(t)).toList();
  }

  @override
  Future<bool> containsTypeByName(String name) async {
    List<Map<String, dynamic>> result = await _db!.query(
      TypeModel.table,
      where: 'name = ?',
      whereArgs: [name],
      limit: 1,
    );

    return result.isNotEmpty;
  }

  @override
  Future<bool> delete(String id) async {
    final result = await _db!.delete(
      TypeModel.table,
      where: 'idType = ?',
      whereArgs: [id]
    );

    return result > 0;
  }
}