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
