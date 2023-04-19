import 'package:digital_business_card/views/constant/colors.dart';
import 'package:digital_business_card/views/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'constant/text.dart';
import 'Setting.dart';

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
        title: LocaleText('digital_business_card'),
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
                color: Colors.white, fontWeight: FontWeight.w900, fontSize: 15),
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
                        "assets/a.jpg",
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
          const LocaleText(
            'popular',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w900, fontSize: 15),
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
                            image: AssetImage("assets/a.jpg"),
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
      )),
      drawer: Drawer(
        child: ListView(children: [
          Container(
            color: '#2B5B80'.toColor(),
            height: 53,
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.menu_sharp,
                    color: Colors.white,
                  ),
                ),
                LocaleText(
                  'menu',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, '/Contacts');
          },
           style: ElevatedButton.styleFrom(
            primary: '#2B5B80'.toColor(), // Background color
          ),
   child: Icon(Icons.home,)),
          ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, '/catagory');
          },
          style: ElevatedButton.styleFrom(
            primary: '#2B5B80'.toColor(), // Background color
          ),
           child: Icon(Icons.category_sharp)),
          ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, '/Explor_page');
          
          },
           style: ElevatedButton.styleFrom(
            primary: '#2B5B80'.toColor(),),
           child: Icon(Icons.explore_sharp)),
           ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, '/settings');
          
          },
           style: ElevatedButton.styleFrom(
            primary: '#2B5B80'.toColor(),),
           child: Icon(Icons.language_outlined)),
           ElevatedButton(onPressed: signout,
          
          style: ElevatedButton.styleFrom(
            primary: '#2B5B80'.toColor(), // Background color
          ),
           child: Icon(Icons.logout_outlined))

        ]),
      ),
    );
  }
}
