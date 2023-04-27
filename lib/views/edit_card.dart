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
final auth = FirebaseAuth.instance;

Future updateUserCard(Business_card _business_card) async{
    await FirebaseFirestore.instance.collection("UserCards").doc(auth.currentUser!.uid).update(_business_card.toJson());
  }

class _edit_cardState extends State<edit_card> {
  String _val = "";
  final _FullController = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _phoneNOAreaController = TextEditingController();
  final _jobcontroller = TextEditingController();
  final _companycontroller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back, color: blue, size: MediaQuery.of(context).size.width*.045,),),
                  )
                  
                  
                ],
              ),
        
              Text('EDIT PROFILE', style: TextStyle(fontWeight: FontWeight.bold, color: blue, fontSize: MediaQuery.of(context).size.width*.075),),
        
               Container(
                width: MediaQuery.of(context).size.width*.9,
                height: MediaQuery.of(context).size.height*.8,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _FullController,
                      decoration: InputDecoration(
                        labelText: "Full Name"
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
                                onChanged: (value){
                            setState(() {
                              _val = value!;
                            });
                            }
                           ),
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
                                onChanged: (value){
                            setState(() {
                              _val = value!;
                            });
                             //selected value
                             }
                            ),
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
                                onChanged: (value){
                            setState(() {
                              _val = value!;
                            });
                          }
                         ),
                          ),
                      
                     ],
                   ),
                    TextFormField(
                      controller: _emailcontroller,
                      decoration: const InputDecoration(
                        labelText: "Email",
                      ),
                    ),
                    TextField(
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
        
        
                          final Business_card model = Business_card(id : id, FullName: FullName, workArea: workArea,email: email, phoneNO: phoneNO, jobType: jobType, company: company);
        
                          updateUserCard(model);
        
                          Navigator.pushNamed(context, '/profile');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: blue,
                          
                        ), 
                        child: Text("Submit", style: TextStyle(fontSize: MediaQuery.of(context).size.width*.035),)),
                      ),
                    
                
              
            ],
          ),
              ),
              ]),
        )));
  }
}