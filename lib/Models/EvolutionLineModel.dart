class EvolutionLineTable {  
  final String idEvolutionLineTable;

  EvolutionLineTable({
    required this.idEvolutionLineTable,
  });

  Map<String, dynamic> toMap() {
    return {
      'idEvolutionLine': idEvolutionLineTable,
    };
  }

  factory EvolutionLineTable.fromMap(Map<String, dynamic> map) {
    return EvolutionLineTable(
      idEvolutionLineTable: map['idEvolutionLineTable'],);
  }
}