import 'package:get_it/get_it.dart';
import 'package:my_first_app/Backend/Repository/TypesRepository/TypesRepository.dart';
import 'package:my_first_app/Backend/Repository/TypesRepository/ITypesRepository.dart';
import 'package:my_first_app/Backend/Repository/PokemonRepository/PokemonRepository.dart';
import 'package:my_first_app/Backend/Repository/PokemonRepository/IPokemonRepository.dart';
import 'package:my_first_app/Backend/Repository/PokemonTypeRepository/PokemonTypeRepository.dart';
import 'package:my_first_app/Backend/Repository/PokemonTypeRepository/IPokemonTypeRepository.dart';
import 'package:my_first_app/Backend/Repository/EvolutionLineRepository/EvolutionLineRepository.dart';
import 'package:my_first_app/Backend/Repository/EvolutionLineRepository/IEvolutionLineRepository.dart';
import 'package:my_first_app/Backend/Repository/PokemonEvolutionLineRepository/PokemonEvolutionLineRepository.dart';
import 'package:my_first_app/Backend/Repository/PokemonEvolutionLineRepository/IPokemonEvolutionLineRepository.dart';

final getIt = GetIt.instance;

void setupDependencies(){
  getIt.registerLazySingleton<IPokemonRepository>(() => PokemonRepository());

  getIt.registerLazySingleton<ITypesRepository>(() => TypesRepository());

  getIt.registerLazySingleton<IPokemonTypeRepository>(() => PokemonTypeRepository());

  getIt.registerLazySingleton<IEvolutionLineRepository>(() => EvolutionLineRepository());

  getIt.registerLazySingleton<IPokemonEvolutionLineRepository>(() => PokemonEvolutionLineRepository());
}

Future<bool> initializeRepositories() async {
  try {
    
    await Future.wait([
      getIt<PokemonRepository>().init(),
      getIt<TypesRepository>().init(),
      getIt<PokemonTypeRepository>().init(),
      getIt<EvolutionLineRepository>().init(),
      getIt<PokemonEvolutionLineRepository>().init(),
    ]);

    return true;
  } catch(error){

    print(error);
    return false;
    
  }
}