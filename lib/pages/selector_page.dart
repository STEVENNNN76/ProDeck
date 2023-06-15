import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'auth_page.dart';
import 'profile_page.dart';

class SelectorPage extends StatelessWidget {
  const SelectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        backgroundColor: CupertinoColors.white, // Set background color to white
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    CupertinoIcons.back,
                    color: CupertinoColors.black,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: [
                    SelectorCard(
                      text: 'Profile',
                      icon: CupertinoIcons.person,
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const ProfilePage()),
                        );
                      },
                    ),
                    SelectorCard(
                      text: 'Notifications',
                      icon: CupertinoIcons.bell,
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const NotificationsPage()),
                        );
                      },
                    ),
                    SelectorCard(
                      text: 'Settings',
                      icon: CupertinoIcons.settings,
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const SettingsPage()),
                        );
                      },
                    ),
                    SelectorCard(
                      text: 'Theme',
                      icon: CupertinoIcons.paintbrush,
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const ThemePage()),
                        );
                      },
                    ),
                    SelectorCard(
                      text: 'Badges',
                      icon: CupertinoIcons.star,
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const BadgesPage()),
                        );
                      },
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

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                CupertinoIcons.back,
                color: CupertinoColors.black,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Notifications',
              style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.bell,
                      color: CupertinoColors.activeBlue,
                    ),
                    const SizedBox(width: 8.0),
                    const Text(
                      'Turn Off Notifications',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    const Spacer(),
                    CupertinoSwitch(
                      value: false,
                      onChanged: (value) {
                        // Do something when toggle switch changes
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                CupertinoIcons.back,
                color: CupertinoColors.black,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.settings,
                  color: CupertinoColors.activeBlue,
                ),
                SizedBox(width: 8.0),
                Text(
                  'Settings',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ThemePage extends StatelessWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20.0), // Move the back button row down by 20px
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                CupertinoIcons.back,
                color: CupertinoColors.black,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                SizedBox(width: 8.0),
                Text(
                  'Theme',
                  style: TextStyle(
                    fontSize: 30.0, // Increase font size to 30
                    color: CupertinoColors.black, // Set font color to black
                    decoration: TextDecoration.none, // Remove underline
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
              height: 20.0), // Add spacing between theme text and card
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Enable Dark Mode',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    CupertinoSwitch(
                      value: false, // Replace with the actual dark mode value
                      onChanged: (bool value) {
                        // Implement dark mode toggle logic here
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BadgesPage extends StatelessWidget {
  const BadgesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30.0), // Move the row down by 40px
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  CupertinoIcons.back,
                  color: CupertinoColors.black,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: Text(
                  'Badges',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: CupertinoColors.black, // Set the font color to black
                    decoration: TextDecoration.none, // Remove the underline
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ), // Add 30px spacing below the 'Badges' text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  BadgeCard(
                    title: '10 day streak',
                    description: 'To unlock this badge, reach 10 day streak',
                    progress: '0/10',
                  ),
                  BadgeCard(
                    title: '15 day streak',
                    description: 'To unlock this badge, reach 15 day streak',
                    progress: '0/15',
                  ),
                  BadgeCard(
                    title: '30 day streak',
                    description: 'To unlock this badge, reach 30 day streak',
                    progress: '0/30',
                  ),
                  BadgeCard(
                    title: '100 day streak',
                    description: 'To unlock this badge, reach 100 day streak',
                    progress: '0/100',
                  ),
                  BadgeCard(
                    title: '150 day streak',
                    description: 'To unlock this badge, reach 150 day streak',
                    progress: '0/150',
                  ),
                  BadgeCard(
                    title: '200 day streak',
                    description: 'To unlock this badge, reach 200 day streak',
                    progress: '0/200',
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

class BadgeCard extends StatelessWidget {
  final String title;
  final String description;
  final String progress;

  const BadgeCard({
    Key? key,
    required this.title,
    required this.description,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16.0,
                color: CupertinoColors.systemGrey,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(progress),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SelectorCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const SelectorCard({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 24.0,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
              const SizedBox(width: 8.0),
              Text(
                text,
                style: const TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
