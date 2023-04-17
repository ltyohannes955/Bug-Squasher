class Model {
  int id;
  String name;
  String image;

  Model({required this.id, required this.name, required this.image});

  factory Model.fromJson(Map<String, dynamic> parsedJson) {
    return Model(
        id: parsedJson['id'],
        name: parsedJson['name'],
        image: parsedJson['image']);
  }
  toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['name'] = name;
    json['image'] = image;
    return json;
  }

  static List modelList(List item) {
    List items = [];
    for (var i = 0; i < item.length; i++) {
      items.add(Model.fromJson(item[i]));
    }
    return items;
  }
}
