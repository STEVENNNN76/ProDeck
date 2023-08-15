import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:prodeck/Hive%20Drop/drop_task.dart';
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
import 'Hive Drop/box.dart';
import 'Services/notifi_service.dart';

import 'Task/test2.dart';
import 'dynamic/dynamic.dart';
import 'firebase_options.dart';
import 'package:prodeck/timer.dart';
import 'package:prodeck/pages/forgotpass.dart';
import 'package:prodeck/pages/task_page.dart';
import 'package:prodeck/pages/profile_page.dart';

import 'notifi.dart';
import 'pages/Statistics_page.dart';
import 'pages/mode_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //home: StopwatchApp(),
      // home: StatisticsPage(),
      home: SplashScreen(),
      //home: DeleteBoxesPage(),
      //home: TaskList(),
      //home: DetailsPage()
      //home: CalenderView(),
      //home: MyHomePage(),
      //home: WorkPage(),
      //home: WelcomeScreen(),
      //home: LoginPage(),
      //home: AuthPage(),
      //home: TimerScreen(),
      // home: ForgotPasswordScreen(),
      // home: ProfilePage(),
      // home: TaskListPage(),
      //home: TaskPage(),
      // home: SignUpPage(),
      //home: ForgotPass(),
      //home: HomeScreen(),
      //home: ProfilePage(),
    );
  }
}
