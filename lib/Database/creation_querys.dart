const pokemonTable = 
''' 
    CREATE TABLE pokemon (
      id_pokemon TEXT UNIQUE PRIMARY KEY,
      name TEXT NOT NULL,
      url TEXT NOT NULL,
      image_url TEXT,
      image_default TEXT,
      height REAL,
      weight REAL,
      generation INT 
    );
''';

const typeTable = 
'''
  CREATE TABLE type (
      id_type TEXT UNIQUE PRIMARY KEY,
      name TEXT NOT NULL,
      image_url TEXT
    );
''';

const evolutionLineTable =
'''
  CREATE TABLE evolution_line (
    id_evolution_line TEXT UNIQUE PRIMARY KEY
  );
''';

const pokemonTypeTable = 
'''
  CREATE TABLE pokemon_type (
    id_pokemon_type TEXT UNIQUE PRIMARY KEY,
    pokemon_id TEXT NOT NULL,
    type_id TEXT NOT NULL,
    FOREIGN KEY (pokemon_id) REFERENCES pokemon(id_pokemon),
    FOREIGN KEY (type_id) REFERENCES type(id_type)
  );
''';

const pokemonEvolutionLineTable =
'''
  CREATE TABLE pokemon_evolution_line(
    id_pokemon_evolution_line TEXT UNIQUE PRIMARY KEY,
    position INT NOT NULL,
    pokemon_id TEXT NOT NULL,
    evolution_line_id TEXT NOT NULL,
    FOREIGN KEY (pokemon_id) REFERENCES pokemon(id_pokemon),
    FOREIGN KEY (evolution_line_id) REFERENCES evolution_line(id_evolution_line)
  );
''';

const dropAll = 
'''
  DROP TABLE pokemon;
  DROP TABLE type;
  DROP TABLE evolution_line;
  DROP TABLE pokemon_type;
  DROP TABLE pokemon_evolution_line;
''';