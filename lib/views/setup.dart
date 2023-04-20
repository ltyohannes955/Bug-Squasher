
import 'package:digital_business_card/bloc/activity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../database/model.dart';
import '../database/service.dart';
import 'constant/colors.dart';


import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class setup extends StatefulWidget {
  setup({super.key});

  @override
   State<setup> createState() => _setupState();
}


  final user = FirebaseAuth.instance.currentUser!;

  void signout() {
    FirebaseAuth.instance.signOut();
  }

  

class _setupState extends State<setup> {
  String _val = "";
  final _FullController = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _phoneNOAreaController = TextEditingController();
  final _jobcontroller = TextEditingController();
  final _companycontroller = TextEditingController();
  final _service = Services();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back, color: blue, size: MediaQuery.of(context).size.width*.045,),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(onPressed: (){
                      Navigator.pushNamed(context, '/Contacts');
                    }, 
                    child: const Text("SKIP", style: TextStyle(color: blue, fontWeight: FontWeight.bold),)
                    ),
                  )
                  
                  
                ],
              ),
    
              Text('SET UP', style: TextStyle(fontWeight: FontWeight.bold, color: blue, fontSize: MediaQuery.of(context).size.width*.075),),
    
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
                            title: const Text('Enggineering'),
                              value: 'Enggineering', 
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
                                value: 'Economics', 
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
                              value: 'tech', 
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
                                value: 'Medicaine', 
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
                              value: 'Psychology', 
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
                                value: 'Law', 
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
     
                    TextFormField(
                      controller: _phoneNOAreaController,
                      decoration: const InputDecoration(
                        labelText: "Phone NO",
                      ),
                    ),

                    TextFormField(
                      controller: _jobcontroller,
                      decoration: const InputDecoration(
                        labelText: "Job Type",
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
                        final FullName = _FullController.text;
                        final workArea = _val;
                        final email = _emailcontroller.text;
                        final phoneNO = int.parse(_phoneNOAreaController.text);
                        final jobType = _jobcontroller.text;
                        final company = _companycontroller.text;


                        final Business_card model = Business_card(FullName: FullName, workArea: workArea,email: email,phoneNO: phoneNO, jobType: jobType, company: company);
                        Navigator.pushNamed(context, '/Contacts');
                        setState(() {
                          BlocProvider.of<ActivityBloc>(context)
                            .add(PersonalEvent(business_card: model));
                        });
                        
                      },
                      style: ElevatedButton.styleFrom(
                        primary: blue,
                        
                      ), 
                      child: Text("Submit", style: TextStyle(fontSize: MediaQuery.of(context).size.width*.035),)),
                    )
                ],)
              )
            ],
          ),

      ),
    );
  }
}
