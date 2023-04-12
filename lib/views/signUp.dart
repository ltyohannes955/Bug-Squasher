import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class signUpscreen extends StatefulWidget {
  const signUpscreen({super.key});

  @override
  State<signUpscreen> createState() => _signUpscreenState();
}

class _signUpscreenState extends State<signUpscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign Up",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height * .055,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .055,
            ),
            const TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  hintText: "Full Name", 
                  prefixIcon: Icon(
                    Icons.account_circle_rounded,
                    color: Colors.black,
                  )                 
                  )),
            
            SizedBox(
              height: MediaQuery.of(context).size.height * .045,
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
              height: MediaQuery.of(context).size.height * .045,
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
              height: MediaQuery.of(context).size.height * .045,
            ),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: const Color.fromARGB(248, 4, 14, 146),
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                onPressed: () {},
                child: const Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .035,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text("Already have an Account?Log In"))
          ],
        ),
      ),);
  }
}
