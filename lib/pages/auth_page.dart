import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prodeck/home.dart';
import 'package:prodeck/pages/login_or_reg.dart';
import 'package:prodeck/signin.dart';
import 'package:prodeck/pages/my_home_page.dart';
import 'package:prodeck/pages/forgotpass.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key, required Null Function() onTap});

  /* void forgotPassword(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ForgotPasswordScreen(
        key: UniqueKey(),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    ));
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //User Logged in

          if (snapshot.hasData) {
            return const HomeScreen();
          }

          //User not Logged in

          else {
            return const LoginOrReg();
          }
        },
      ),
    );
  }
}
