/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prodeck/pages/task_page.dart';
import 'package:prodeck/timer.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 20.0),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Task',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.systemBlue,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const TimerScreen(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: Container(
                    height: 122.0,
                    width: 400.0,
                    child: Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '00 : 32 : 10',
                              style: TextStyle(
                                fontSize: 37.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              child: const Icon(CupertinoIcons.right_chevron),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => const TimerScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: const [
                        Text(
                          'See More',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Icon(
                          CupertinoIcons.right_chevron,
                          size: 16.0,
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const TaskPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
//code 2 works the best

/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prodeck/pages/task_page.dart';
import 'package:prodeck/timer.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // Set background color to white
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 20.0),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Task',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.systemBlue,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const TimerScreen(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: Container(
                    height: 122.0,
                    width: 400.0,
                    child: Card(
                      color:
                          const Color(0xFFF6F5F8), // Set card color to #F6F5F8
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '00 : 32 : 10',
                              style: TextStyle(
                                fontSize: 37.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              child: const Icon(CupertinoIcons.right_chevron),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => const TimerScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Row(
                      children: [
                        Text(
                          'See More',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Icon(
                          CupertinoIcons.right_chevron,
                          size: 16.0,
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => TaskPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
//Code 3
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prodeck/pages/task_page.dart';
import 'package:prodeck/timer.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // Set background color to white
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 20.0),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Task',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.systemBlue,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const TimerScreen(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: Container(
                    height: 122.0,
                    width: 400.0,
                    child: Card(
                      color:
                          const Color(0xFFF6F5F8), // Set card color to #F6F5F8
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '00 : 32 : 10',
                              style: TextStyle(
                                fontSize: 37.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              child: const Icon(CupertinoIcons.right_chevron),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => const TimerScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Row(
                      children: [
                        Text(
                          'See More',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Icon(
                          CupertinoIcons.right_chevron,
                          size: 16.0,
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => TaskPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('tasks').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final tasks = snapshot.data!.docs;
                    final currentDate = DateTime.now();
                    final todayTasks = tasks.where((task) {
                      final taskDate =
                          task['date']?.toDate(); // Add null check here
                      return taskDate != null &&
                          taskDate.day == currentDate.day &&
                          taskDate.month == currentDate.month &&
                          taskDate.year == currentDate.year;
                    }).toList();
                    return ListView.builder(
                      itemCount: todayTasks.length,
                      itemBuilder: (context, index) {
                        final task = todayTasks[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Card(
                            child: ListTile(
                              title: Text(task['name']),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

//code 4 firestore works
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prodeck/pages/task_page.dart';
import 'package:prodeck/timer.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // Set background color to white
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 20.0),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Task',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.systemBlue,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const TimerScreen(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: Container(
                    height: 122.0,
                    width: 400.0,
                    child: Card(
                      color:
                          const Color(0xFFF6F5F8), // Set card color to #F6F5F8
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '00 : 32 : 10',
                              style: TextStyle(
                                fontSize: 37.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              child: const Icon(CupertinoIcons.right_chevron),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => const TimerScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Row(
                      children: [
                        Text(
                          'See More',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Icon(
                          CupertinoIcons.right_chevron,
                          size: 16.0,
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => TaskPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('tasks').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final tasks = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task =
                            tasks[index].data() as Map<String, dynamic>;
                        final taskName = task['name'] ?? '';
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Card(
                            child: ListTile(
                              title: Text(taskName),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prodeck/pages/task_page.dart';
import 'package:prodeck/timer.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 20.0),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Task',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.systemBlue,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const TimerScreen(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: Container(
                    height: 122.0,
                    width: 400.0,
                    child: Card(
                      color: CupertinoColors.lightBackgroundGray,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            StreamBuilder<DocumentSnapshot>(
                              stream: FirebaseFirestore.instance.collection('active_timer').doc('timer_data').snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final timerData = snapshot.data!.data() as Map<String, dynamic>?;
                                  final isActive = timerData?['isActive'] ?? false;
                                  final time = isActive ? timerData?['time'] : '00 : 00 : 00' as String?;
                                  return Text(
                                    time!,
                                    style: TextStyle(
                                      fontSize: 37.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                } else {
                                  return const Text(
                                    '00 : 00 : 00',
                                    style: TextStyle(
                                      fontSize: 37.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                }
                              },
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              child: const Icon(CupertinoIcons.right_chevron),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => const TimerScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.black,
                      decoration: TextDecoration.none,
                    ),
                    child: Row(
                      children: const [
                        Text('Activity Log'),
                        SizedBox(width: 5.0),
                        Icon(CupertinoIcons.clock),
                      ],
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Row(
                      children: [
                        Text(
                          'See More',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Icon(
                          CupertinoIcons.right_chevron,
                          size: 16.0,
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => TaskPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CupertinoScrollbar(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final tasks = snapshot.data!.docs;
                        return ListView.separated(
                          itemCount: tasks.length,
                          separatorBuilder: (context, index) => SizedBox(height: 10.0),
                          itemBuilder: (context, index) {
                            final task = tasks[index].data() as Map<String, dynamic>?;
                            final taskName = task?['name'] ?? '';
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => const TimerScreen(),
                                  ),
                                );
                              },
                              child: Card(
                                child: ListTile(
                                  title: StreamBuilder<DocumentSnapshot>(
                                    stream: FirebaseFirestore.instance.collection('active_timer').doc('timer_data').snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final timerData = snapshot.data!.data() as Map<String, dynamic>?;
                                        final isActive = timerData?['isActive'] ?? false;
                                        final time = isActive ? timerData?['time'] : '00 : 00 : 00' as String?;
                                        return Text(
                                          time!,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: isActive ? CupertinoColors.activeBlue : CupertinoColors.black,
                                          ),
                                        );
                                      } else {
                                        return const Text(
                                          '00 : 00 : 00',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: CupertinoColors.black,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  trailing: const Icon(CupertinoIcons.play_arrow),
                                ),
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return const Center(
                          child: CupertinoActivityIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

*/

//code 6
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prodeck/pages/task_page.dart';
import 'package:prodeck/timer.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // Set background color to white
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 20.0),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Task',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.systemBlue,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const TimerScreen(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: Container(
                    height: 122.0,
                    width: 400.0,
                    child: Card(
                      color:
                          const Color(0xFFF6F5F8), // Set card color to #F6F5F8
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '00 : 32 : 10',
                              style: TextStyle(
                                fontSize: 37.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              child: const Icon(CupertinoIcons.right_chevron),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => const TimerScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Row(
                      children: [
                        Text(
                          'See More',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Icon(
                          CupertinoIcons.right_chevron,
                          size: 16.0,
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => TaskPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('tasks').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final tasks = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task =
                            tasks[index].data() as Map<String, dynamic>;
                        final taskName = task['name'] ?? '';
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Card(
                            child: ListTile(
                              title: Text(taskName),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

//code 7
/*
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prodeck/pages/task_page.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 20.0),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Task',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.systemBlue,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => TimerScreen(taskName: 'Task Name'),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: Container(
                    height: 122.0,
                    width: 400.0,
                    child: Card(
                      color: const Color(0xFFF6F5F8),
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '00 : 32 : 10',
                              style: TextStyle(
                                fontSize: 37.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              child: const Icon(CupertinoIcons.right_chevron),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) =>
                                        TimerScreen(taskName: 'Task Name'),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Row(
                      children: [
                        Text(
                          'See More',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Icon(
                          CupertinoIcons.right_chevron,
                          size: 16.0,
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => TaskPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('tasks').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final tasks = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task =
                            tasks[index].data() as Map<String, dynamic>;
                        final taskName = task['name'] ?? '';
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) =>
                                    TimerScreen(taskName: taskName),
                              ),
                            );
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Card(
                              child: ListTile(
                                title: Text(taskName),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimerScreen extends StatefulWidget {
  final String taskName;

  const TimerScreen({Key? key, required this.taskName}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late Duration _duration = Duration.zero;
  bool _isPaused = false;
  bool _isStarted = false;
  double _percentComplete = 0.0;
  Timer? _timer;

  void _startTimer() {
    if (_duration.inSeconds == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No time has been set.'),
        ),
      );
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_duration.inSeconds == 0) {
            timer.cancel();
            _isStarted = false;
            // Save timer data as completed to Firebase and Firestore
            _saveTimerData(true);
          } else {
            _duration = Duration(seconds: _duration.inSeconds - 1);
            _percentComplete = 1.0 -
                (_duration.inSeconds / _duration.inSeconds.ceilToDouble());
          }
        });
      });
    }
  }

  void _pauseTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      setState(() {
        _isPaused = true;
      });
    }
  }

  void _stopTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    setState(() {
      _isPaused = false;
      _isStarted = false;
      _duration = const Duration();
      _percentComplete = 0.0;
    });
    // Save timer data as completed to Firebase and Firestore
    _saveTimerData(true);
  }

  void _setTimer(Duration duration) {
    if (duration.inSeconds == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No time has been set.'),
        ),
      );
    } else {
      setState(() {
        _duration = duration;
        _isStarted = true;
        _isPaused = false;
        _percentComplete = 0.0;
      });
      _startTimer();
    }
  }

  void _saveTimerData(bool isCompleted) {
    final Map<String, dynamic> timerData = {
      'taskName': widget.taskName,
      'durationInSeconds': _duration.inSeconds,
      'isCompleted': isCompleted,
    };

    // Save timer data to Firebase and Hive
    // Implement your code to save data to Firebase and Hive here
    // ...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.taskName,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            !_isStarted
                ? CupertinoTimerPicker(
                    mode: CupertinoTimerPickerMode.hms,
                    onTimerDurationChanged: (duration) {
                      _duration = duration;
                    },
                  )
                : CircularPercentIndicator(
                    radius: MediaQuery.of(context).size.width * 0.6,
                    lineWidth: 10.0,
                    percent: _percentComplete,
                    center: Text(
                      '${_duration.inHours.toString().padLeft(2, '0')}:${(_duration.inMinutes % 60).toString().padLeft(2, '0')}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}',
                      style: const TextStyle(fontSize: 40),
                    ),
                    progressColor: Colors.pink,
                  ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _isStarted && !_isPaused
                    ? ElevatedButton(
                        onPressed: _pauseTimer,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(120, 48),
                        ),
                        child: const Text(
                          'Pause',
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () => _setTimer(_duration),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(120, 48),
                        ),
                        child: Text(
                          _isPaused ? 'Resume' : 'Start',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                ElevatedButton(
                  onPressed: _isStarted ? _stopTimer : null,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(120, 48),
                  ),
                  child: const Text(
                    'Stop',
                    style: TextStyle(fontSize: 18),
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
//code 15 best code
//best code yet
/*
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prodeck/pages/task_page.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 20.0),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Task',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.systemBlue,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) =>
                        const TimerScreen(taskName: 'Task Name'),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: Container(
                    height: 122.0,
                    width: 400.0,
                    child: Card(
                      color: const Color(0xFFF6F5F8),
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '00 : 00 : 00',
                              style: TextStyle(
                                fontSize: 37.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              child: const Icon(CupertinoIcons.right_chevron),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => const TimerScreen(
                                        taskName: 'Task Name'),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Row(
                      children: [
                        Text(
                          'See More',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Icon(
                          CupertinoIcons.right_chevron,
                          size: 16.0,
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const TaskPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('tasks').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final tasks = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task =
                            tasks[index].data() as Map<String, dynamic>;
                        final taskName = task['name'] ?? '';
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) =>
                                    TimerScreen(taskName: taskName),
                              ),
                            );
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Card(
                              child: ListTile(
                                title: Text(taskName),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimerScreen extends StatefulWidget {
  final String taskName;

  const TimerScreen({Key? key, required this.taskName}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late Duration _duration = Duration.zero;
  bool _isPaused = false;
  bool _isStarted = false;
  double _percentComplete = 0.0;
  Timer? _timer;

  void _startTimer() {
    if (_duration.inSeconds == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No time has been set.'),
        ),
      );
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_duration.inSeconds == 0) {
            timer.cancel();
            _isStarted = false;
            // Save timer data as completed to Firebase and Firestore
            _saveTimerData(true);
          } else {
            _duration = Duration(seconds: _duration.inSeconds - 1);
            _percentComplete = 1.0 -
                (_duration.inSeconds / _duration.inSeconds.ceilToDouble());
          }
        });
      });
    }
  }

  void _pauseTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      setState(() {
        _isPaused = true;
      });
    }
  }

  void _stopTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    setState(() {
      _isPaused = false;
      _isStarted = false;
      _duration = const Duration();
      _percentComplete = 0.0;
    });
    // Save timer data as completed to Firebase and Firestore
    _saveTimerData(true);
  }

  void _setTimer(Duration duration) {
    if (duration.inSeconds == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No time has been set.'),
        ),
      );
    } else {
      setState(() {
        _duration = duration;
        _isStarted = true;
        _isPaused = false;
        _percentComplete = 0.0;
      });
      _startTimer();
    }
  }

  void _saveTimerData(bool isCompleted) {
    final Map<String, dynamic> timerData = {
      'taskName': widget.taskName,
      'durationInSeconds': _duration.inSeconds,
      'isCompleted': isCompleted,
    };

    // Save timer data to Firebase and Hive
    // Implement your code to save data to Firebase and Hive here
    // ...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 20,
              child: CupertinoButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: const EdgeInsets.all(10),
                child: const Icon(
                  CupertinoIcons.back,
                  size: 28,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.taskName,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  !_isStarted
                      ? CupertinoTimerPicker(
                          mode: CupertinoTimerPickerMode.hms,
                          onTimerDurationChanged: (duration) {
                            setState(() {
                              _duration = duration;
                            });
                          },
                        )
                      : CircularPercentIndicator(
                          radius: MediaQuery.of(context).size.width * 0.6,
                          lineWidth: 10.0,
                          percent: _percentComplete,
                          center: Text(
                            '${_duration.inHours.toString().padLeft(2, '0')}:${(_duration.inMinutes % 60).toString().padLeft(2, '0')}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}',
                            style: const TextStyle(fontSize: 40),
                          ),
                          progressColor: Colors.pink,
                        ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _isStarted && !_isPaused
                          ? ElevatedButton(
                              onPressed: _pauseTimer,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                minimumSize: const Size(120, 48),
                              ),
                              child: const Text(
                                'Pause',
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () => _setTimer(_duration),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                minimumSize: const Size(120, 48),
                              ),
                              child: Text(
                                _isPaused ? 'Resume' : 'Start',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                      ElevatedButton(
                        onPressed: _isStarted ? _stopTimer : null,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(120, 48),
                        ),
                        child: const Text(
                          'Stop',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
//code 16 try
//best code for activity
/*
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prodeck/pages/task_page.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

import '../Services/notifi_service.dart';

class ActivityPage extends StatelessWidget {
  static const IconData arrowtriangleRightFill = IconData(0xf569,
      fontFamily: CupertinoIcons.iconFont,
      fontPackage: CupertinoIcons.iconFontPackage);

  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 20.0),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Task',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.systemBlue,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) =>
                        const TimerScreen(taskName: 'Task Name'),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: Container(
                    height: 122.0,
                    width: 400.0,
                    child: Card(
                      color: const Color(0xFFF6F5F8),
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '00 : 00 : 00',
                              style: TextStyle(
                                fontSize: 37.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              child: const Icon(CupertinoIcons.right_chevron),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => const TimerScreen(
                                        taskName: 'Task Name'),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Row(
                      children: [
                        Text(
                          'See More',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Icon(
                          CupertinoIcons.right_chevron,
                          size: 16.0,
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const TaskPage(
                            taskData: {},
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('tasks').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final tasks = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task =
                            tasks[index].data() as Map<String, dynamic>;
                        final taskName = task['name'] ?? '';

                        // Debug print to see the retrieved taskName
                        print('Task Name: $taskName');

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) =>
                                    TimerScreen(taskName: taskName),
                              ),
                            );
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Card(
                              child: ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(taskName),
                                    const Icon(
                                      arrowtriangleRightFill,
                                      size: 25.0,
                                      color: CupertinoColors.systemGrey,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimerScreen extends StatefulWidget {
  final String taskName;

  const TimerScreen({Key? key, required this.taskName}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late Duration _duration = Duration.zero;
  bool _isPaused = false;
  bool _isStarted = false;
  double _percentComplete = 0.0;
  Timer? _timer;

  void _startTimer() {
    if (_duration.inSeconds == 0) {
      NotificationService().showNotification(
        title: 'ProDeck',
        body: 'No time has been set.',
      );
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_duration.inSeconds == 0) {
            timer.cancel();
            _isStarted = false;
            // Save timer data as completed to Firebase and Firestore
            _saveTimerData(true);
            // Send notification for task completion
            NotificationService().showNotification(
              title: widget.taskName,
              body: 'Yay! You completed the task.',
            );
          } else {
            _duration = Duration(seconds: _duration.inSeconds - 1);
            _percentComplete = 1.0 -
                (_duration.inSeconds / _duration.inSeconds.ceilToDouble());
          }
        });
      });
      // Send notification for timer start
      NotificationService().showNotification(
        title: widget.taskName,
        body: 'Timer has started.',
      );
    }
  }

  void _pauseTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      setState(() {
        _isPaused = true;
      });
      // Send notification for timer pause
      NotificationService().showNotification(
        title: widget.taskName,
        body: 'Timer has been paused.',
      );
    }
  }

  void _stopTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    setState(() {
      _isPaused = false;
      _isStarted = false;
      _duration = const Duration();
      _percentComplete = 0.0;
    });
    // Save timer data as completed to Firebase and Firestore
    _saveTimerData(true);
    // Send notification for timer stop
    NotificationService().showNotification(
      title: widget.taskName,
      body: 'Timer has been stopped.',
    );
  }

  void _setTimer(Duration duration) {
    if (duration.inSeconds == 0) {
      NotificationService().showNotification(
        title: 'ProDeck',
        body: 'No time has been set.',
      );
    } else {
      setState(() {
        _duration = duration;
        _isStarted = true;
        _isPaused = false;
        _percentComplete = 0.0;
      });
      _startTimer();
    }
  }

  void _saveTimerData(bool isCompleted) {
    final Map<String, dynamic> timerData = {
      'taskName': widget.taskName,
      'durationInSeconds': _duration.inSeconds,
      'isCompleted': isCompleted,
    };

    // Save timer data to Firebase and Hive
    // Implement your code to save data to Firebase and Hive here
    // ...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 20,
              child: CupertinoButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: const EdgeInsets.all(10),
                child: const Icon(
                  CupertinoIcons.back,
                  size: 28,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.taskName,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  !_isStarted
                      ? CupertinoTimerPicker(
                          mode: CupertinoTimerPickerMode.hms,
                          onTimerDurationChanged: (duration) {
                            setState(() {
                              _duration = duration;
                            });
                          },
                        )
                      : CircularPercentIndicator(
                          radius: MediaQuery.of(context).size.width * 0.6,
                          lineWidth: 10.0,
                          percent: _percentComplete,
                          center: Text(
                            '${_duration.inHours.toString().padLeft(2, '0')}:${(_duration.inMinutes % 60).toString().padLeft(2, '0')}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}',
                            style: const TextStyle(fontSize: 40),
                          ),
                          progressColor: Colors.pink,
                        ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _isStarted && !_isPaused
                          ? ElevatedButton(
                              onPressed: _pauseTimer,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                minimumSize: const Size(120, 48),
                              ),
                              child: const Text(
                                'Pause',
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () => _setTimer(_duration),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                minimumSize: const Size(120, 48),
                              ),
                              child: Text(
                                _isPaused ? 'Resume' : 'Start',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                      ElevatedButton(
                        onPressed: _isStarted ? _stopTimer : null,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(120, 48),
                        ),
                        child: const Text(
                          'Stop',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
//code 17
/*
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prodeck/pages/task_page.dart';

import '../Services/notifi_service.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    final bgColor = isDarkMode ? Colors.black : const Color(0xFFFFFFFF);
    final textColor = isDarkMode ? Colors.white : CupertinoColors.systemBlue;
    final cardColor = isDarkMode ? Colors.grey[900]! : const Color(0xFFF6F5F8);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 20.0),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: Icon(
                  CupertinoIcons.back,
                  color: textColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Task',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) =>
                        const TimerScreen(taskName: 'Task Name'),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: Container(
                    height: 122.0,
                    width: 400.0,
                    child: Card(
                      color: cardColor,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '00 : 00 : 00',
                              style: TextStyle(
                                fontSize: 37.0,
                                fontWeight: FontWeight.w600,
                                color: textColor,
                              ),
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              child: Icon(
                                CupertinoIcons.right_chevron,
                                color: textColor,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => const TimerScreen(
                                      taskName: 'Task Name',
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        Text(
                          'See More',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: textColor,
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Icon(
                          CupertinoIcons.right_chevron,
                          size: 16.0,
                          color: textColor,
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => TaskPage(
                            taskData: {},
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('tasks').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final tasks = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task =
                            tasks[index].data() as Map<String, dynamic>;
                        final taskName = task['name'] ?? '';
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) =>
                                    TimerScreen(taskName: taskName),
                              ),
                            );
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Card(
                              child: ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      taskName,
                                      style: TextStyle(
                                        color: textColor,
                                      ),
                                    ),
                                    /*Icon(
                                      TimerScreen.arrowtriangleRightFill,
                                      size: 25.0,
                                      color: textColor,
                                    ),*/
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text(
                      'Error: ${snapshot.error}',
                      style: TextStyle(
                        color: textColor,
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimerScreen extends StatefulWidget {
  final String taskName;

  const TimerScreen({Key? key, required this.taskName}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late Duration _duration = Duration.zero;
  bool _isPaused = false;
  bool _isStarted = false;
  double _percentComplete = 0.0;
  Timer? _timer;

  void _startTimer() {
    if (_duration.inSeconds == 0) {
      NotificationService().showNotification(
        title: 'ProDeck',
        body: 'No time has been set.',
      );
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_duration.inSeconds == 0) {
            timer.cancel();
            _isStarted = false;
            // Save timer data as completed to Firebase and Firestore
            _saveTimerData(true);
            // Send notification for task completion
            NotificationService().showNotification(
              title: widget.taskName,
              body: 'Yay! You completed the task.',
            );
          } else {
            _duration = Duration(seconds: _duration.inSeconds - 1);
            _percentComplete = 1.0 -
                (_duration.inSeconds / _duration.inSeconds.ceilToDouble());
          }
        });
      });
      // Send notification for timer start
      NotificationService().showNotification(
        title: widget.taskName,
        body: 'Timer has started.',
      );
    }
  }

  void _pauseTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      setState(() {
        _isPaused = true;
      });
      // Send notification for timer pause
      NotificationService().showNotification(
        title: widget.taskName,
        body: 'Timer has been paused.',
      );
    }
  }

  void _stopTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    setState(() {
      _isPaused = false;
      _isStarted = false;
      _duration = const Duration();
      _percentComplete = 0.0;
    });
    // Save timer data as completed to Firebase and Firestore
    _saveTimerData(true);
    // Send notification for timer stop
    NotificationService().showNotification(
      title: widget.taskName,
      body: 'Timer has been stopped.',
    );
  }

  void _setTimer(Duration duration) {
    if (duration.inSeconds == 0) {
      NotificationService().showNotification(
        title: 'ProDeck',
        body: 'No time has been set.',
      );
    } else {
      setState(() {
        _duration = duration;
        _isStarted = true;
        _isPaused = false;
        _percentComplete = 0.0;
      });
      _startTimer();
    }
  }

  void _saveTimerData(bool isCompleted) {
    final Map<String, dynamic> timerData = {
      'taskName': widget.taskName,
      'durationInSeconds': _duration.inSeconds,
      'isCompleted': isCompleted,
    };

    // Save timer data to Firebase and Hive
    // Implement your code to save data to Firebase and Hive here
    // ...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 20,
              child: CupertinoButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: const EdgeInsets.all(10),
                child: const Icon(
                  CupertinoIcons.back,
                  size: 28,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.taskName,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  !_isStarted
                      ? CupertinoTimerPicker(
                          mode: CupertinoTimerPickerMode.hms,
                          onTimerDurationChanged: (duration) {
                            setState(() {
                              _duration = duration;
                            });
                          },
                        )
                      : CircularPercentIndicator(
                          radius: MediaQuery.of(context).size.width * 0.6,
                          lineWidth: 10.0,
                          percent: _percentComplete,
                          center: Text(
                            '${_duration.inHours.toString().padLeft(2, '0')}:${(_duration.inMinutes % 60).toString().padLeft(2, '0')}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}',
                            style: const TextStyle(fontSize: 40),
                          ),
                          progressColor: Colors.pink,
                        ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _isStarted && !_isPaused
                          ? ElevatedButton(
                              onPressed: _pauseTimer,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                minimumSize: const Size(120, 48),
                              ),
                              child: const Text(
                                'Pause',
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () => _setTimer(_duration),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                minimumSize: const Size(120, 48),
                              ),
                              child: Text(
                                _isPaused ? 'Resume' : 'Start',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                      ElevatedButton(
                        onPressed: _isStarted ? _stopTimer : null,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(120, 48),
                        ),
                        child: const Text(
                          'Stop',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
//Code 18 previous code 16

import 'dart:async';
import 'package:firebase_core_dart/firebase_core_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prodeck/pages/task_page.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

import '../Services/notifi_service.dart';
import '../dynamic/dynamic_island_manager.dart';
import '../dynamic/dynamic_island_stopwatch_data_model.dart';

class ActivityPage extends StatelessWidget {
  static const IconData arrowtriangleRightFill = IconData(0xf569,
      fontFamily: CupertinoIcons.iconFont,
      fontPackage: CupertinoIcons.iconFontPackage);

  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 20.0),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Task',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.systemBlue,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) =>
                        const TimerScreen(taskName: 'Task Name'),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: Container(
                    height: 122.0,
                    width: 400.0,
                    child: Card(
                      color: const Color(0xFFF6F5F8),
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '00 : 00 : 00',
                              style: TextStyle(
                                fontSize: 37.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              child: const Icon(CupertinoIcons.right_chevron),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => const TimerScreen(
                                        taskName: 'Task Name'),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Row(
                      children: [
                        Text(
                          'See More',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Icon(
                          CupertinoIcons.right_chevron,
                          size: 16.0,
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const TaskPage(
                            taskData: {},
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('tasks').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final tasks = snapshot.data!.docs;

                    final currentDate = DateTime.now(); // Get the current date

                    final filteredTasks = tasks.where((taskDoc) {
                      final task = taskDoc.data() as Map<String, dynamic>;
                      final taskDateTimestamp = task['date'] as Timestamp?;
                      if (taskDateTimestamp != null) {
                        final taskDate = taskDateTimestamp.toDate();
                        return taskDate.year == currentDate.year &&
                            taskDate.month == currentDate.month &&
                            taskDate.day == currentDate.day;
                      }
                      return false;
                    }).toList();

                    return ListView.builder(
                      itemCount: filteredTasks.length,
                      itemBuilder: (context, index) {
                        final task =
                            filteredTasks[index].data() as Map<String, dynamic>;
                        final taskName = task['taskName'] ?? '';
                        final focus = task['focus'] ?? '';

                        // Determine the icon, font color, and card color based on the focus
                        IconData? focusIcon;
                        Color? focusFontColor;
                        Color? focusCardColor;

                        if (focus == 'reading') {
                          focusIcon = CupertinoIcons.book_fill;
                          focusFontColor =
                              Colors.orange[800]; // Darker shade of orange
                          focusCardColor = Colors.orange[100];
                        } else if (focus == 'fitness') {
                          focusIcon = CupertinoIcons.book_fill;
                          focusFontColor = Colors.green;
                          focusCardColor = Colors.green[100];
                        } else if (focus == 'mindfulness') {
                          focusIcon = CupertinoIcons.circle_grid_hex;
                          focusFontColor = Colors.blue;
                          focusCardColor = Colors.blue[100];
                        } else if (focus == 'work') {
                          focusIcon = CupertinoIcons.desktopcomputer;
                          focusFontColor = Colors.red;
                          focusCardColor = Colors.red[100];
                        }

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) =>
                                    TimerScreen(taskName: taskName),
                              ),
                            );
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Card(
                              child: Container(
                                width: 390.0,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        // Focus icon moved by 10px
                                        SizedBox(width: 10.0),
                                        if (focusIcon != null)
                                          Icon(focusIcon,
                                              color: focusFontColor, size: 30),
                                        SizedBox(width: 10.0),
                                        // Task name with bold font
                                        Text(
                                          taskName,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(), // Spacing to separate focus and play button
                                        // Cupertino play button in the middle
                                        CupertinoButton(
                                          padding: EdgeInsets.zero,
                                          child: Icon(CupertinoIcons.play_fill,
                                              size: 30),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                builder: (context) =>
                                                    TimerScreen(
                                                        taskName: taskName),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        height:
                                            3.0), // Space between task name and focus card
                                    // Focus card
                                    if (focus != null && focus.isNotEmpty)
                                      Container(
                                        width: 90.0,
                                        height: 25.0,
                                        margin: EdgeInsets.only(left: 20.0),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: focusCardColor,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Text(
                                          focus,
                                          style:
                                              TextStyle(color: focusFontColor),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// timer screen best working

class TimerScreen extends StatefulWidget {
  final String taskName;

  const TimerScreen({Key? key, required this.taskName}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late Duration _duration = Duration.zero;
  bool _isPaused = false;
  bool _isStarted = false;
  double _percentComplete = 0.0;
  Timer? _timer;
  Duration _elapsedDuration = Duration.zero;
  Duration _pausedDuration = Duration.zero;

  final DynamicIslandManager diManager = DynamicIslandManager(channelKey: 'DI');
  bool _isLiveActivityRunning = false;
  Timer? _liveActivityTimer;
  int _liveActivitySeconds = 0;

  void _startLiveActivity() {
    setState(() {
      _isLiveActivityRunning = true;
    });

    diManager.startLiveActivity(
      jsonData: DynamicIslandStopwatchDataModel(elapsedSeconds: 0).toMap(),
    );

    _liveActivityTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _liveActivitySeconds++;
      });

      diManager.updateLiveActivity(
        jsonData: DynamicIslandStopwatchDataModel(
          elapsedSeconds: _liveActivitySeconds,
        ).toMap(),
      );
    });
  }

  void _stopLiveActivity() {
    _liveActivityTimer?.cancel();
    setState(() {
      _liveActivitySeconds = 0;
      _isLiveActivityRunning = false;
    });

    diManager.stopLiveActivity();
  }

  void _pauseTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      _pausedDuration = _elapsedDuration;
      setState(() {
        _isPaused = true;
      });
    }
  }

  void _resumeTimer() {
    setState(() {
      _isPaused = false;
    });
    _startTimerFromPaused();
  }

  void _startTimerFromPaused() {
    final pausedSeconds = _pausedDuration.inSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if ((_elapsedDuration + Duration(seconds: pausedSeconds)).inSeconds >=
            _duration.inSeconds) {
          timer.cancel();
          _isStarted = false;
        } else {
          _elapsedDuration = _elapsedDuration + Duration(seconds: 1);

          if (!_isPaused) {
            _percentComplete = (_elapsedDuration.inSeconds + pausedSeconds) /
                _duration.inSeconds;
          }

          if (!_isLiveActivityRunning) {
            _startLiveActivity();
          }
        }
      });
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_elapsedDuration.inSeconds >= _duration.inSeconds) {
          timer.cancel();
          _isStarted = false;
        } else {
          _elapsedDuration = Duration(seconds: _elapsedDuration.inSeconds + 1);
          _percentComplete = _elapsedDuration.inSeconds / _duration.inSeconds;

          if (!_isLiveActivityRunning) {
            _startLiveActivity();
          }
        }
      });
    });
  }

  void _stopTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    setState(() {
      _isPaused = false;
      _isStarted = false;
      _duration = const Duration();
      _percentComplete = 0.0;
      _stopLiveActivity();
    });
  }

  void _setTimer(Duration duration) {
    if (duration.inSeconds == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No time has been set.'),
        ),
      );
    } else {
      setState(() {
        _duration = duration;
        _isStarted = true;
        _isPaused = false;
        _elapsedDuration = const Duration();
        _percentComplete = 0.0;
      });
      _startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CupertinoButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: const EdgeInsets.all(10),
                    child: const Icon(
                      CupertinoIcons.back,
                      size: 28,
                    ),
                  ),
                  const SizedBox(
                      height: 10), // Spacer between Back Button and Timer Text
                  const Text(
                    'Timer', // Your Timer Text here
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: CupertinoButton(
                onPressed: () {
                  // Add your action here for the timer icon click
                },
                padding: const EdgeInsets.all(10),
                child: const Icon(
                  CupertinoIcons.timer,
                  size: 28,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.taskName,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  !_isStarted
                      ? CupertinoTimerPicker(
                          mode: CupertinoTimerPickerMode.hms,
                          onTimerDurationChanged: (duration) {
                            setState(() {
                              _duration = duration;
                            });
                          },
                        )
                      : CircularPercentIndicator(
                          radius: MediaQuery.of(context).size.width * 0.6,
                          lineWidth: 10.0,
                          percent: _percentComplete,
                          center: Text(
                            '${_elapsedDuration.inHours.toString().padLeft(2, '0')}:${(_elapsedDuration.inMinutes % 60).toString().padLeft(2, '0')}:${(_elapsedDuration.inSeconds % 60).toString().padLeft(2, '0')}',
                            style: const TextStyle(fontSize: 40),
                          ),
                          progressColor: Colors.pink,
                        ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _isStarted && !_isPaused
                          ? ElevatedButton(
                              onPressed: _pauseTimer,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                minimumSize: const Size(120, 48),
                              ),
                              child: const Text(
                                'Pause',
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: _isPaused
                                  ? _resumeTimer
                                  : () => _setTimer(_duration),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                minimumSize: const Size(120, 48),
                              ),
                              child: Text(
                                _isPaused ? 'Resume' : 'Start',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                      ElevatedButton(
                        onPressed: _isStarted ? _stopTimer : null,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(120, 48),
                        ),
                        child: const Text(
                          'Stop',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 150),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




/*
class TimerScreen extends StatefulWidget {
  final String taskName;

  const TimerScreen({Key? key, required this.taskName}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late Duration _duration = Duration.zero;
  bool _isPaused = false;
  bool _isStarted = false;
  double _percentComplete = 0.0;
  Timer? _timer;
  Duration _elapsedDuration = Duration.zero;
  Duration _pausedDuration = Duration.zero;

  final DynamicIslandManager diManager = DynamicIslandManager(channelKey: 'DI');
  bool _isLiveActivityRunning = false;
  Timer? _liveActivityTimer;
  int _liveActivitySeconds = 0;

  late CollectionReference _timerCollection;

  @override
  void initState() {
    super.initState();
    _initializeFirebase();
  }

  void _initializeFirebase() async {
  await Firebase.initializeApp();
  _timerCollection = FirebaseFirestore.instance.collection('timers');
}

  void _startLiveActivity() {
    setState(() {
      _isLiveActivityRunning = true;
    });

    diManager.startLiveActivity(
      jsonData: DynamicIslandStopwatchDataModel(elapsedSeconds: 0).toMap(),
    );

    _liveActivityTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _liveActivitySeconds++;
      });

      diManager.updateLiveActivity(
        jsonData: DynamicIslandStopwatchDataModel(
          elapsedSeconds: _liveActivitySeconds,
        ).toMap(),
      );
    });
  }

  void _stopLiveActivity() {
    _liveActivityTimer?.cancel();
    setState(() {
      _liveActivitySeconds = 0;
      _isLiveActivityRunning = false;
    });

    diManager.stopLiveActivity();
  }

  void _pauseTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      _pausedDuration = _elapsedDuration;
      setState(() {
        _isPaused = true;
      });
    }
  }

  void _resumeTimer() {
    setState(() {
      _isPaused = false;
    });
    _startTimerFromPaused();
  }

  void _startTimerFromPaused() {
    final pausedSeconds = _pausedDuration.inSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if ((_elapsedDuration + Duration(seconds: pausedSeconds)).inSeconds >=
            _duration.inSeconds) {
          timer.cancel();
          _isStarted = false;
        } else {
          _elapsedDuration = _elapsedDuration + Duration(seconds: 1);

          if (!_isPaused) {
            _percentComplete = (_elapsedDuration.inSeconds + pausedSeconds) /
                _duration.inSeconds;
          }

          if (!_isLiveActivityRunning) {
            _startLiveActivity();
          }
        }
      });
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_elapsedDuration.inSeconds >= _duration.inSeconds) {
          timer.cancel();
          _isStarted = false;
        } else {
          _elapsedDuration = Duration(seconds: _elapsedDuration.inSeconds + 1);
          _percentComplete = _elapsedDuration.inSeconds / _duration.inSeconds;

          if (!_isLiveActivityRunning) {
            _startLiveActivity();
          }
        }
      });
    });
  }

  void _stopTimer() async {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    setState(() {
      _isPaused = false;
      _isStarted = false;
      _duration = const Duration();
      _percentComplete = 0.0;
      _stopLiveActivity();
    });

    if (_isStarted) {
      await _timerCollection.add({
        'taskName': widget.taskName,
        'durationInSeconds': _elapsedDuration.inSeconds,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
  }

  void _setTimer(Duration duration) {
    if (duration.inSeconds == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No time has been set.'),
        ),
      );
    } else {
      setState(() {
        _duration = duration;
        _isStarted = true;
        _isPaused = false;
        _elapsedDuration = const Duration();
        _percentComplete = 0.0;
      });
      _startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CupertinoButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: const EdgeInsets.all(10),
                      child: const Icon(
                        CupertinoIcons.back,
                        size: 28,
                      ),
                    ),
                    const Text(
                      'Timers',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: _timerCollection
                      .orderBy('timestamp', descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final timers = snapshot.data!.docs;
                      if (timers.isNotEmpty) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            const Text(
                              'Recents',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Divider(),
                            for (var timer in timers)
                              ListTile(
                                title: Text(timer['taskName']),
                                subtitle: Text(
                                  'Elapsed Time: ${Duration(seconds: timer['durationInSeconds']).toString().split('.').first}',
                                ),
                              ),
                            const Divider(),
                          ],
                        );
                      }
                    }
                    return SizedBox.shrink();
                  },
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    !_isStarted
                        ? CupertinoTimerPicker(
                            mode: CupertinoTimerPickerMode.hms,
                            onTimerDurationChanged: (duration) {
                              _duration = duration;
                            },
                          )
                        : CircularPercentIndicator(
                            radius: MediaQuery.of(context).size.width * 0.6,
                            lineWidth: 10.0,
                            percent: _percentComplete,
                            center: Text(
                              '${_elapsedDuration.inHours.toString().padLeft(2, '0')}:${(_elapsedDuration.inMinutes % 60).toString().padLeft(2, '0')}:${(_elapsedDuration.inSeconds % 60).toString().padLeft(2, '0')}',
                              style: const TextStyle(fontSize: 40),
                            ),
                            progressColor: Colors.pink,
                          ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _isStarted && !_isPaused
                            ? ElevatedButton(
                                onPressed: _pauseTimer,
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  minimumSize: const Size(120, 48),
                                ),
                                child: const Text(
                                  'Pause',
                                  style: TextStyle(fontSize: 18),
                                ),
                              )
                            : ElevatedButton(
                                onPressed: _isPaused
                                    ? _resumeTimer
                                    : () => _setTimer(_duration),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  minimumSize: const Size(120, 48),
                                ),
                                child: Text(
                                  _isPaused ? 'Resume' : 'Start',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                        ElevatedButton(
                          onPressed: _isStarted ? _stopTimer : null,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            minimumSize: const Size(120, 48),
                          ),
                          child: const Text(
                            'Stop',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/