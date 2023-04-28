import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_business_card/bloc/profile_bloc.dart';
import 'package:digital_business_card/model/business_card.dart';
import 'package:digital_business_card/views/setup.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'constant/colors.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final auth = FirebaseAuth.instance;

  @override
  void initState(){
    super.initState();
    BlocProvider.of<ProfileBloc>(context).add(GetCard());
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: '#2B5B80'.toColor(),
        body: 
        Column(
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: LocaleText(
                              'digital_business_card',
                              style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * .055),
                    textAlign: TextAlign.center,
                            ),
                )
            ),
            BlocBuilder<ProfileBloc, ProfileState>
            (builder: (context, state){
              
              
              if(state is profileSuccess){
                List<Business_card> card = state.CardData;
                if (card.isEmpty){
                  return Center(
                    child: ElevatedButton(onPressed: (){
                      Navigator.pushNamed(context, "/setup");
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white
                    ),
                     child: LocaleText("add_card", style: TextStyle(color: '#2B5B80'.toColor()),)),
                  );
                }
                return Column(
                  children: [
                    Card(
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
                              card[0].FullName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .055),
                            ),
                            RichText(

                                text:  TextSpan(
                                    text: Locales.string(context,'work_area'),
                                    style: TextStyle(

                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: card[0].workArea,
                                      style: const TextStyle(color: Colors.grey))
                                ])),
                            RichText(
                                text:  TextSpan(

                                    text: Locales.string(context,'email'),
                                    style: TextStyle(

                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: card[0].email,
                                      style: const TextStyle(color: Colors.grey))
                                ])),
                            RichText(

                                text: TextSpan(
                                    text: Locales.string(context,'phone_no'),
                                    style: TextStyle(

                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: card[0].phoneNO.toString(),
                                      style: const TextStyle(color: Colors.grey))
                                ])),
                            RichText(
                                text:  TextSpan(

                                    text: Locales.string(context,'job_type'),
                                    style: TextStyle(

                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: card[0].jobType,
                                      style: const TextStyle(color: Colors.grey))
                                ])),
                            RichText(
                                text:  TextSpan(

                                    text: Locales.string(context,'company'),
                                    style: TextStyle(

                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: card[0].company,
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
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.05,),
            Container(
              color: Colors.white,
              child: QrImage(data: card[0].phoneNO.toString(),
                        size: MediaQuery.of(context).size.height*.25,
                        embeddedImageStyle: QrEmbeddedImageStyle(size: Size(40, 40),
                        color: Colors.white
                        )
                        ),
            )
                  ],
                );
              }
              else if(state is profileLoading){
                return const Center(
                  child: CircularProgressIndicator(color: Colors.amber),
                );
              }
              return Container();
            }),]),
      ),
      
    );
  }
}
