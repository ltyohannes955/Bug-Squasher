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
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                icon: const Icon(Icons.account_circle_outlined))
          ],
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
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(1))),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      children: [
                        Image.asset(
                          "lib/asset/jj.jpg",
                          fit: BoxFit.cover,
                          height: 200,
                          width: 130,
                        ),
                        const Spacer(
                          flex: 15,
                        ),
                        a
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    Icons.lightbulb,
                    fill: BorderSide.strokeAlignCenter,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.width * 0.1,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Icon(
                    Icons.thumb_up,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.width * 0.1,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Icon(
                    Icons.share,
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.width * 0.1,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Icon(Icons.manage_accounts_sharp)),
              ],
            ),
            Row(
              children: [b, c, d, e],
            ),
            const Text(
              "Popular",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 15),
            ),
            Container(
              height: 150.0,
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                    );
                  }),
            )
          ],
        )),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: '#5E718B'.toColor(),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: '',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
                backgroundColor: Colors.purple)
          ],
        ));
  }
}
