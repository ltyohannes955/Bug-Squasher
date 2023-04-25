import 'package:digital_business_card/views/setup.dart';
import 'package:digital_business_card/views/widget/gNav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import 'constant/colors.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
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
                Padding(
                  padding: const EdgeInsets.all(15.0),
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
            )),
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
                          'Abebe Kebede',
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
                                  text: 'Engineering',
                                  style: TextStyle(color: Colors.grey))
                            ])),
                        RichText(
                            text:  TextSpan(
                                text: Locales.string(context,'email'),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                children: <TextSpan>[
                              TextSpan(
                                  text: 'test@gmail.com',
                                  style: TextStyle(color: Colors.grey))
                            ])),
                        RichText(
                            text: TextSpan(
                                text: Locales.string(context,'phone_no'),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                children: <TextSpan>[
                              TextSpan(
                                  text: '0912345678',
                                  style: TextStyle(color: Colors.grey))
                            ])),
                        RichText(
                            text:  TextSpan(
                                text: Locales.string(context,'job_type'),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                children: <TextSpan>[
                              TextSpan(
                                  text: 'CEO',
                                  style: TextStyle(color: Colors.grey))
                            ])),
                        RichText(
                            text:  TextSpan(
                                text: Locales.string(context,'company'),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                children: <TextSpan>[
                              TextSpan(
                                  text: 'ABC .PLC',
                                  style: TextStyle(color: Colors.grey))
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
            bottomNavigationBar: gnav(),
      ),
      
    );
  }
}
