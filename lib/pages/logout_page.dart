import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prodeck/pages/auth_page.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  final user = FirebaseAuth.instance.currentUser;

  // Sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoButton(
          child: const Text("Logout"),
          onPressed: () {
            signUserOut();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AuthPage(
                        onTap: () {},
                      )),
            );
          },
        ),
      ),
    );
  }
}


// emergency log out
/*

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prodeck/pages/auth_page.dart';
import 'package:prodeck/pages/login_or_reg.dart';
import 'package:prodeck/pages/my_home_page.dart';
import 'package:prodeck/signin.dart';
//import 'package:prodeck/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser;

// sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
      ]),
      body: Center(
          child: ElevatedButton(
        child: const Text("Logout "),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AuthPage()));
        },
      )),
    );
  }
}
*/