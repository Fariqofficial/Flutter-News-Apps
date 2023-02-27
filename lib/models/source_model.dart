class SourceModel {
  final String? id;
  final String? name;

  SourceModel({
    this.id,
    this.name,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        id: json['id'],
        name: json['name'],
      );
}
