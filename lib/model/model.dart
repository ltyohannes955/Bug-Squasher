class Model {
  String id;
  String Image;
  String Name;

  Model({required this.id, required this.Image, required this.Name});

  factory Model.fromJson(Map<String, dynamic> parsedJson) {
    return Model(
        id: parsedJson['id'],
        Image: parsedJson['Image'],
        Name: parsedJson['Name']);
  }
  toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['Image'] = Image;
    json['Name'] = Name;
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
