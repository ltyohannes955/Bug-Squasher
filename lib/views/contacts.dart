import 'package:digital_business_card/views/constant/colors.dart';
import 'package:digital_business_card/views/setup.dart';
import 'package:digital_business_card/views/widget/MyAppbar.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:digital_business_card/views/widget/MyDrawer.dart';
import 'package:digital_business_card/views/widget/gNav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'constant/text.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: '#2B5B80'.toColor(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(225, 255, 255, 255),
        title: Text(
          'DBC',
          style: TextStyle(
              fontSize: 31.09,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal),
        ),
        elevation: 0,
        actions: [
          Container(
              child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/settings");
            },
            child: Text(
              "ENG",
              style: TextStyle(color: Color.fromARGB(255, 3, 3, 3)),
            ),
          )),
          Container(
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/qr_code');
              },
              icon: const Icon(
                Icons.qr_code_scanner,
                size: 33,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      extendBody:true,
      body: 
       SingleChildScrollView(
         child: Column(
          children: [
            Column(
              children: <Widget>[
                ClipPath(
                  clipper: WaveClipperTwo(),
                  child: Stack(children: [
                    Container(
                      height: 230,
                      color: Colors.white,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            top: 15,
                          ),
                          child: Image.asset(
                            "assets/a.jpg",
                            fit: BoxFit.cover,
                            height: 150,
                            width: 130,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .07,
                        ),
                        a
                      ],
                    ),
                  ]),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.13,
                      height: MediaQuery.of(context).size.width * 0.13,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Icon(
                        Icons.lightbulb,
                        fill: BorderSide.strokeAlignCenter,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    b
                  ],
                ),
                Column(
                  children: [
                   Container(
                      width: MediaQuery.of(context).size.width * 0.13,
                      height: MediaQuery.of(context).size.width * 0.13,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Icon(
                        Icons.thumb_up,
                        fill: BorderSide.strokeAlignCenter,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    c
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.13,
                      height: MediaQuery.of(context).size.width * 0.13,
                      decoration: const BoxDecoration(
                          boxShadow: [],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Icon(
                        Icons.share,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    d
                  ],
                ),
                Column(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.13,
                        height: MediaQuery.of(context).size.width * 0.13,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: const Icon(Icons.manage_accounts_sharp)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    e
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LocaleText(
                    "Popular",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w900,
                        fontSize: 22),
                  ),
                ),
              ],
            ),
            Container(
              height: 200.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 25,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/eagle.jpg"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                    );
                  }),
            )
          ],
             ),
       ),
      bottomNavigationBar: gnav(),
    );
  }
}
