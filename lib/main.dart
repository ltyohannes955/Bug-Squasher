import 'package:digital_business_card/views/contacts.dart';
import 'package:digital_business_card/views/category.dart';
import 'package:digital_business_card/views/edit_card.dart';
import 'package:digital_business_card/views/intro.dart';
import 'package:digital_business_card/views/login.dart';
import 'package:digital_business_card/views/profile.dart';
import 'package:digital_business_card/views/setup.dart';
import 'package:digital_business_card/views/signUp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Contacts(),
      routes: {
        '/': (context) => introPage(),
        '/login': (context) => loginScreen(),
        '/signUp': (context) => signUpscreen(),
        '/setup': (context) => setup(),
        '/profile': (context) => profile(),
        '/edit_card': (context) => edit_card(),
        '/catagorys': (context) => Category(),
      },
    );
  }
}
