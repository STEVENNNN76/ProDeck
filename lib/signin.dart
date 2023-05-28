import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
//import 'package:get/get_navigation/get_navigation.dart';
//import 'package:get/get_navigation/src/snackbar/snackbar.dart';
//import 'package:get/get_navigation/src/snackbar/snackbar.dart';
//import 'package:get/route_manager.dart';
//import 'package:get/route_manager.dart';
import 'package:prodeck/components/button.dart';
import 'package:prodeck/pages/forgotpass.dart';

import 'home.dart';
//import 'package:prodeck/home.dart';

/*
class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;

  void togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  // Sign User in Method
  void signUserIn() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            //child: CircularProgressIndicator(),
            child: CupertinoActivityIndicator(),
          );
        });

    //Try Sign-in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      //show erros message
      showErrorlMessage(e.code);
    }
    //Pop the Loading Circle
    Navigator.pop(context);
  }

  // error Message popup
  void showErrorlMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepOrangeAccent,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),

              // Sigin in Text
              Text(
                'Sign-In',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 70),

              //Username Text field
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffE8ECF4), width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffE8ECF4), width: 1),
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

              //Password Text-field
              /* Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  enableSuggestions: false,
                  autocorrect: false,
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon:
                          const Icon(Icons.remove_red_eye, color: Colors.grey),
                      onPressed: () {},
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffE8ECF4), width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffE8ECF4), width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    fillColor: const Color(0xffFAFAFA),
                    filled: true,
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              */
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  enableSuggestions: false,
                  autocorrect: false,
                  obscureText: !_passwordVisible, // Toggle password visibility
                  controller: _passwordController,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _passwordVisible =
                              !_passwordVisible; // Toggle password visibility
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Icon(
                          CupertinoIcons.eye, // Use Cupertino icon for the eye
                          color: _passwordVisible ? Colors.blue : Colors.grey,
                        ),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xffE8ECF4), width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xffE8ECF4), width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: const Color(0xffFAFAFA),
                    filled: true,
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              //Forgot Password

              /*const Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      /* onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotPass()));
                      },*/
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: Color(0xff6A707C),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),*/

              //Forgot Password
              /*  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              */
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordScreen()),
                        );
                      },
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              //Sign-in button
              MyButton(
                text: "Sign-In",
                onTap: signUserIn,
              ),

              const SizedBox(
                height: 140,
              ),

              //Don't have an account sign up

              /* Padding(
                  padding: const EdgeInsets.fromLTRB(35, 8, 8, 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Don’t Have an account?",
                          style: TextStyle(
                            color: Color(0xff1E232C),
                            fontSize: 15,
                          )),
                      InkWell(
                        nTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()));
                        },
                        child: Text(" Sign-Up",
                            style: TextStyle(
                              color: Color(0xff35C2C1),
                              fontSize: 15,
                            )),
                      ),
                    ],
                  ),
                )*/

              //Don't have an account sign up
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
                      onTap: widget.onTap,
                      child: const Text('Sign-Up',
                          style: TextStyle(
                            color: Color(0xff35C2C1),
                            fontSize: 15,
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
*/

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;

  // Error variables
  bool _showEmailError = false;
  bool _showPasswordError = false;
  String _emailErrorMessage = '';
  String _passwordErrorMessage = '';

  void togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  // Sign User in Method
  void signUserIn() async {
    // Reset error variables
    setState(() {
      _showEmailError = false;
      _showPasswordError = false;
      _emailErrorMessage = '';
      _passwordErrorMessage = '';
    });

    // Validate email and password
    if (_emailController.text.isEmpty) {
      setState(() {
        _showEmailError = true;
        _emailErrorMessage = 'Email is required.';
      });
      return;
    }

    if (_passwordController.text.isEmpty) {
      setState(() {
        _showPasswordError = true;
        _passwordErrorMessage = 'Password is required.';
      });
      return;
    }

    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          // child: CircularProgressIndicator(),
          child: CupertinoActivityIndicator(),
        );
      },
    );

    // Try Sign-in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          _showEmailError = true;
          _emailErrorMessage = 'Incorrect email.';
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          _showPasswordError = true;
          _passwordErrorMessage = 'Incorrect password.';
        });
      }
    }

    // Pop the Loading Circle
    Navigator.pop(context);
  }

  // Error Message popup
  void showErrorlMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepOrangeAccent,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),

                // Sign in Text
                Text(
                  'Sign-In',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 70),

                // Username Text field
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10.0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffE8ECF4),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffE8ECF4),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

                // Email error message
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Visibility(
                      visible: _showEmailError,
                      child: Text(
                        _emailErrorMessage,
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText:
                        !_passwordVisible, // Toggle password visibility
                    controller: _passwordController,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _passwordVisible =
                                !_passwordVisible; // Toggle password visibility
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            CupertinoIcons
                                .eye, // Use Cupertino icon for the eye
                            color: _passwordVisible ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffE8ECF4),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffE8ECF4),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: const Color(0xffFAFAFA),
                      filled: true,
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

                // Password error message
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Visibility(
                      visible: _showPasswordError,
                      child: Text(
                        _passwordErrorMessage,
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Sign-in button
                MyButton(
                  text: "Sign-In",
                  onTap: signUserIn,
                ),

                const SizedBox(
                  height: 140,
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
                        onTap: widget.onTap,
                        child: const Text(
                          'Sign-Up',
                          style: TextStyle(
                            color: Color(0xff35C2C1),
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPage(
      onTap: () {},
    ),
  ));
}
