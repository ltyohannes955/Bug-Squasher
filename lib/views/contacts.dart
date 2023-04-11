import 'package:digital_business_card/views/constant/colors.dart';
import 'package:flutter/material.dart';
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
          backgroundColor: '#2B5B80'.toColor(),
          elevation: 25,
          foregroundColor: Colors.white,
          title: const Text("Digital Business Card"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "DBC",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 15),
            ),
            Card(
              elevation: 25,
              color: '#FAF9F6'.toColor(),
              child: Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    width: MediaQuery.of(context).size.width * 1.0,
                    child: Container(
                      child: a,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "Popular",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 15),
            ),
            Container(
              height: 330.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 25,
                      color: '#91ABC2'.toColor(),
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("lib/asset/jj.jpg"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(0))),
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                    );
                  }),
            )
          ],
        )));
  }
}
