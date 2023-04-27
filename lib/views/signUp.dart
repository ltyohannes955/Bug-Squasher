
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import 'widget/language.dart';

class signUpscreen extends StatefulWidget {
  signUpscreen({super.key});

  @override
  State<signUpscreen> createState() => _signUpscreenState();
}

class _signUpscreenState extends State<signUpscreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  Future signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return  const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    //check wether the confirmed password is the same or not
    if (passwordController.text == confirmPasswordController.text) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
          Navigator.pushNamed(context, '/setup');
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Color.fromARGB(255, 138, 8, 30),
            title: Center(
              child: Text(
                'Passwords Dont Match! ',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(224, 255, 255, 255),actions: [
        Container(
                child: TextButton(
                  onPressed: (){
                    showModalBottomSheet(
                  context: context, builder: (BuildContext context) => language());
                  },
                  child: LocaleText("language", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
                )
              ),],),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .080),
                LocaleText(
                  "signup",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * .055,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .055,
                ),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration:  InputDecoration(
                      hintText: Locales.string(context,'email'),
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.black,
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .055,
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration:  InputDecoration(
                      hintText: Locales.string(context,'password'),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .055,
                ),
                TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration:  InputDecoration(
                      hintText: Locales.string(context,'confirm'),
                      prefixIcon: Icon(
                        Icons.key,
                        color: Colors.black,
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .055,
                ),
                GestureDetector(
                    onTap: signUserUp,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(248, 10, 17, 121)),
                      child: const Center(
                        child: LocaleText(
                          "signup",
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .045,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const LocaleText("already_have_an_account"))
              ]),
        ),
      ),
    );
  }
}
