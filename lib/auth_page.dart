import 'package:digital_business_card/views/contacts.dart';
import 'package:digital_business_card/views/intro.dart';
import 'package:digital_business_card/views/login.dart';
import 'package:digital_business_card/views/setup.dart';
import 'package:digital_business_card/views/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Contacts();
          } else {
            return loginScreen();
          }
        },
      ),
    );
  }
}
