

class cards {
  String jobTitle;
  String image;
  num id;

  cards({required this.jobTitle, required this.image, required this.id});

  factory cards.fromJson(Map<String, dynamic> parsedjson) {
    return cards(
      jobTitle: parsedjson['Job_Title'],
      image: parsedjson['Image'],
      id: parsedjson['id'],
    );
  }
  toJson() {
    Map<String, dynamic> json = {};
    json['Job_Title'] = jobTitle;
    json['Image'] = image;
    json['id'] = id;
    return json;
  }
}
