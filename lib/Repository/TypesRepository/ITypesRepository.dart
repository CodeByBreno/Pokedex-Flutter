import 'package:my_first_app/Models/TypeModel.dart';

abstract class ITypesRepository {
  Future<void> init();
  TypeModel create(
    String name,
    String? imageUrl
  );
  Future<int> save(TypeModel type);
  Future<int> update(TypeModel type);
  Future<TypeModel?> findById(String id);
  Future<List<TypeModel>> getTypeByName(String name);
  Future<bool> containsTypeByName(String name);
  Future<bool> delete(String id);
}