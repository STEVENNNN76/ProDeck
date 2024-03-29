//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prodeck/pages/auth_page.dart';
import 'package:prodeck/pages/login_or_reg.dart';
import 'package:prodeck/signin.dart';
//import 'package:prodeck/pages/welcome_screen.dart';
/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF69c5df),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            height: 700,
            child: Container(
                /* height: 700,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/background.jpg"),
                      fit: BoxFit.cover)), */
                ),
          ),
          Positioned(
              bottom: 0,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Keep Track ",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    "of ur ",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    "Productivty",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "     ________",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 25,
                      child: const Text(
                        "Turn on the time tracker , track ur "
                        "history and share ur achievements with ur friends",
                        style: TextStyle(color: Colors.white60),
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 200,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFffbc33e)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: const Color(0xFFfbc33e),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )),
                      //
                      //onPressed: () => const AuthPage(),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AuthPage(
                                      onTap: () {},
                                    )));
                      },
                      child: const Text(
                        "Get Started",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
*/

//code 2
/*
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Create slide animation
    _slideAnimation = Tween<double>(begin: 100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5),
      ),
    );

    // Create fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0),
      ),
    );

    // Add listener to rebuild the widget when animation value changes
    _fadeAnimation.addListener(() {
      setState(() {});
    });

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF69c5df),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            height: 700,
            child: Container(
                // Your image decoration goes here
                ),
          ),
          Positioned(
            bottom: 0,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: Offset(_slideAnimation.value, 0.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      "Keep Track ",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(_slideAnimation.value, 0.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      "of ur ",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(_slideAnimation.value, 0.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      "Productivity",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Transform.translate(
                  offset: Offset(_slideAnimation.value, 0.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      "     ________",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 25,
                  child: Transform.translate(
                    offset: Offset(0.0, _slideAnimation.value),
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: const Text(
                        "Turn on the time tracker, track ur "
                        "history and share ur achievements with ur friends",
                        style: TextStyle(color: Colors.white60),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Transform.translate(
                  offset: Offset(0.0, _slideAnimation.value),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Container(
                      width: 200,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFffbc33e),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: const Color(0xFFfbc33e),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AuthPage(
                                        onTap: () {},
                                      )));
                        },
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: _fadeAnimation.value == 1.0
                              ? const Text(
                                  "Get Started",
                                  style: TextStyle(color: Colors.white),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

*/

//incoperate splash screen
//code 3
/*
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Create slide animation
    _slideAnimation = Tween<double>(begin: 100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5),
      ),
    );

    // Create fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0),
      ),
    );

    // Add listener to rebuild the widget when animation value changes
    _fadeAnimation.addListener(() {
      setState(() {});
    });

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FadeTransition(
              opacity: _fadeAnimation,
              child: const Text(
                'ProDeck',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8),
            FadeTransition(
              opacity: _fadeAnimation,
              child: const Text(
                'Track your Productivity',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Create slide animation
    _slideAnimation = Tween<double>(begin: 100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5),
      ),
    );

    // Create fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0),
      ),
    );

    // Add listener to rebuild the widget when animation value changes
    _fadeAnimation.addListener(() {
      setState(() {});
    });

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF69c5df),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            height: 700,
            child: Container(
                // Your image decoration goes here
                ),
          ),
          Positioned(
            bottom: 0,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: Offset(_slideAnimation.value, 0.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      "Keep Track ",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(_slideAnimation.value, 0.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      "of ur ",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(_slideAnimation.value, 0.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      "Productivity",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Transform.translate(
                  offset: Offset(_slideAnimation.value, 0.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      "     ________",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 25,
                  child: Transform.translate(
                    offset: Offset(0.0, _slideAnimation.value),
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: const Text(
                        "Turn on the time tracker, track ur "
                        "history and share ur achievements with ur friends",
                        style: TextStyle(color: Colors.white60),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Transform.translate(
                  offset: Offset(0.0, _slideAnimation.value),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Container(
                      width: 200,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFffbc33e),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: const Color(0xFFfbc33e),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AuthPage(
                                onTap: () {},
                              ),
                            ),
                          );
                        },
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: _fadeAnimation.value == 1.0
                              ? const Text(
                                  "Get Started",
                                  style: TextStyle(color: Colors.white),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
*/

//code 4
/*
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Create slide animation
    _slideAnimation = Tween<double>(begin: 100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5),
      ),
    );

    // Create fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0),
      ),
    );

    // Add listener to rebuild the widget when animation value changes
    _fadeAnimation.addListener(() {
      setState(() {});
    });

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 254, 254),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            height: 700,
            child: Container(
                // Your image decoration goes here
                ),
          ),
          Positioned(
            bottom: 0,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: Offset(_slideAnimation.value, 0.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      "Keep Track ",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(_slideAnimation.value, 0.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      "of your ",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(_slideAnimation.value, 0.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      "Productivity",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Transform.translate(
                  offset: Offset(_slideAnimation.value, 0.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      "     ________",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 25,
                  child: Transform.translate(
                    offset: Offset(0.0, _slideAnimation.value),
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: const Text(
                        "Turn on the time tracker, track your history\n "
                        "and share ur achievements with ur friends",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Transform.translate(
                  offset: Offset(0.0, _slideAnimation.value),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Container(
                      width: 200,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: const Color.fromARGB(255, 0, 0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AuthPage(
                                        onTap: () {},
                                      )));
                        },
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: _fadeAnimation.value == 1.0
                              ? const Text(
                                  "Get Started",
                                  style: TextStyle(color: Colors.white),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
*/

//Code 5
//animations added
/*
import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Create slide animation
    _slideAnimation = Tween<double>(begin: 100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5),
      ),
    );

    // Create fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5),
      ),
    );

    // Add listener to rebuild the widget when animation value changes
    _fadeAnimation.addListener(() {
      setState(() {});
    });

    // Start the animation
    _controller.forward().whenComplete(() {
      // Delay for 1 second before transitioning to the home page
      Timer(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 1000),
            pageBuilder: (context, animation, _) {
              return FadeTransition(
                opacity: animation,
                child: MyHomePage(),
              );
            },
          ),
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _fadeAnimation,
              child: const Text(
                "ProDeck",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0.0, _slideAnimation.value),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: child,
                  ),
                );
              },
              child: const Text(
                "Track your Productivity",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Create slide animation
    _slideAnimation = Tween<double>(begin: 100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5),
      ),
    );

    // Create fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0),
      ),
    );

    // Add listener to rebuild the widget when animation value changes
    _fadeAnimation.addListener(() {
      setState(() {});
    });

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 254, 254),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            height: 700,
            child: Container(
                // Your image decoration goes here
                ),
          ),
          Positioned(
            bottom: 0,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: Offset(_slideAnimation.value, 0.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      "Keep Track ",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(_slideAnimation.value, 0.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      "of your ",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(_slideAnimation.value, 0.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      "Productivity",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Transform.translate(
                  offset: Offset(_slideAnimation.value, 0.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      "     ________",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 25,
                  child: Transform.translate(
                    offset: Offset(0.0, _slideAnimation.value),
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: const Text(
                        "Turn on the time tracker, track your history\n "
                        "and share your achievements with your friends",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Transform.translate(
                  offset: Offset(0.0, _slideAnimation.value),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Container(
                      width: 200,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: const Color.fromARGB(255, 0, 0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 1000),
                              pageBuilder: (context, animation, _) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: AuthPage(
                                    onTap: () {},
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: _fadeAnimation.value == 1.0
                              ? const Text(
                                  "Get Started",
                                  style: TextStyle(color: Colors.white),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
*/

//code 6

//current best code
/*

import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Create slide animation
    _slideAnimation = Tween<double>(begin: 100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5),
      ),
    );

    // Create fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5),
      ),
    );

    // Add listener to rebuild the widget when animation value changes
    _fadeAnimation.addListener(() {
      setState(() {});
    });

    // Start the animation
    _controller.forward().whenComplete(() {
      // Delay for 1 second before transitioning to the home page
      Timer(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 1000),
            pageBuilder: (context, animation, _) {
              return FadeTransition(
                opacity: animation,
                child: MyHomePage(),
              );
            },
          ),
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _fadeAnimation,
              child: const Text(
                "ProDeck",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0.0, _slideAnimation.value),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: child,
                  ),
                );
              },
              child: const Text(
                "Track your Productivity",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 1));
  late Animation<double> _fadeAnimation = Tween<double>(begin: 0.0, end: 0.0)
      .animate(CurvedAnimation(
          parent: _controller, curve: const Interval(0.5, 1.0)));
  late Animation<double> _slideAnimation = Tween<double>(begin: 0.0, end: 0.0)
      .animate(CurvedAnimation(
          parent: _controller, curve: const Interval(0.0, 0.5)));

  @override
  void initState() {
    super.initState();

    // Wait for 4 seconds before starting the animation
    Future.delayed(const Duration(seconds: 2), () {
      // Initialize animation values
      _slideAnimation = Tween<double>(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.0, 0.5),
        ),
      );
      _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.5, 1.0),
        ),
      );

      // Add listener to rebuild the widget when animation value changes
      _fadeAnimation.addListener(() {
        setState(() {});
      });

      // Start the animation
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 254, 254),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            height: 700,
            child: Container(
                // Your image decoration goes here
                ),
          ),
          Positioned(
            bottom: 0,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: Offset(_slideAnimation.value, 0.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      "Keep Track ",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(_slideAnimation.value, 0.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      "of your ",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(_slideAnimation.value, 0.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      "Productivity",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Transform.translate(
                  offset: Offset(_slideAnimation.value, 0.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      "     ________",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 25,
                  child: Transform.translate(
                    offset: Offset(0.0, _slideAnimation.value),
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: const Text(
                        "Turn on the time tracker, track your history\n "
                        "and share your achievements with your friends",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Transform.translate(
                  offset: Offset(0.0, _slideAnimation.value),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Container(
                      width: 200,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: const Color.fromARGB(255, 0, 0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 1000),
                              pageBuilder: (context, animation, _) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: AuthPage(
                                    onTap: () {},
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: _fadeAnimation.value == 1.0
                              ? const Text(
                                  "Get Started",
                                  style: TextStyle(color: Colors.white),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
*/

//code 7
//best working

import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Create slide animation
    _slideAnimation = Tween<double>(begin: 100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5),
      ),
    );

    // Create fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5),
      ),
    );

    // Add listener to rebuild the widget when animation value changes
    _fadeAnimation.addListener(() {
      setState(() {});
    });

    // Start the animation
    _controller.forward().whenComplete(() {
      // Delay for 1 second before transitioning to the home page
      Timer(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 1000),
            pageBuilder: (context, animation, _) {
              return FadeTransition(
                opacity: animation,
                child: MyHomePage(),
              );
            },
          ),
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Check if dark mode is enabled
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    // Define colors based on dark mode condition
    final bgColor = isDarkMode ? Colors.black : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _fadeAnimation,
              child: Text(
                "ProDeck",
                style: TextStyle(
                  fontSize: 40,
                  color: textColor,
                ),
              ),
            ),
            const SizedBox(height: 10),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0.0, _slideAnimation.value),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: child,
                  ),
                );
              },
              child: Text(
                "Track your Productivity",
                style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//try

//do

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 1));
  late Animation<double> _fadeAnimation = Tween<double>(begin: 0.0, end: 0.0)
      .animate(CurvedAnimation(
          parent: _controller, curve: const Interval(0.5, 1.0)));
  late Animation<double> _slideAnimation = Tween<double>(begin: 0.0, end: 0.0)
      .animate(CurvedAnimation(
          parent: _controller, curve: const Interval(0.0, 0.5)));

  @override
  void initState() {
    super.initState();

    // Wait for 4 seconds before starting the animation
    Future.delayed(const Duration(seconds: 2), () {
      // Initialize animation values
      _slideAnimation = Tween<double>(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.0, 0.5),
        ),
      );
      _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.5, 1.0),
        ),
      );

      // Add listener to rebuild the widget when animation value changes
      _fadeAnimation.addListener(() {
        setState(() {});
      });

      // Start the animation
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Check if dark mode is enabled
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    // Define colors based on dark mode condition
    final bgColor =
        isDarkMode ? Colors.black : const Color.fromARGB(255, 253, 254, 254);
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final buttonColor = isDarkMode ? Colors.white : Colors.black;
    final topBarColor = isDarkMode ? Colors.grey[800] : Colors.grey[300];

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            height: 700,
            child: Container(
              color: topBarColor,
              // Your image decoration goes here
            ),
          ),
          Positioned(
            bottom: 0,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: Offset(_slideAnimation.value, 0.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Text(
                      "Keep Track ",
                      style: TextStyle(
                        fontSize: 32,
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(_slideAnimation.value, 0.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Text(
                      "of your ",
                      style: TextStyle(
                        fontSize: 32,
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(_slideAnimation.value, 0.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Text(
                      "Productivity",
                      style: TextStyle(
                        fontSize: 32,
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Transform.translate(
                  offset: Offset(_slideAnimation.value, 0.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Text(
                      "     ________",
                      style: TextStyle(
                        fontSize: 25,
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 25,
                  child: Transform.translate(
                    offset: Offset(0.0, _slideAnimation.value),
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Text(
                        "Turn on the time tracker, track your history\n "
                        "and share your achievements with your friends",
                        style: TextStyle(color: textColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Transform.translate(
                  offset: Offset(0.0, _slideAnimation.value),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Container(
                      width: 200,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: buttonColor,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 1000),
                              pageBuilder: (context, animation, _) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: AuthPage(
                                    onTap: () {},
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: _fadeAnimation.value == 1.0
                              ? Text(
                                  "Get Started",
                                  style: TextStyle(
                                      color: isDarkMode
                                          ? Colors.black
                                          : Colors.white),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
