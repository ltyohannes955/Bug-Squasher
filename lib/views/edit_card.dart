import 'package:digital_business_card/widget/MyBottomNav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/business_card.dart';
import 'constant/colors.dart';

class edit_card extends StatefulWidget {
  const edit_card({super.key});

  @override
  State<edit_card> createState() => _edit_cardState();
}

class _edit_cardState extends State<edit_card> {
  final _FullController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: blue,
                      size: MediaQuery.of(context).size.width * .045,
                    ),
                  ),
                )
              ],
            ),

            Text('EDIT PROFILE', style: TextStyle(fontWeight: FontWeight.bold, color: blue, fontSize: MediaQuery.of(context).size.width*.075),),

            StreamBuilder(
              stream: FirebaseFirestore.instance.collection("UserCards").where("id" ,isEqualTo: auth.currentUser!.uid).snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                if(snapshot.hasData){
                  List data = snapshot.data!.docs;
                  String _val = data[0]["workArea"];
                  _FullController.text = data[0]["FullName"];
                  final _emailcontroller = TextEditingController();
                  final _phoneNOAreaController = TextEditingController(text: data[0]["phoneNO"].toString());
                  final _jobcontroller = TextEditingController(text: data[0]["jobType"]);
                  final _companycontroller = TextEditingController(text: data[0]["company"]);
                  _emailcontroller.text = data[0]["email"];
                  return Container(
              width: MediaQuery.of(context).size.width*.9,
              height: MediaQuery.of(context).size.height*.8,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _FullController,
                    decoration: const InputDecoration(
                      labelText: "Full Name",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,10,0,0),
                    child: Text('Work Area', style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width*.035),),
                  ),

                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Expanded(
                       child: RadioListTile(
                        activeColor: blue,
                          title: const Text('Engineering'),
                            value: "Engineering", 
                            groupValue: _val,
                            onChanged: (value){
                              setState(() {
                                _val = value!;
                              });
                            }
                          ),
                     ),
                        Expanded(
                          child: RadioListTile(
                            activeColor: blue,
                            title: const Text('Economics'),
                              value: "Economics", 
                              groupValue: _val,
                              onChanged: (value) {
                                setState(() {
                                  _val = value!;
                                });
                              }),
                        ),
                
                   ],
                 ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Expanded(
                       child: RadioListTile(
                        activeColor: blue,
                          title: const Text('tech'),
                            value: "tech", 
                            groupValue: _val,
                            onChanged: (value){
                              setState(() {
                                _val = value!;
                              });
                               //selected value
                            }
                          ),
                     ),
                        Expanded(
                          child: RadioListTile(
                            activeColor: blue,
                            title: const Text('Medicaine'),
                              value: "Medicaine", 
                              groupValue: _val,
                              onChanged: (value) {
                                setState(() {
                                  _val = value!;
                                });
                              }),
                        ),
                   ],
                 ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Expanded(
                       child: RadioListTile(
                        activeColor: blue,
                          title: const Text('Psychology'),
                            value: "Psychology", 
                            groupValue: _val,
                            onChanged: (value){
                              setState(() {
                                _val = value!;
                              });
                               //selected value
                            }
                          ),
                     ),
                        Expanded(
                          child: RadioListTile(
                            activeColor: blue,
                            title: const Text('Law'),
                              value: "Law", 
                              groupValue: _val,
                              onChanged: (value) {
                                setState(() {
                                  _val = value!;
                                });
                                //selected value
                              }),
                        ),
                   ],
                 ),
                  TextFormField(
                    controller: _emailcontroller,
                    decoration: const InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                  TextFormField(
                    controller: _phoneNOAreaController,
                    decoration: const InputDecoration(
                      labelText: "Phone NO",
                    ),
                  ),
                  TextFormField(
                    controller: _jobcontroller,
                    decoration: const InputDecoration(
                      labelText: "Jobe Type",
                    ),
                  ),
                  TextFormField(
                    controller: _companycontroller,
                    decoration: const InputDecoration(
                      labelText: "Company",
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 20,left: 280),
                      child: ElevatedButton(onPressed: (){
                        final id = auth.currentUser!.uid;
                        final FullName = _FullController.text.trim();
                        final workArea = _val.trim();
                        final email = _emailcontroller.text.trim();
                        final phoneNO = int.parse(_phoneNOAreaController.text.trim());
                        final jobType = _jobcontroller.text.trim();
                        final company = _companycontroller.text.trim() ;


                        final Business_card model = Business_card(id : id, FullName: FullName, workArea: workArea,email: email,phoneNO: phoneNO, jobType: jobType, company: company);
                        final update = FirebaseFirestore.instance.collection("UserCards").doc("id");

                        update.update(model.toJson());

                        Navigator.pushNamed(context, '/profile');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: blue,
                        
                      ), 
                      child: Text("Submit", style: TextStyle(fontSize: MediaQuery.of(context).size.width*.035),)),
                    ),
                  
              ],)
            );
                }
                return Container();
              })
          ],
        ),
      ),
    );
  }
}
