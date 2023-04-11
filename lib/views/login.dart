import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Log In",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height * .055,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .055,
            ),
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "User Email",
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.black,
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .055,
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .055,
            ),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: Color.fromARGB(248, 10, 17, 121),
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                onPressed: () {},
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .055,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text("Don't have an Account?Sign Up"))
          ],
        ),
      ),
    );
  }
}
