import 'package:uuid/uuid.dart';
import 'package:sqflite/sqflite.dart';
import 'package:my_first_app/Models/PokemonModel.dart';
import 'package:my_first_app/Database/database_helper.dart';

class PokemonRepository {
  Database? _db;

  Future<void> init() async {
    _db = await DatabaseHelper().database;
  }

  Future<PokemonModel> create(
    String name,
    String url,
    String? imageUrl,
    String? imageDefault,
    double? height,
    double? weight,
    int? generation 
  ) async {
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
}