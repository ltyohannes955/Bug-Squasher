import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signUpscreen extends StatefulWidget {
  signUpscreen({super.key});

  @override
  State<signUpscreen> createState() => _signUpscreenState();
}

class _signUpscreenState extends State<signUpscreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    try {
      //check wether the confirmed password is the same or not
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else {
        wrongPasswordMessage();
      }
      //pop the loading circle
    } on FirebaseAuthException catch (e) {
      // WRONG EMAIL
      if (e.code == 'user-not-found') {
        // show error to user
        wrongEmailMessage();
      }
      // WRONG PASSWORD
      else if (e.code == 'wrong-password') {
        // show error to user
        wrongPasswordMessage();
      }
    }
    // Navigator.pop(context);
  }

  // wrong email message popup
  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'Incorrect Email',
              style: TextStyle(color: Colors.white),
            ),
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
          title: Center(
            child: Text(
              'Incorrect Password',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .155),
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
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: "Email",
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
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: "Confirm Password",
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
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
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
                onPressed: () {
                  Navigator.pushNamed(context, '/setup');
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),

              SizedBox(
                height: MediaQuery.of(context).size.height * .055,

              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text("Already have an account?Register"))
            ],
          ),
        ),
      ),
    );
  }
}
