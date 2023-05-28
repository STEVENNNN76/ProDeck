import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_page.dart';
/*
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AuthPage()),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 180,
            ),
            const Text(
              'Forgot Password',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter your email to reset your password',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            /* const SizedBox(height: 20),
            SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  enableSuggestions: false,
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            */
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xffE8ECF4), width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xffE8ECF4), width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: () {
                  auth.sendPasswordResetEmail(email: _emailController.text);
                },
                child: const Text('Reset Password'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(
              height: 300,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t Have an account?",
                    style: TextStyle(
                      color: Color(0xff1E232C),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    // onTap: widget.onTap,
                    child: const Text('Sign-Up',
                        style: TextStyle(
                          color: Color(0xff35C2C1),
                          fontSize: 15,
                        )),
                  )
                ],
              ),
            ),

            //const SizedBox(height: 3),
          ],
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_page.dart';
import 'package:prodeck/signup.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                CupertinoButton(
                  child: const Icon(CupertinoIcons.back),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AuthPage(
                                onTap: () {},
                              )),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 180,
            ),
            const Text(
              'Forgot Password',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter your email to reset your password',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xffE8ECF4), width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xffE8ECF4), width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: () {
                  auth.sendPasswordResetEmail(email: _emailController.text);
                },
                child: const Text('Reset Password'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t Have an account?",
                    style: TextStyle(
                      color: Color(0xff1E232C),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpPage(
                                  onTap: () {},
                                )),
                      );
                    },
                    child: const Text('Sign-Up',
                        style: TextStyle(
                          color: Color(0xff35C2C1),
                          fontSize: 15,
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
