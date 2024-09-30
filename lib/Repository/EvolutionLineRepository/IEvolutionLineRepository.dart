import 'package:my_first_app/Models/EvolutionLineModel.dart';

abstract class IEvolutionLineRepository {
  Future<void> init();
  EvolutionLineModel create();
  Future<int> save(EvolutionLineModel type);
  Future<int> update(EvolutionLineModel type);
  Future<EvolutionLineModel?> findById(String id);
  Future<bool> delete(String id);
}