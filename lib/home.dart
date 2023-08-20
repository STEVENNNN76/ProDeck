/*

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prodeck/pages/activity_page.dart';
import 'package:prodeck/timer.dart';
import 'package:prodeck/pages/profile_page.dart';
import 'package:prodeck/pages/logout_page.dart';
import 'package:prodeck/pages/task_page.dart';
import 'package:prodeck/pages/activity_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  Widget _buildDateText() {
    final now = DateTime.now();
    const TextStyle bigNumberStyle = TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold,
    );
    const TextStyle lightTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );
    const TextStyle boldTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              '${now.day}',
              style: bigNumberStyle,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('EEEE').format(now),
                  style: lightTextStyle,
                ),
                const SizedBox(height: 4),
                Text(
                  DateFormat('MMM yyyy').format(now),
                  style: boldTextStyle,
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
                // builder: (context) => const LogoutPage(),
              ),
            );
          },
          child: const CircleAvatar(
            radius: 28.0,
            // backgroundImage: AssetImage('assets/images/profile.png'),
          ),
        ),
      ],
    );
  }

  Widget _buildDayOfWeekRow() {
    final now = DateTime.now();
    final weekDays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (var i = 0; i < 7; i++)
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: i == now.weekday - 1 ? Colors.white : Colors.grey[300],
              ),
              child: Center(
                child: Text(
                  weekDays[i],
                  style: TextStyle(
                    fontWeight: i == now.weekday - 1
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat.yMMMMd().format(_selectedDate);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: _buildDateText(),
            ),
            _buildDayOfWeekRow(),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskPage(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Activity',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ActivityPage(),
                  ),
                );
              },
              child: Container(
                width: 390,
                height: 150,
                margin: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                child: const Card(
                  child: Center(
                    child: Text(
                      'Your activity goes here',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'To-Do',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskPage(),
                  ),
                );
              },
              child: Container(
                width: 390,
                height: 105,
                margin: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                child: const Card(
                  child: Center(
                    child: Text(
                      'Tap here to go to TaskPage',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Active Goals',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TaskPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Show More',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 150,
                    height: 60,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.0),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text(
                        'Card 1',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 150,
                    height: 60,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text(
                        'Card 2',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
*/
//code 2
/*
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  Widget _buildDateText() {
    final now = DateTime.now();
    const TextStyle bigNumberStyle = TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold,
    );
    const TextStyle lightTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );
    const TextStyle boldTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              '${now.day}',
              style: bigNumberStyle,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('EEEE').format(now),
                  style: lightTextStyle,
                ),
                const SizedBox(height: 4),
                Text(
                  DateFormat('MMM yyyy').format(now),
                  style: boldTextStyle,
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                // builder: (context) => ProfileScreen(),
                builder: (context) => const LogoutPage(),
              ),
            );
          },
          child: const CircleAvatar(
            radius: 28.0,
            // backgroundImage: AssetImage('assets/images/profile.png'),
          ),
        ),
      ],
    );
  }

  Widget _buildDayOfWeekRow() {
    final now = DateTime.now();
    final weekDays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (var i = 0; i < 7; i++)
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: i == now.weekday - 1 ? Colors.white : Colors.grey[300],
              ),
              child: Center(
                child: Text(
                  weekDays[i],
                  style: TextStyle(
                    fontWeight: i == now.weekday - 1
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat.yMMMMd().format(_selectedDate);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white, // Set the background color to card color
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: _buildDateText(),
              ),
              _buildDayOfWeekRow(),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TaskPage(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Activity',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ActivityPage(),
                    ),
                  );
                },
                child: Container(
                  width: 390,
                  height: 150,
                  margin: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color:
                        Colors.white, // Set the card color to background color
                  ),
                  child: const Card(
                    child: Center(
                      child: Text(
                        'Your activity goes here',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'To-Do',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TaskPage(),
                    ),
                  );
                },
                child: Container(
                  width: 390,
                  height: 105,
                  margin: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color:
                        Colors.white, // Set the card color to background color
                  ),
                  child: const Card(
                    child: Center(
                      child: Text(
                        'Tap here to go to TaskPage',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Active Goals',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TaskPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Show More',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TaskPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 180,
                      height: 60,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.0),
                        color: Colors
                            .white, // Set the card color to background color
                      ),
                      child: const Center(
                        child: Text(
                          'Card 1',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TaskPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 180,
                      height: 60,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors
                            .white, // Set the card color to background color
                      ),
                      child: const Center(
                        child: Text(
                          'Card 2',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TaskPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 180,
                      height: 60,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors
                            .white, // Set the card color to background color
                      ),
                      child: const Center(
                        child: Text(
                          'Card 3',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TaskPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 180,
                      height: 60,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors
                            .white, // Set the card color to background color
                      ),
                      child: const Center(
                        child: Text(
                          'Card 4',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
*/

//code 4
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prodeck/pages/activity_page.dart';
import 'package:prodeck/timer.dart';
import 'package:prodeck/pages/profile_page.dart';
import 'package:prodeck/pages/logout_page.dart';
import 'package:prodeck/pages/task_page.dart';
import 'package:prodeck/pages/activity_page.dart';

import 'pages/mode_page.dart';
import 'pages/selector_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  Widget _buildDateText() {
    final now = DateTime.now();
    const TextStyle bigNumberStyle = TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold,
    );
    const TextStyle lightTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );
    const TextStyle boldTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const SelectorPage(), // Replace with your desired calendar page
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '${now.day}',
                style: bigNumberStyle,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('EEEE').format(now),
                    style: lightTextStyle,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('MMM yyyy').format(now),
                    style: boldTextStyle,
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SelectorPage(),
                ),
              );
            },
            child: const CircleAvatar(
              radius: 28.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayOfWeekRow() {
    final now = DateTime.now();
    final weekDays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (var i = 0; i < 7; i++)
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: i == now.weekday - 1 ? Colors.white : Colors.grey[300],
              ),
              child: Center(
                child: Text(
                  weekDays[i],
                  style: TextStyle(
                    fontWeight: i == now.weekday - 1
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat.yMMMMd().format(_selectedDate);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: _buildDateText(),
            ),
            _buildDayOfWeekRow(),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskPage(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Activity',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ActivityPage(),
                  ),
                );
              },
              child: Container(
                width: 390,
                height: 130,
                margin: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                child: const Card(
                  child: Center(
                    child: Text(
                      'Your activity goes here',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'To-Do',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskPage(),
                  ),
                );
              },
              child: Container(
                width: 390,
                height: 105,
                margin: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                child: const Card(
                  child: Center(
                    child: Text(
                      'Tap here to go to TaskPage',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Focus',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ModePage(), //name changed to focus
                        ),
                      );
                    },
                    child: const Text(
                      'Show More',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ModePage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 170,
                    height: 75,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: const Row(
                      children: [
                        SizedBox(width: 5),
                        Icon(
                          CupertinoIcons.book_fill,
                          color: Colors.orange,
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Reading',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 170,
                    height: 75,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: const Row(
                      children: [
                        SizedBox(width: 5),
                        Icon(
                          IconData(0xe28d, fontFamily: 'MaterialIcons'),
                          color: Colors.green,
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Fitness',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
// const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 170,
                    height: 75,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: const Row(
                      children: [
                        SizedBox(width: 5),
                        Icon(
                          IconData(0xf5ee,
                              fontFamily: CupertinoIcons.iconFont,
                              fontPackage: CupertinoIcons.iconFontPackage),
                          color: Colors.blue,
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Mindfulness',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 170,
                    height: 75,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: const Row(
                      children: [
                        SizedBox(width: 5),
                        Icon(
                          IconData(0xf625,
                              fontFamily: CupertinoIcons.iconFont,
                              fontPackage: CupertinoIcons.iconFontPackage),
                          color: Colors.red,
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Work',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/

//code 5
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prodeck/pages/activity_page.dart';
import 'package:prodeck/timer.dart';
import 'package:prodeck/pages/profile_page.dart';
import 'package:prodeck/pages/logout_page.dart';
import 'package:prodeck/pages/task_page.dart';
import 'package:prodeck/pages/activity_page.dart';

import 'calender/calender.dart';
import 'pages/mode_page.dart';
import 'pages/selector_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  Widget _buildDateText() {
    final now = DateTime.now();
    const TextStyle bigNumberStyle = TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold,
    );
    const TextStyle lightTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );
    const TextStyle boldTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CalendarPage(),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '${now.day}',
                style: bigNumberStyle,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('EEEE').format(now),
                    style: lightTextStyle,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('MMM yyyy').format(now),
                    style: boldTextStyle,
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SelectorPage(),
                ),
              );
            },
            child: const CircleAvatar(
              radius: 25.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayOfWeekRow() {
    final now = DateTime.now();
    final weekDays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (var i = 0; i < 7; i++)
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: i == now.weekday - 1 ? Colors.white : Colors.grey[300],
              ),
              child: Center(
                child: Text(
                  weekDays[i],
                  style: TextStyle(
                    fontWeight: i == now.weekday - 1
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat.yMMMMd().format(_selectedDate);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: _buildDateText(),
            ),
            _buildDayOfWeekRow(),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TaskPage(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Activity',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Complete tasks every day, see your stats soar',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ActivityPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 390,
                      height: 130,
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Today's Activity",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                '0:00',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'of your 30 min goal',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'To-Do',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TaskPage(),
                  ),
                );
              },
              child: Container(
                width: 390,
                height: 100,
                margin: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                ),
                child: const Card(
                  child: Center(
                    child: Text(
                      'Tap here to go to TaskPage',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Focus',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ModePage(), //name changed to focus
                        ),
                      );
                    },
                    child: const Text(
                      'Show More',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ModePage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 160,
                    height: 75,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: const Row(
                      children: [
                        SizedBox(width: 5),
                        Icon(
                          CupertinoIcons.book_fill,
                          color: Colors.orange,
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Reading',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TaskPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 160,
                    height: 75,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: const Row(
                      children: [
                        SizedBox(width: 5),
                        Icon(
                          IconData(0xe28d, fontFamily: 'MaterialIcons'),
                          color: Colors.green,
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Fitness',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
// const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TaskPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 160,
                    height: 75,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: const Row(
                      children: [
                        SizedBox(width: 5),
                        Icon(
                          IconData(0xf5ee,
                              fontFamily: CupertinoIcons.iconFont,
                              fontPackage: CupertinoIcons.iconFontPackage),
                          color: Colors.blue,
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Mindfulness',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TaskPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 160,
                    height: 75,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: const Row(
                      children: [
                        SizedBox(width: 5),
                        Icon(
                          IconData(0xf625,
                              fontFamily: CupertinoIcons.iconFont,
                              fontPackage: CupertinoIcons.iconFontPackage),
                          color: Colors.red,
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Work',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/

//code 17
//best working code
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prodeck/pages/activity_page.dart';
import 'package:prodeck/timer.dart';
import 'package:prodeck/pages/profile_page.dart';
import 'package:prodeck/pages/logout_page.dart';
import 'package:prodeck/pages/task_page.dart';
import 'package:prodeck/pages/activity_page.dart';

import 'calender/calender.dart';
import 'pages/mode_page.dart';
import 'pages/selector_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  Widget _buildDateText() {
    final now = DateTime.now();
    const TextStyle bigNumberStyle = TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold,
    );
    const TextStyle lightTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );
    const TextStyle boldTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CalendarPage(),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '${now.day}',
                style: bigNumberStyle,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('EEEE').format(now),
                    style: lightTextStyle,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('MMM yyyy').format(now),
                    style: boldTextStyle,
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SelectorPage(),
                ),
              );
            },
            child: const CircleAvatar(
              radius: 25.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayOfWeekRow() {
    final now = DateTime.now();
    final weekDays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (var i = 0; i < 7; i++)
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: i == now.weekday - 1 ? Colors.white : Colors.grey[300],
              ),
              child: Center(
                child: Text(
                  weekDays[i],
                  style: TextStyle(
                    fontWeight: i == now.weekday - 1
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat.yMMMMd().format(_selectedDate);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: _buildDateText(),
            ),
            _buildDayOfWeekRow(),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskList(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Activity',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Complete tasks every day, see your stats soar',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ActivityPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 390,
                      height: 130,
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Today's Activity",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                '0:00',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'of your 30 min goal',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskList(),
                      ),
                    );
                  },
                  child: Container(
                    width: 160,
                    height: 100,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.yellow[200],
                            child: Icon(
                              CupertinoIcons.collections_solid,
                              color: Colors.orangeAccent[200],
                              size: 40,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Tasks',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskList(),
                      ),
                    );
                  },
                  child: Container(
                    width: 160,
                    height: 100,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.cyan[200],
                            child: const Icon(
                              CupertinoIcons.graph_square_fill,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Statistics',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Focus',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ModePage(), //name changed to focus
                        ),
                      );
                    },
                    child: const Text(
                      'Show More',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ModePage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 175,
                    height: 75,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 5),
                        CircleAvatar(
                          backgroundColor: Colors.orange.withOpacity(0.3),
                          child: const Icon(
                            CupertinoIcons.book_fill,
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'Reading',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskList(),
                      ),
                    );
                  },
                  child: Container(
                    width: 175,
                    height: 75,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 5),
                        CircleAvatar(
                          backgroundColor: Colors.green.withOpacity(0.3),
                          child: const Icon(
                            IconData(0xe28d, fontFamily: 'MaterialIcons'),
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'Fitness',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

// const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskList(),
                      ),
                    );
                  },
                  child: Container(
                    width: 175,
                    height: 75,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 5),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.lightBlue.withOpacity(0.3),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              IconData(0xf5ee,
                                  fontFamily: CupertinoIcons.iconFont,
                                  fontPackage: CupertinoIcons.iconFontPackage),
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'Mindfulness',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskList(),
                      ),
                    );
                  },
                  child: Container(
                    width: 175,
                    height: 75,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 5),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.redAccent.withOpacity(0.3),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              IconData(0xf625,
                                  fontFamily: CupertinoIcons.iconFont,
                                  fontPackage: CupertinoIcons.iconFontPackage),
                              color: Colors.red,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'Work',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
*/

//code 18

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prodeck/pages/activity_page.dart';
import 'package:prodeck/timer.dart';
import 'package:prodeck/pages/profile_page.dart';
import 'package:prodeck/pages/logout_page.dart';
import 'package:prodeck/pages/task_page.dart';
import 'package:prodeck/pages/activity_page.dart';

import 'calender/calender.dart';
import 'pages/Statistics_page.dart';
import 'pages/mode_page.dart';
import 'pages/selector_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  Widget _buildDateText() {
    final now = DateTime.now();
    const TextStyle bigNumberStyle = TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold,
    );
    const TextStyle lightTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );
    const TextStyle boldTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CalendarPage(),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '${now.day}',
                style: bigNumberStyle,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('EEEE').format(now),
                    style: lightTextStyle,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('MMM yyyy').format(now),
                    style: boldTextStyle,
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SelectorPage(),
                ),
              );
            },
            child: const CircleAvatar(
              radius: 25.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayOfWeekRow() {
    final now = DateTime.now();
    final weekDays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (var i = 0; i < 7; i++)
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: i == now.weekday - 1 ? Colors.white : Colors.grey[300],
              ),
              child: Center(
                child: Text(
                  weekDays[i],
                  style: TextStyle(
                    fontWeight: i == now.weekday - 1
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat.yMMMMd().format(_selectedDate);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: _buildDateText(),
            ),
            _buildDayOfWeekRow(),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TaskList(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Activity',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Complete tasks every day, see your stats soar',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ActivityPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 390,
                      height: 130,
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Today's Activity",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                '0:00',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'of your 30 min goal',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TaskList(),
                      ),
                    );
                  },
                  child: Container(
                    width: 160,
                    height: 100,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.yellow[200],
                            child: Icon(
                              CupertinoIcons.collections_solid,
                              color: Colors.orangeAccent[200],
                              size: 40,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Tasks',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StatisticsPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 160,
                    height: 100,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.cyan[200],
                            child: const Icon(
                              CupertinoIcons.graph_square_fill,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Statistics',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Focus',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ModePage(), //name changed to focus
                        ),
                      );
                    },
                    child: const Text(
                      'Show More',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Reading(),
                      ),
                    );
                  },
                  child: Container(
                    width: 160,
                    height: 75,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 5),
                        CircleAvatar(
                          backgroundColor: Colors.orange.withOpacity(0.3),
                          child: const Icon(
                            CupertinoIcons.book_fill,
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'Reading',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Fitness(),
                      ),
                    );
                  },
                  child: Container(
                    width: 160,
                    height: 75,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 5),
                        CircleAvatar(
                          backgroundColor: Colors.green.withOpacity(0.3),
                          child: const Icon(
                            IconData(0xe28d, fontFamily: 'MaterialIcons'),
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'Fitness',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

// const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Mindfullness(),
                      ),
                    );
                  },
                  child: Container(
                    width: 160,
                    height: 75,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 5),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.lightBlue.withOpacity(0.3),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              IconData(0xf5ee,
                                  fontFamily: CupertinoIcons.iconFont,
                                  fontPackage: CupertinoIcons.iconFontPackage),
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'Mindfulness',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const work(),
                      ),
                    );
                  },
                  child: Container(
                    width: 160,
                    height: 75,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 5),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.redAccent.withOpacity(0.3),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              IconData(0xf625,
                                  fontFamily: CupertinoIcons.iconFont,
                                  fontPackage: CupertinoIcons.iconFontPackage),
                              color: Colors.red,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'Work',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//focus
//Reading
class Reading extends StatefulWidget {
  const Reading({super.key});

  @override
  _ReadingState createState() => _ReadingState();
}

class _ReadingState extends State<Reading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CupertinoButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    CupertinoIcons.back,
                    size: 30,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Focus',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Reading', // Changed from 'Choose your Focus'
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('tasks')
                    .where('focus', isEqualTo: 'reading')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.data == null) {
                    return const Center(child: Text('No data available.'));
                  }

                  List<Widget> taskCards = snapshot.data!.docs
                      .map((DocumentSnapshot<Map<String, dynamic>> document) {
                    Map<String, dynamic>? taskData = document.data();
                    if (taskData == null) {
                      return const SizedBox(); // Skip rendering if data is null
                    }

                    // Safely access the fields using ?. operator
                    String taskName = taskData['taskName'] as String? ?? '';
                    String reminder = taskData['reminder'] as String? ?? '';

                    // Convert 'date' Timestamp to a DateTime object and format it as a string
                    Timestamp dateTimestamp = taskData['date'] as Timestamp? ??
                        Timestamp(0, 0); // Provide a default value
                    DateTime dateTime = dateTimestamp.toDate();
                    String formattedDate = DateFormat.yMMMMd().format(dateTime);

                    // Convert 'time' Timestamp to a DateTime object and format it as a string
                    Timestamp timeTimestamp = taskData['time'] as Timestamp? ??
                        Timestamp(0, 0); // Provide a default value
                    DateTime timeDateTime = timeTimestamp.toDate();
                    String formattedTime = DateFormat.Hm()
                        .format(timeDateTime); // Example format "17:30"

                    return Container(
                      width: 390,
                      height: 105,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            taskName,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Reminder: $reminder',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Date: $formattedDate',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Time: $formattedTime',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList();

                  return ListView(
                    children: taskCards,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Fitness
class Fitness extends StatefulWidget {
  const Fitness({super.key});

  @override
  _FitnessState createState() => _FitnessState();
}

class _FitnessState extends State<Fitness> {
  // Change from `Reading` to `Fitness`
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CupertinoButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    CupertinoIcons.back,
                    size: 30,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Focus',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Fitness', // Changed from 'Choose your Focus'
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('tasks')
                    .where('focus', isEqualTo: 'fitness')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.data == null) {
                    return const Center(child: Text('No data available.'));
                  }

                  List<Widget> taskCards = snapshot.data!.docs
                      .map((DocumentSnapshot<Map<String, dynamic>> document) {
                    Map<String, dynamic>? taskData = document.data();
                    if (taskData == null) {
                      return const SizedBox(); // Skip rendering if data is null
                    }

                    // Safely access the fields using ?. operator
                    String taskName = taskData['taskName'] as String? ?? '';
                    String reminder = taskData['reminder'] as String? ?? '';

                    // Convert 'date' Timestamp to a DateTime object and format it as a string
                    Timestamp dateTimestamp = taskData['date'] as Timestamp? ??
                        Timestamp(0, 0); // Provide a default value
                    DateTime dateTime = dateTimestamp.toDate();
                    String formattedDate = DateFormat.yMMMMd().format(dateTime);

                    // Convert 'time' Timestamp to a DateTime object and format it as a string
                    Timestamp timeTimestamp = taskData['time'] as Timestamp? ??
                        Timestamp(0, 0); // Provide a default value
                    DateTime timeDateTime = timeTimestamp.toDate();
                    String formattedTime = DateFormat.Hm()
                        .format(timeDateTime); // Example format "17:30"

                    return Container(
                      width: 390,
                      height: 105,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            taskName,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Reminder: $reminder',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Date: $formattedDate',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Time: $formattedTime',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList();

                  return ListView(
                    children: taskCards,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Mindfullness
class Mindfullness extends StatefulWidget {
  const Mindfullness({super.key});

  @override
  _MindfullnessState createState() => _MindfullnessState();
}

class _MindfullnessState extends State<Mindfullness> {
  // Change from `Reading` to `Fitness`
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CupertinoButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    CupertinoIcons.back,
                    size: 30,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Focus',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Mindfullness', // Changed from 'Choose your Focus'
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('tasks')
                    .where('focus', isEqualTo: 'mindfullness')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.data == null) {
                    return const Center(child: Text('No data available.'));
                  }

                  List<Widget> taskCards = snapshot.data!.docs
                      .map((DocumentSnapshot<Map<String, dynamic>> document) {
                    Map<String, dynamic>? taskData = document.data();
                    if (taskData == null) {
                      return const SizedBox(); // Skip rendering if data is null
                    }

                    // Safely access the fields using ?. operator
                    String taskName = taskData['taskName'] as String? ?? '';
                    String reminder = taskData['reminder'] as String? ?? '';

                    // Convert 'date' Timestamp to a DateTime object and format it as a string
                    Timestamp dateTimestamp = taskData['date'] as Timestamp? ??
                        Timestamp(0, 0); // Provide a default value
                    DateTime dateTime = dateTimestamp.toDate();
                    String formattedDate = DateFormat.yMMMMd().format(dateTime);

                    // Convert 'time' Timestamp to a DateTime object and format it as a string
                    Timestamp timeTimestamp = taskData['time'] as Timestamp? ??
                        Timestamp(0, 0); // Provide a default value
                    DateTime timeDateTime = timeTimestamp.toDate();
                    String formattedTime = DateFormat.Hm()
                        .format(timeDateTime); // Example format "17:30"

                    return Container(
                      width: 390,
                      height: 105,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            taskName,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Reminder: $reminder',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Date: $formattedDate',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Time: $formattedTime',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList();

                  return ListView(
                    children: taskCards,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//work

class work extends StatefulWidget {
  const work({super.key});

  @override
  _workState createState() => _workState();
}

class _workState extends State<work> {
  // Change from `Reading` to `Fitness`
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CupertinoButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    CupertinoIcons.back,
                    size: 30,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Focus',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'work', // Changed from 'Choose your Focus'
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('tasks')
                    .where('focus', isEqualTo: 'mindfullness')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.data == null) {
                    return const Center(child: Text('No data available.'));
                  }

                  List<Widget> taskCards = snapshot.data!.docs
                      .map((DocumentSnapshot<Map<String, dynamic>> document) {
                    Map<String, dynamic>? taskData = document.data();
                    if (taskData == null) {
                      return const SizedBox(); // Skip rendering if data is null
                    }

                    // Safely access the fields using ?. operator
                    String taskName = taskData['taskName'] as String? ?? '';
                    String reminder = taskData['reminder'] as String? ?? '';

                    // Convert 'date' Timestamp to a DateTime object and format it as a string
                    Timestamp dateTimestamp = taskData['date'] as Timestamp? ??
                        Timestamp(0, 0); // Provide a default value
                    DateTime dateTime = dateTimestamp.toDate();
                    String formattedDate = DateFormat.yMMMMd().format(dateTime);

                    // Convert 'time' Timestamp to a DateTime object and format it as a string
                    Timestamp timeTimestamp = taskData['time'] as Timestamp? ??
                        Timestamp(0, 0); // Provide a default value
                    DateTime timeDateTime = timeTimestamp.toDate();
                    String formattedTime = DateFormat.Hm()
                        .format(timeDateTime); // Example format "17:30"

                    return Container(
                      width: 390,
                      height: 105,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            taskName,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Reminder: $reminder',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Date: $formattedDate',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Time: $formattedTime',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList();

                  return ListView(
                    children: taskCards,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
