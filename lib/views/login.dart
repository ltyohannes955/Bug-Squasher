import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_locales/flutter_locales.dart';

class loginScreen extends StatefulWidget {
  loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      // loading sign

      Navigator.pushNamed(context, '/Contacts');
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // WRONG EMAIL
      showErroMessage(e.code);
    }
  }

  // wrong email message popup
  void showErroMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: LocaleText(
            'Incorrect Email',
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  // wrong password message popup
  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Color.fromARGB(255, 136, 19, 54),
          title: LocaleText(
            'Incorrect password',
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * .030),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .155),
            LocaleText(
              "login",
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
              decoration: const InputDecoration(
                  hintText: "User Email",
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
              decoration: const InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .055,
            ),
            GestureDetector(
                onTap: signUserIn,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(248, 10, 17, 121)),
                  child: const Center(
                    child: LocaleText(
                      "login",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * .055,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signUp');
                },
                child: LocaleText("don't_have_an_Account?")),
                ElevatedButton(onPressed:(){Navigator.pushNamed(context, '/settings');} ,child: Icon(Icons.language_outlined,), ),
                
          ],
        ),
      ),
    ));
  }
}
