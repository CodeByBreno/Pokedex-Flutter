const pokemonTable = 
''' 
    CREATE TABLE pokemon (
      idPokemon TEXT UNIQUE PRIMARY KEY,
      name TEXT NOT NULL,
      url TEXT NOT NULL,
      imageUrl TEXT,
      imageDefault TEXT,
      height REAL,
      weight REAL,
      generation INT ,
      favorite BOOL
    );
''';

const typeTable = 
'''
  CREATE TABLE type (
      idType TEXT UNIQUE PRIMARY KEY,
      name TEXT UNIQUE NOT NULL,
      imageUrl TEXT
    );
''';

const evolutionLineTable =
'''
  CREATE TABLE evolutionLine (
    idEvolutionLine TEXT UNIQUE PRIMARY KEY
  );
''';

const pokemonTypeTable = 
'''
  CREATE TABLE pokemonType (
    idPokemonType TEXT UNIQUE PRIMARY KEY,
    pokemonId TEXT NOT NULL,
    typeId TEXT NOT NULL,
    FOREIGN KEY (pokemonId) REFERENCES pokemon(pokemonId),
    FOREIGN KEY (typeId) REFERENCES type(typeId)
  );
''';

const pokemonEvolutionLineTable =
'''
  CREATE TABLE pokemonEvolutionLine(
    idPokemonEvolutionLine TEXT UNIQUE PRIMARY KEY,
    position INT NOT NULL,
    pokemonId TEXT NOT NULL,
    evolutionLineId TEXT NOT NULL,
    FOREIGN KEY (pokemonId) REFERENCES pokemon(pokemonId),
    FOREIGN KEY (evolutionLineId) REFERENCES evolutionLine(evolutionLineId)
  );
''';

const dropAll = 
'''
  DROP TABLE pokemon;
  DROP TABLE type;
  DROP TABLE evolutionLine;
  DROP TABLE pokemonType;
  DROP TABLE pokemonEvolutionLine;
''';