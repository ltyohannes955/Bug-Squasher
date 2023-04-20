
class Business_card{
  int? id;
  String FullName;
  String workArea;
  String email;
  int phoneNO;
  String jobType;
  String company;


Business_card({
  this.id,
  required this.FullName,
  required this.workArea,
  required this.email,
  required this.phoneNO,
  required this.jobType,
  required this.company,
});



  factory Business_card.fromJson(Map<String, dynamic> parsedJson) {
    return Business_card(
        id: parsedJson["id"],
        FullName: parsedJson["FullName"],
        workArea: parsedJson["workArea"],
        email: parsedJson["email"],
        phoneNO: parsedJson["phoneNO"],
        jobType: parsedJson["jobType"],
        company: parsedJson["company"],
        );
  }

  factory Business_card.historyfromJson(Map<String, dynamic> parsedJson) {
    return Business_card(
      id: parsedJson["id"],
      FullName: parsedJson["FullName"],
      workArea: parsedJson["workArea"],
      email: parsedJson["email"],
      phoneNO: parsedJson["phoneNO"],
      jobType: parsedJson["jobType"],
      company: parsedJson["company"],
    );
  }

  toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['FullName'] = FullName;
    json['workArea'] = workArea;
    json['email'] = email;
    json['phoneNO'] = phoneNO;
    json['jobType'] = jobType;
    json['company'] = company;
    return json;
  }

  static List historyList(List card) {
    List cards = [];
    for (var i = 0; i < card.length; i++) {
      cards.add(Business_card.historyfromJson(card[i]));
    }
    return cards;
  }

}