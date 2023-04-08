import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff10455B),
        body: Column(children: [
          Expanded(
              flex: 25,
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(320, 3, 0, 0),
                      child: IconButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        icon: const Icon(
                          Icons.account_circle_outlined,
                          size: 39,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 250, 0),
                        child: Container(
                            height: MediaQuery.of(context).size.height * .1,
                            width: MediaQuery.of(context).size.width * .5,
                            child: Image(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/images/logo.png',
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 250, 0),
                        child: Container(
                          child: Text(
                            'DBC',
                            style: TextStyle(
                                fontSize: 31.09,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 210, 0),
                    child: Container(
                      child: Text(
                        'Catagory',
                        style: TextStyle(
                            fontSize: 20.08,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                  ),
                ],
              )),
          Expanded(
            flex: 60,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1.5 / 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemCount: 23,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    height: 400,
                    width: 137.11,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 134, 134, 131),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text('hello'),
                  );
                }),
          ),
          BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                label: "Scanner",
                icon: Icon(Icons.qr_code_scanner),
              ),
              BottomNavigationBarItem(
                label: "Categories",
                icon: Icon(Icons.book),
              ),
              BottomNavigationBarItem(
                label: "Qr Codes",
                icon: Icon(Icons.qr_code),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
