
import 'package:digital_business_card/views/category.dart';
import 'package:digital_business_card/views/contacts.dart';
import 'package:digital_business_card/views/profile.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(MaterialApp(home: gnav()));

class gnav extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<gnav> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final screens = [
    profile(),
    Contacts(),
    Category(),
  ];
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      height: 60.0,
      animationCurve: Curves.easeInOut,
      items: <Widget>[
        IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/Contacts');
            },
            icon: Icon(Icons.home_outlined)),
        IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/catagory');
            },
            icon: Icon(Icons.category_outlined)),
        IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/profile');
            },
            icon: Icon(Icons.perm_identity_outlined)),
      ],
      color: Colors.white,
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: Color.fromARGB(255, 230, 191, 84),
      animationDuration: Duration(milliseconds: 300),
      onTap: (index) {
        setState(() {
        _page = index;
          screens[index];
        });
      },
      letIndexChange: (index) => true,
    );
  }
}
