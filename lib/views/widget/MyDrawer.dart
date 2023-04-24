import 'package:digital_business_card/views/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import '../setup.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
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
                  'Menu',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, '/Contacts');
          },
           style: ElevatedButton.styleFrom(
            primary: '#2B5B80'.toColor(), // Background color
          ),
          child: Icon(Icons.home,)),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, '/catagory');
          },
          style: ElevatedButton.styleFrom(
            primary: '#2B5B80'.toColor(), // Background color
          ),
           child: Icon(Icons.category_sharp)),
           SizedBox(height: 10,),
          ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, '/Explor_page');
             },
          style: ElevatedButton.styleFrom(
            primary: '#2B5B80'.toColor(), // Background color
          ),
           child: Icon(Icons.explore_sharp)),
           SizedBox(height: 10,),
            
          ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, '/settings');
             },
          style: ElevatedButton.styleFrom(
            primary: '#2B5B80'.toColor(), // Background color
          ),
           child: Icon(Icons.language_outlined)),
           SizedBox(height: 10,),

          
         ElevatedButton(onPressed: signout,
         style: ElevatedButton.styleFrom(
            primary: '#2B5B80'.toColor(),),
           child: Icon(Icons.logout_outlined),)

         

        ]),
      ),
    );
  }
}