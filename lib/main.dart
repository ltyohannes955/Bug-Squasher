import 'package:digital_business_card/views/Explor_page.dart';
import 'package:digital_business_card/views/contacts.dart';
import 'package:digital_business_card/views/category.dart';
import 'package:digital_business_card/auth_page.dart';
import 'package:digital_business_card/views/edit_card.dart';
import 'package:digital_business_card/views/intro.dart';
import 'package:digital_business_card/views/login.dart';
import 'package:digital_business_card/views/personal.dart';
import 'package:digital_business_card/views/profile.dart';
import 'package:digital_business_card/views/setup.dart';
import 'package:digital_business_card/views/signUp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/catagory_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatagoryBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => AuthPage(),
          '/login': (context) => loginScreen(),
          '/signUp': (context) => signUpscreen(),
          '/setup': (context) => setup(),
          '/profile': (context) => profile(),
          '/edit_card': (context) => edit_card(),
          '/catagory': (context) => Category(),
          '/Contacts': (context) => Contacts(),
          '/Explor_page': (context) => Explor_page(),
          '/Personal': (context) => Personal()
        },
      ),
    );
  }
}
