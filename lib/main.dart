import 'package:flutter/material.dart';
import 'package:prodeck/home.dart';
import 'package:prodeck/pages/auth_page.dart';
import 'package:prodeck/signin.dart';
//import 'package:prodeck/pages/forgot_pass.dart';
import 'package:prodeck/pages/my_home_page.dart';
//import 'package:prodeck/pages/welcome_screen.dart';
//import 'package:prodeck/signup.dart';
//import 'package:flutter_cubit/pages/wecome_page.dart';
//import 'package:flutter/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prodeck/signup.dart';
import 'calender/calender_home.dart';
import 'calender/calender_view.dart';
import 'firebase_options.dart';
import 'package:prodeck/timer.dart';
import 'package:prodeck/pages/forgotpass.dart';
import 'package:prodeck/pages/task_page.dart';
import 'package:prodeck/pages/profile_page.dart';

import 'pages/mode_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      //home: CalenderView(),
      //home: MyHomePage(),
      //home: WorkPage(),
      //home: WelcomeScreen(),
      //home: LoginPage(),
      //home: AuthPage(),
      // home: TimerScreen(),
      // home: ForgotPasswordScreen(),
      // home: ProfilePage(),
      //home: TaskListPage(),
      //home: TaskPage(),
      // home: SignUpPage(),
      //home: ForgotPass(),
      //home: HomeScreen(),
      //home: ProfilePage(),
    );
  }
}
