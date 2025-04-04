class Subject {
  final String _id;
  final String _name;
  final String _pictureUrl;

  String get id => _id;
  String get name => _name;
  String get pictureUrl => _pictureUrl;

  Subject({
    required String id,
    required String name,
    required String pictureUrl
  }) :
  _id = id,
  _name = name,
  _pictureUrl = pictureUrl;

  Subject copyWith({
    String? id,
    String? name,
    String? pictureUrl
  }) => 
  Subject(
    id: id ?? _id,
    name: name ?? _name,
    pictureUrl: pictureUrl ?? _pictureUrl
  );

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    pictureUrl: json['pictureUrl'] ?? ''
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['pictureUrl'] = _pictureUrl;
    return map;
  }

  @override
  bool operator ==(Object other) => 
  identical(this, other) || other is Subject && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}