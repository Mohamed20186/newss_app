class SourceModel {
  final String status;
  final List<Source> sources;

  SourceModel({required this.status, required this.sources});

  factory SourceModel.fromJson({required Map<String, dynamic> json}) {
    return SourceModel(
        status: json['status'],
        sources: (json['sources'] as List)
            .map((element) => Source.fromJson(json: element))
            .toList());
  }
}

class Source {
  final String id;
  final String name;

  Source({required this.id, required this.name});

  factory Source.fromJson({required Map<String, dynamic> json}) {
    return Source(id: json['id'], name: json['name']);
  }
}
