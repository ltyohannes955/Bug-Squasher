

import 'package:digital_business_card/auth_page.dart';

import 'package:digital_business_card/bloc/popular_bloc.dart';

import 'package:digital_business_card/views/Explor_page.dart';
import 'package:digital_business_card/views/Setting.dart';
import 'package:digital_business_card/views/contacts.dart';
import 'package:digital_business_card/views/category.dart';
import 'package:digital_business_card/views/edit_card.dart';
import 'package:digital_business_card/views/login.dart';
import 'package:digital_business_card/views/personal.dart';
import 'package:digital_business_card/views/profile.dart';
import 'package:digital_business_card/views/setup.dart';
import 'package:digital_business_card/views/signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/catagory_bloc.dart';
import 'bloc/explor_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'es', 'ar', 'am']);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CatagoryBloc(),
        ),
        BlocProvider(
          create: (context) => ExplorBloc(),
        ),
        BlocProvider(
          create: (context) => PopularBloc(),),
       
      ],
      child: LocaleBuilder(
        builder: (locale) => MaterialApp(
          localizationsDelegates: Locales.delegates,
          supportedLocales: Locales.supportedLocales,
          locale: locale,
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
            '/Personal': (context) => Personal(),
            '/settings': (context) => SettingScreen(),
                       

          },
        ),
      ),
    );
  }
}
