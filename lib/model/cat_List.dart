class cat_list {
  String JobTitle;
  String Image;
  String id;
  cat_list({required this.JobTitle, required this.Image, required this.id});

  // ignore: empty_constructor_bodies
  factory cat_list.fromjson(Map<String, dynamic> parsedjson) {
    return cat_list(
      JobTitle: parsedjson['Job_Title'],
      Image: parsedjson['Image'],
      id: parsedjson['id'],
    );
  }
  toJson() {
    Map<String, dynamic> json = {};
    json['Job_Title'] = JobTitle;
    json['Image'] = Image;
    json['id'] = id;
    return json;
  }

  static List itemList(List item) {
    List cards = [];
    for (var i = 0; i < item.length; i++) {
      cards.add(cat_list.fromjson(item[i]));
    }
    return cards;
  }
}
