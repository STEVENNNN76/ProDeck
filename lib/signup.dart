import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:prodeck/components/button.dart';
import 'package:prodeck/home.dart';

/*
class SignUpPage extends StatefulWidget {
  final Function()? onTap;
  const SignUpPage({super.key, required this.onTap});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  void togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  // Sign User in Method
  void signUserUp() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            //child: CircularProgressIndicator(),
            child: CupertinoActivityIndicator(),
          );
        });

    //Try Creating the user
    try {
      //Check if password is confirmed
      if (_passwordController.text == _confirmpasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
      } else {
        // show error message , passwords don't match
        showErrorlMessage("passwords don't match");
      }
    } on FirebaseAuthException catch (e) {
      //show error message
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
                'Sign-Up',
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
                    hintText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              //Password Text-field
              /*Padding(
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
              //Password Text-field

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

              //Confirm Password Text-Field
              /*
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  enableSuggestions: false,
                  autocorrect: false,
                  obscureText: true,
                  controller: _confirmpasswordController,
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
                    hintText: "Confirm Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              */
              //Confirm Password Text-Field
              /*
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  enableSuggestions: false,
                  autocorrect: false,
                  obscureText: !_passwordVisible, // Toggle password visibility
                  controller: _confirmpasswordController,
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
                    hintText: "Confirm Password",
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
                  obscureText:
                      !_confirmPasswordVisible, // Toggle confirm password visibility
                  controller: _confirmpasswordController,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _confirmPasswordVisible =
                              !_confirmPasswordVisible; // Toggle confirm password visibility
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Icon(
                          CupertinoIcons.eye, // Use Cupertino icon for the eye
                          color: _confirmPasswordVisible
                              ? Colors.blue
                              : Colors.grey,
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
                    hintText: "Confirm Password",
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
              /* Padding(
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
              ),*/
              const SizedBox(height: 30),

              //Sign-in button
              MyButton(
                text: "Sign-Up",
                onTap: signUserUp,
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
                      "Already Have an account?",
                      style: TextStyle(
                        color: Color(0xff1E232C),
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text('Login',
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
/*
class SignUpPage extends StatefulWidget {
  final Function()? onTap;
  const SignUpPage({Key? key, required this.onTap}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  String _errorMessage = '';

  void togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      },
    );

    try {
      if (_passwordController.text == _confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
      } else {
        setState(() {
          _errorMessage = "Passwords don't match";
        });
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.code;
      });
    }

    Navigator.pop(context);
  }

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
                Text(
                  'Sign-Up',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffE8ECF4), width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffE8ECF4), width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
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
                    obscureText: !_passwordVisible,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            CupertinoIcons.eye,
                            color: _passwordVisible ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffE8ECF4), width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffE8ECF4), width: 1),
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
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.visiblePassword,
                        enableSuggestions: false,
                        autocorrect: false,
                        obscureText: !_confirmPasswordVisible,
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _confirmPasswordVisible =
                                    !_confirmPasswordVisible;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Icon(
                                CupertinoIcons.eye,
                                color: _confirmPasswordVisible
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffE8ECF4), width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffE8ECF4), width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: const Color(0xffFAFAFA),
                          filled: true,
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      if (_errorMessage.isNotEmpty)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, left: 12.0),
                            child: Text(
                              _errorMessage,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                MyButton(
                  text: "Sign-Up",
                  onTap: signUserUp,
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
                        "Already Have an account?",
                        style: TextStyle(
                          color: Color(0xff1E232C),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Color(0xff35C2C1),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SignUpPage extends StatefulWidget {
  final Function()? onTap;
  const SignUpPage({Key? key, required this.onTap});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  String? _emailError;
  String? _errorMessage;

  void togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      },
    );

    try {
      if (_passwordController.text == _confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
      } else {
        setState(() {
          _emailError = null;
          _errorMessage = "Passwords don't match";
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        setState(() {
          _emailError = "Email already exists";
          _errorMessage = null;
        });
      } else {
        setState(() {
          _emailError = null;
          _errorMessage = e.code;
        });
      }
    }

    Navigator.pop(context);
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
                Text(
                  'Sign-Up',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10.0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffE8ECF4), width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffE8ECF4), width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorText: _emailError,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 25.0),
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: !_passwordVisible,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            CupertinoIcons.eye,
                            color: _passwordVisible ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffE8ECF4), width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffE8ECF4), width: 1),
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10.0),
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: !_confirmPasswordVisible,
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _confirmPasswordVisible = !_confirmPasswordVisible;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            CupertinoIcons.eye,
                            color: _confirmPasswordVisible
                                ? Colors.blue
                                : Colors.grey,
                          ),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffE8ECF4), width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffE8ECF4), width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: const Color(0xffFAFAFA),
                      filled: true,
                      hintText: "Confirm Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                //Sign-in button
                MyButton(
                  text: "Sign-Up",
                  onTap: signUserUp,
                ),

                const SizedBox(height: 140),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already Have an account?",
                        style: TextStyle(
                          color: Color(0xff1E232C),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Color(0xff35C2C1),
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
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
    home: SignUpPage(
      onTap: () {},
    ),
  ));
}
