import 'package:digital_business_card/views/category.dart';
import 'package:digital_business_card/views/contacts.dart';
import 'package:digital_business_card/views/login.dart';
import 'package:digital_business_card/views/setup.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class bottomNav extends StatefulWidget {
  const bottomNav({super.key});

  @override
  State<bottomNav> createState() => _bottomNavState();
}

class _bottomNavState extends State<bottomNav> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  double height = 0;
  double width = 0;
  int page = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    Widget child = const Contacts();

    switch (page) {
      case 0:
        child = const Contacts();
        break;
      case 1:
        child = const Category();
        break;
      case 2:
        child = setup();
        break;
    }

    return

        /// `Scaffold` is a widget in Flutter that provides a basic structure for a screen or page in
        /// an app. It provides a framework for implementing common app features such as a navigation
        /// drawer, app bar, and floating action button. In this code, `Scaffold` is being used to
        /// provide the basic structure for the bottom navigation bar.
        Scaffold(
      body: Container(
        child: child,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: const <Widget>[
          Icon(
            Icons.home_outlined,
            size: 30,
            color: Colors.white,
          ),
          Icon(Icons.category_outlined, size: 30, color: Colors.white),
          Icon(Icons.perm_identity, size: 30, color: Colors.white),
        ],
        color: Colors.blueAccent,
        buttonBackgroundColor: Colors.amberAccent,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}
