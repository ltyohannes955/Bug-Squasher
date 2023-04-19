import 'package:digital_business_card/views/constant/colors.dart';
import 'package:digital_business_card/views/widget/MyAppbar.dart';
import 'package:digital_business_card/views/widget/MyDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Explor_page extends StatefulWidget {
  const Explor_page({super.key});

  @override
  State<Explor_page> createState() => _Explor_pageState();
}

class _Explor_pageState extends State<Explor_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/Personal');
              },
              child: Container(
                  height: 164,
                  width: 343,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(29),
                      color: Color.fromARGB(255, 150, 180, 146)),
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          "assets/a.jpg",
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 43),
                          child: Container(
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                                child: Container(
                                  child: const Text(
                                    'Full Name',
                                    selectionColor: Colors.purple,
                                    style: TextStyle(
                                        fontSize: 27,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                                child: Container(
                                  child: const Text('work area ',
                                      selectionColor:
                                          Color.fromARGB(255, 0, 0, 0),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                                child: Container(
                                  child: const Text('Job Type ',
                                      selectionColor:
                                          Color.fromARGB(255, 0, 0, 0),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 13),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.1,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
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
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.1,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
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
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.09,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: const Icon(
                                        Icons.video_call_outlined,
                                        fill: BorderSide.strokeAlignCenter,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              ),
                            ]),
                          ))
                    ],
                  )),
            );
          }),
      drawer: MyDrawer(),
    );
  }
}
