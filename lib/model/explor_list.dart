import 'dart:convert';

class explor_list {
  String workarea;
  String jobTYPE;
  String fullNAME;
  String image_E;
  String email;
  String phonNO;
  String company;
  String id;

  explor_list(
      {
      required this.workarea,
      required this.jobTYPE,
      required this.fullNAME,
      required this.image_E,
      required this.email,
      required this.phonNO,
      required this.company,
      required this.id});

  factory explor_list.fromJson(Map<String, dynamic> parsedjson) {
    return explor_list(
    workarea:  parsedjson['workarea'],
    jobTYPE: parsedjson['job_TYPE'],
    fullNAME: parsedjson['full_NAME'],
    image_E: parsedjson['image_e'],
    email: parsedjson['Email'],
    phonNO: parsedjson['Phon_NO'],
    company: parsedjson['Company'],
    id: parsedjson['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['workarea'] = workarea;
    json['job_TYPE'] = jobTYPE;
    json['full_NAME'] = fullNAME;
    json['image_e'] = image_E;
    json['Email'] = email;
    json['Phon_NO'] = phonNO;
    json['Company'] = company;
    json['id'] = id;
    return json;
  }
  static List itemList(List item) {
    List tiles = [];
    for (var i = 0; i < item.length; i++) {
      tiles.add(explor_list.fromJson(item[i]));
    }
    return tiles;
  }
}