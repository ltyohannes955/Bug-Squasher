import 'package:digital_business_card/views/constant/colors.dart';
import 'package:digital_business_card/views/constant/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Personal extends StatefulWidget {
  const Personal({super.key});

  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: "#CF786F".toColor(),
          elevation: 25,
          foregroundColor: Colors.white,
          title: const Text("Digital Business Card"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                icon: const Icon(Icons.account_circle_outlined))
          ]),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
            child: Container(
              decoration: BoxDecoration(
                  color: "#CF786F".toColor(),
                  borderRadius: const BorderRadius.all(Radius.circular(25))),
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        "assets/eagle.jpg",
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Column(
                      children: [
                        const Text(
                          '''Dr. Stefani
  Albert''',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          ''' Hospital Manager 
          ''',
                          style: TextStyle(color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.width * 0.1,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: const Icon(
                                Icons.message_outlined,
                                fill: BorderSide.strokeAlignCenter,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.width * 0.1,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: const Icon(
                                Icons.phone,
                                fill: BorderSide.strokeAlignCenter,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.width * 0.1,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: const Icon(
                                Icons.video_call_outlined,
                                fill: BorderSide.strokeAlignCenter,
                              ),
                            ),
                            const SizedBox(
                              width: 7,
                            )
                          ],
                        )
                      ],
                    )
                  ]),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
            child: const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "About",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            child: f,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.2),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Address",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.2),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Daily Schedule",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.width * 0.1,
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 95, 92, 92),
                              blurRadius: 0,
                              spreadRadius: 2,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Icon(
                        Icons.location_city,
                        fill: BorderSide.strokeAlignCenter,
                      ),
                    ),
                    g,
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.width * 0.1,
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 95, 92, 92),
                              blurRadius: 0,
                              spreadRadius: 2,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Icon(
                        Icons.schedule_rounded,
                        fill: BorderSide.strokeAlignCenter,
                      ),
                    ),
                    j,
                  ],
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}
