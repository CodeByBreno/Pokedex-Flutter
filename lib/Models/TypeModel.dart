class TypeModel {
  final String idType;
  final String name;
  final String? imageUrl;

  TypeModel({
    required this.idType,
    required this.name,
    this.imageUrl
  });

  Map<String, dynamic> toMap() {
    return {
      'idType': idType,
      'name': name,
      'imgUrl': imageUrl 
    };
  }

  factory TypeModel.fromMap(Map<String, dynamic> map) {
    return TypeModel(
      idType: map['idType'], 
      name: map['name'],
      imageUrl: map['imageUrl']);
  }
}