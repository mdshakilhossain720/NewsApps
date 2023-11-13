class Source {
  Source({
      required this.id,
      required this.name,});

  Source.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  String id;
  String name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}