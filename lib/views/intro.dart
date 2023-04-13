import 'package:flutter/material.dart';


class introPage extends StatefulWidget {
  const introPage({super.key});

  @override
  State<introPage> createState() => _introPageState();
}

class _introPageState extends State<introPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        right: true,
        left: true,
        bottom: true,
        child: Scaffold(
            body: Column(children: [Padding(padding: const EdgeInsets.fromLTRB(8, 25, 0, 0),child:
          Text(
            'Create Your Digital Business Card Today!',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * .055,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 1, 11, 102)),
          ),),
          Expanded(child: 
          ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(80, 8, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Center(
                        child: Image.asset(
                          "assets/card2.jpg",
                          width: MediaQuery.of(context).size.width * .500,
                          height: MediaQuery.of(context).size.height * .500,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(80, 10, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Center(
                        child: Image.asset(
                          "assets/qr.png",
                          width: MediaQuery.of(context).size.width * .500,
                          height: MediaQuery.of(context).size.height * .500,
                          
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(80, 8, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Center(
                        child: Image.asset(
                          "assets/card2.jpg",
                          width: MediaQuery.of(context).size.width * .500,
                          height: MediaQuery.of(context).size.height * .500,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),),
          Padding(
            padding: const EdgeInsets.only(bottom: 9.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signUp');
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context) .size.width*.455, MediaQuery.of(context).size.height * .075, ),
                    primary: Color.fromARGB(255, 1, 11, 102),
                     
  shape: 
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      
    )
                

                    ),
                child: const Text(
                  "Let's Get Started",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                )),
          )
        ])

           
            ));
  }
}
