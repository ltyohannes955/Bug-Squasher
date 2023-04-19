
import 'package:flutter/material.dart';

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
  int _val = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                      child: TextButton(onPressed: (){}, 
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
                              title: Text('Enggineering'),
                                value: 1, 
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
                                title: Text('Economics'),
                                  value: 2, 
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
                              title: Text('tech'),
                                value: 3, 
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
                                title: Text('Medicaine'),
                                  value: 4, 
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
                              title: Text('Psychology'),
                                value: 5, 
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
                                title: Text('Law'),
                                  value: 6, 
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
            
                     Padding(
                        padding: const EdgeInsets.fromLTRB(10,10,0,0),
                        child: Text('Email:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width*.035),),
                      ), 
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Email",
                        ),
                      ),
            
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,10,0,0),
                        child: Text('Phone NO:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width*.035),),
                      ), 
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Phone NO",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,10,0,0),
                        child: Text('Job Type:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width*.035),),
                      ), 
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Jobe Type",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,10,0,0),
                        child: Text('Company:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width*.035),),
                      ), 
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Company",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20,left: 280),
                        child: ElevatedButton(onPressed: (){
                          Navigator.pushNamed(context, '/catagory');
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

      ),
    );
  }
}
