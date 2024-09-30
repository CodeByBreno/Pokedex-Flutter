class EvolutionLineModel {  
  final String idEvolutionLine;
  
  static const String table = 'evolutionLine';

  EvolutionLineModel({
    required this.idEvolutionLine,
  });

  Map<String, dynamic> toMap() {
    return {
      'idEvolutionLine': idEvolutionLine,
    };
  }

  factory EvolutionLineModel.fromMap(Map<String, dynamic> map) {
    return EvolutionLineModel(
      idEvolutionLine: map['idEvolutionLineTable'],);
  }
}