import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_business_card/views/setup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import 'constant/colors.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: '#2B5B80'.toColor(),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.width * .045,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: IconButton(
                      onPressed: signout,
                      icon: Icon(
                        Icons.logout,
                        color: Colors.red,
                      )),
                )
              ],
            ),
            Center(
                child: LocaleText(
              'digital_business_card',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.height * .055),
            )
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection("UserCards").where("id" ,isEqualTo: auth.currentUser!.uid).snapshots(),
              builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
                if(snapshot.hasData){
                  List data = snapshot.data!.docs;
                  return Card(
              elevation: 20,
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                height: MediaQuery.of(context).size.height * .3,
                width: MediaQuery.of(context).size.width * .9,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.person,
                          size: MediaQuery.of(context).size.height * .15,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[0]['FullName'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * .055),
                        ),
                        RichText(
                            text:   TextSpan(
                                text: 'Work Area: ',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                children: <TextSpan>[
                              TextSpan(
                                  text: data[0]["workArea"],
                                  style: const TextStyle(color: Colors.grey))
                            ])),
                        RichText(
                            text:  TextSpan(
                                text: 'Email: ',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                children: <TextSpan>[
                              TextSpan(
                                  text: data[0]["email"],
                                  style: const TextStyle(color: Colors.grey))
                            ])),
                        RichText(
                            text:  TextSpan(
                                text: 'Phone NO: ',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                children: <TextSpan>[
                              TextSpan(
                                  text: data[0]["phoneNO"].toString(),
                                  style: const TextStyle(color: Colors.grey))
                            ])),
                        RichText(
                            text:  TextSpan(
                                text: 'Job Type: ',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                children: <TextSpan>[
                              TextSpan(
                                  text: data[0]["jobType"],
                                  style: const TextStyle(color: Colors.grey))
                            ])),
                        RichText(
                            text:  TextSpan(
                                text: 'company: ',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                children: <TextSpan>[
                              TextSpan(
                                  text: data[0]["company"],
                                  style: const TextStyle(color: Colors.grey))
                            ])),
                        Row(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, "/edit_card");
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: blue,
                                ),
                                child: LocaleText(
                                  "edit",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              .04),
                                )),
                          ],
                        ),
                      ],
                    ),
                    
                  ],
                ),
              ),
            );
                }
                return Container();

              }
              )
          ],
        ),
        floatingActionButton: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '');
            },
            icon: Icon(
              Icons.qr_code,
              color: Colors.white,
              size: MediaQuery.of(context).size.width * .1,
            )),
      ),
    );
  }
}
