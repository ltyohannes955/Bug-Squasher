import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_business_card/model/business_card.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileRepo{
  final fireCloud = FirebaseFirestore.instance.collection("UserCard");

  static Future<List<Business_card>> getter() async{
      final auth = FirebaseAuth.instance;
    try{

      List<Business_card> card = [];

      final persnalCard = await FirebaseFirestore.instance.collection("UserCards").where("id" ,isEqualTo: auth.currentUser!.uid).get();

      persnalCard.docs.forEach((element) {
        return card.add(Business_card.fromJson(element.data()));
      });
      return card;
    } on FirebaseException catch(e){
      throw Exception(e.toString());
    }
  }

}