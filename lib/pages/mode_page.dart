//code 1
//works flawlessly
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class WorkPage extends StatefulWidget {
  @override
  _WorkPageState createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  List<Color> cardColors = [];

  @override
  void initState() {
    super.initState();
    // Load existing mode data from Firestore
    loadModesFromFirestore();
  }

  void loadModesFromFirestore() {
    FirebaseFirestore.instance
        .collection('modes')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        // Add the color to `cardColors` list
        cardColors.add(Color(int.parse(doc['color'])));
      });
      setState(() {});
    });
  }

  void addModeToFirestore(Color color) {
    FirebaseFirestore.instance.collection('modes').add({
      'color': color.value.toString(),
    });
  }

  void deleteModeFromFirestore(int index) {
    FirebaseFirestore.instance
        .collection('modes')
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (index < querySnapshot.docs.length) {
        final modeId = querySnapshot.docs[index].id;
        FirebaseFirestore.instance
            .collection('modes')
            .doc(modeId)
            .delete()
            .then((_) {
          setState(() {
            cardColors.removeAt(index);
          });
        });
      }
    });
  }

  Color getRandomLightColor() {
    final Random random = Random();
    final int r = 150 + random.nextInt(106);
    final int g = 150 + random.nextInt(106);
    final int b = 150 + random.nextInt(106);
    return Color.fromARGB(255, r, g, b);
  }

  void createModesCollection() {
    FirebaseFirestore.instance.collection('modes').doc('sampleDocId').set({
      'sampleField': 'sampleValue',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mode',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Choose your mode',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemCount: cardColors.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) => CupertinoActionSheet(
                          actions: [
                            CupertinoActionSheetAction(
                              onPressed: () {
                                deleteModeFromFirestore(index);
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Delete',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 110,
                      height: 40,
                      decoration: BoxDecoration(
                        color: cardColors[index],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: const EdgeInsets.only(bottom: 10),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Center(
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    final newColor = getRandomLightColor();
                    addModeToFirestore(newColor);
                    setState(() {
                      cardColors.add(newColor);
                    });
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Create Mode',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
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

//code 2
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class WorkPage extends StatefulWidget {
  @override
  _WorkPageState createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  List<String> modeTexts = [];
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load existing mode data from Firestore
    loadModesFromFirestore();
  }

  void loadModesFromFirestore() {
    FirebaseFirestore.instance
        .collection('modes')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        modeTexts.add(doc['text']);
      });
      setState(() {});
    });
  }

  void addModeToFirestore(String text) {
    FirebaseFirestore.instance.collection('modes').add({
      'text': text,
    });
  }

  void deleteModeFromFirestore(int index) {
    FirebaseFirestore.instance
        .collection('modes')
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (index < querySnapshot.docs.length) {
        final modeId = querySnapshot.docs[index].id;
        FirebaseFirestore.instance
            .collection('modes')
            .doc(modeId)
            .delete()
            .then((_) {
          setState(() {
            modeTexts.removeAt(index);
          });
        });
      }
    });
  }

  void showCreateModeDialog() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Create Mode'),
          content: CupertinoTextField(
            controller: _textEditingController,
            autofocus: true,
            placeholder: 'Enter mode text',
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
              isDestructiveAction: true,
            ),
            CupertinoDialogAction(
              onPressed: () {
                final text = _textEditingController.text;
                addModeToFirestore(text);
                setState(() {
                  modeTexts.add(text);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Create'),
            ),
          ],
        );
      },
    );
  }

  void showDeleteConfirmationDialog(int index) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              child: const Text('Delete'),
              onPressed: () {
                deleteModeFromFirestore(index);
                Navigator.of(context).pop();
              },
              isDestructiveAction: true,
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
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
                  const SizedBox(width: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mode',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Choose your mode',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemCount: modeTexts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showDeleteConfirmationDialog(index);
                    },
                    child: Container(
                      width: 110,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Center(
                        child: Text(
                          modeTexts[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Center(
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    showCreateModeDialog();
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Create Mode',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
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

//c0de 6
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:async';
import 'dart:math';

class ModePage extends StatefulWidget {
  const ModePage({super.key});

  @override
  _ModePageState createState() => _ModePageState();
}

class _ModePageState extends State<ModePage> {
  List<String> modeTexts = [];
  List<Color> modeColors = [];
  TextEditingController _textEditingController = TextEditingController();
  late Box<String>? hiveBox;
  late StreamSubscription<ConnectivityResult> connectivitySubscription;
  bool isOnline = false;

  @override
  void initState() {
    super.initState();
    initializeHive();
    initializeConnectivity();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initializeHive() async {
    await Hive.initFlutter();
    hiveBox = await Hive.openBox<String>('modes');
    loadModesFromHive();
  }

  void createModesCollection() {
    FirebaseFirestore.instance.collection('modes').add({});
  }

  void initializeConnectivity() {
    connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        isOnline = result != ConnectivityResult.none;
      });

      if (isOnline) {
        syncModesWithFirestore();
      }
    });
  }

  void loadModesFromHive() {
    if (hiveBox != null) {
      modeTexts = hiveBox!.values.toList();
      modeColors =
          List<Color>.generate(modeTexts.length, (_) => _generateRandomColor());
      setState(() {});
    }
  }

  void addModeToHive(String text) {
    hiveBox!.add(text);
  }

  void deleteModeFromHive(int index) {
    hiveBox!.deleteAt(index);
    setState(() {
      modeTexts.removeAt(index);
      modeColors.removeAt(index);
    });
  }

  void syncModesWithFirestore() {
    FirebaseFirestore.instance
        .collection('Focus')
        .get()
        .then((QuerySnapshot querySnapshot) {
      final List<String> fetchedModeTexts = [];
      querySnapshot.docs.forEach((doc) {
        final text = doc['text'];
        fetchedModeTexts.add(text);
        if (!modeTexts.contains(text)) {
          addModeToHive(text);
        }
      });

      setState(() {
        modeTexts = fetchedModeTexts;
        modeColors = List<Color>.generate(
            modeTexts.length, (_) => _generateRandomColor());
      });
    });
  }

  void addModeToFirestore(String text) {
    FirebaseFirestore.instance.collection('Focus').add({'text': text});
  }

  void deleteModeFromFirestore(int index) {
    FirebaseFirestore.instance
        .collection('Focus')
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (index < querySnapshot.docs.length) {
        final modeId = querySnapshot.docs[index].id;
        FirebaseFirestore.instance
            .collection('Focus')
            .doc(modeId)
            .delete()
            .then((_) {
          setState(() {
            modeTexts.removeAt(index);
            modeColors.removeAt(index);
          });
        });
      }
    });
  }

  void showCreateModeDialog() {
    _textEditingController.text = ''; // Clear the previous text
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Create Focus'),
          content: Column(
            children: [
              const SizedBox(height: 20),
              CupertinoTextField(
                controller: _textEditingController,
                autofocus: true,
                placeholder: 'Create a Focus',
              ),
              const SizedBox(height: 10), // Add 20px space below the text field
            ],
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
              isDestructiveAction: true,
            ),
            CupertinoDialogAction(
              onPressed: () {
                final text = _textEditingController.text.trim();
                if (text.isNotEmpty) {
                  if (isOnline) {
                    addModeToFirestore(text);
                  } else {
                    addModeToHive(text);
                  }
                  setState(() {
                    modeTexts.add(text);
                    modeColors.add(_generateRandomColor());
                  });
                }
                Navigator.of(context).pop();
              },
              child: const Text('Create'),
            ),
          ],
        );
      },
    );
  }

  Color _generateRandomColor() {
    final random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }

  void showDeleteConfirmationDialog(int index) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              child: const Text('Delete'),
              onPressed: () {
                if (isOnline) {
                  deleteModeFromFirestore(index);
                } else {
                  deleteModeFromHive(index);
                }
                Navigator.of(context).pop();
              },
              isDestructiveAction: true,
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }

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
                        'Choose your Focus',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                CupertinoButton(
                  onPressed: () {
                    showCreateModeDialog();
                  },
                  child: const Icon(
                    CupertinoIcons.add,
                    size: 30,
                  ),
                ),
              ],
            ),
            Expanded(
              child: CupertinoScrollbar(
                child: ListView.builder(
                  padding: const EdgeInsets.only(
                      left: 20, top: 10, right: 20, bottom: 10),
                  itemCount:
                      modeTexts.length, // Excluding the "Create Mode" section
                  itemBuilder: (context, index) {
                    final modeColor = modeColors[index];
                    final textColor = modeColor.computeLuminance() > 0.5
                        ? Colors.black
                        : Colors.white;

                    return GestureDetector(
                      onTap: () {
                        // Perform action when mode is tapped
                      },
                      onLongPress: () {
                        showDeleteConfirmationDialog(index);
                      },
                      child: Container(
                        width: 110,
                        height: 40,
                        decoration: BoxDecoration(
                          color: modeColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            modeTexts[index],
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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

//code 7
/*
import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ModePage extends StatefulWidget {
  const ModePage({super.key});

  @override
  _ModePageState createState() => _ModePageState();
}

class _ModePageState extends State<ModePage> {
  List<String> modeTexts = [];
  List<Color> modeColors = [];
  TextEditingController _textEditingController = TextEditingController();
  late Box<String>? hiveBox;
  late StreamSubscription<ConnectivityResult> connectivitySubscription;
  bool isOnline = false;

  @override
  void initState() {
    super.initState();
    initializeHive();
    initializeConnectivity();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initializeHive() async {
    await Hive.initFlutter();
    hiveBox = await Hive.openBox<String>('modes');
    loadModesFromHive();
  }

  void createModesCollection() {
    FirebaseFirestore.instance.collection('modes').add({});
  }

  void initializeConnectivity() {
    connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        isOnline = result != ConnectivityResult.none;
      });

      if (isOnline) {
        syncModesWithFirestore();
      }
    });
  }

  void loadModesFromHive() {
    if (hiveBox != null) {
      modeTexts = hiveBox!.values.toList();
      modeColors =
          List<Color>.generate(modeTexts.length, (_) => _generateRandomColor());
      setState(() {});
    }
  }

  void addModeToHive(String text) {
    hiveBox!.add(text);
  }

  void deleteModeFromHive(int index) {
    hiveBox!.deleteAt(index);
    setState(() {
      modeTexts.removeAt(index);
      modeColors.removeAt(index);
    });
  }

  void syncModesWithFirestore() {
    FirebaseFirestore.instance
        .collection('Focus')
        .get()
        .then((QuerySnapshot querySnapshot) {
      final List<String> fetchedModeTexts = [];
      querySnapshot.docs.forEach((doc) {
        final text = doc['text'];
        fetchedModeTexts.add(text);
        if (!modeTexts.contains(text)) {
          addModeToHive(text);
        }
      });

      setState(() {
        modeTexts = fetchedModeTexts;
        modeColors = List<Color>.generate(
            modeTexts.length, (_) => _generateRandomColor());
      });
    });
  }

  void addModeToFirestore(String text) {
    FirebaseFirestore.instance.collection('Focus').add({'text': text});
  }

  void deleteModeFromFirestore(int index) {
    FirebaseFirestore.instance
        .collection('Focus')
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (index < querySnapshot.docs.length) {
        final modeId = querySnapshot.docs[index].id;
        FirebaseFirestore.instance
            .collection('Focus')
            .doc(modeId)
            .delete()
            .then((_) {
          setState(() {
            modeTexts.removeAt(index);
            modeColors.removeAt(index);
          });
        });
      }
    });
  }

  void showCreateModeDialog() {
    _textEditingController.text = ''; // Clear the previous text
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Create Focus'),
          content: Column(
            children: [
              const SizedBox(height: 20),
              CupertinoTextField(
                controller: _textEditingController,
                autofocus: true,
                placeholder: 'Create a Focus',
              ),
              const SizedBox(height: 10),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
              isDestructiveAction: true,
            ),
            CupertinoDialogAction(
              onPressed: () {
                final text = _textEditingController.text.trim();
                if (text.isNotEmpty) {
                  if (isOnline) {
                    addModeToFirestore(text);
                  } else {
                    addModeToHive(text);
                  }
                  setState(() {
                    modeTexts.add(text);
                    modeColors.add(_generateRandomColor());
                  });
                }
                Navigator.of(context).pop();
              },
              child: const Text('Create'),
            ),
          ],
        );
      },
    );
  }

  Color _generateRandomColor() {
    final random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }

  void showDeleteConfirmationDialog(int index) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              child: const Text('Delete'),
              onPressed: () {
                if (isOnline) {
                  deleteModeFromFirestore(index);
                } else {
                  deleteModeFromHive(index);
                }
                Navigator.of(context).pop();
              },
              isDestructiveAction: true,
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }

  Widget _buildPredefinedCard(int index) {
    late IconData icon;
    late Color color;
    late String text;

    switch (index) {
      case 0:
        icon = CupertinoIcons.book_fill;
        color = Colors.orange;
        text = 'Reading';
        break;
      case 1:
        icon = IconData(0xe28d, fontFamily: 'MaterialIcons');
        color = Colors.green;
        text = 'Fitness';
        break;
      case 2:
        icon = IconData(0xf5ee,
            fontFamily: CupertinoIcons.iconFont,
            fontPackage: CupertinoIcons.iconFontPackage);
        color = Colors.blue;
        text = 'Mindfulness';
        break;
      case 3:
        icon = IconData(0xf625,
            fontFamily: CupertinoIcons.iconFont,
            fontPackage: CupertinoIcons.iconFontPackage);
        color = Colors.red;
        text = 'Work';
        break;
      default:
        return Container();
    }

    return Container(
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
            backgroundColor: color.withOpacity(0.3),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreatedCard(int modeIndex) {
    final modeColor = modeColors[modeIndex];
    final textColor =
        modeColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;

    return GestureDetector(
      onTap: () {
        // Perform action when mode is tapped
      },
      onLongPress: () {
        showDeleteConfirmationDialog(modeIndex);
      },
      child: Container(
        width: 110,
        height: 40,
        decoration: BoxDecoration(
          color: modeColor,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            modeTexts[modeIndex],
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

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
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20),
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
                        'Choose your Focus',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                CupertinoButton(
                  onPressed: () {
                    showCreateModeDialog();
                  },
                  child: const Icon(
                    CupertinoIcons.add,
                    size: 30,
                  ),
                ),
              ],
            ),
            Expanded(
              child: CupertinoScrollbar(
                child: ListView.builder(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 10,
                    right: 20,
                    bottom: 10,
                  ),
                  itemCount: modeTexts.length + 4,
                  itemBuilder: (context, index) {
                    if (index < 4) {
                      return _buildPredefinedCard(index);
                    } else {
                      final modeIndex = index - 4;
                      return _buildCreatedCard(modeIndex);
                    }
                  },
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
//best working

//try

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ModePage extends StatefulWidget {
  const ModePage({super.key});

  @override
  _ModePageState createState() => _ModePageState();
}

class _ModePageState extends State<ModePage> {
  List<String> modeTexts = [];
  TextEditingController _textEditingController = TextEditingController();
  late Box<String>? hiveBox;
  late StreamSubscription<ConnectivityResult> connectivitySubscription;
  bool isOnline = false;

  @override
  void initState() {
    super.initState();
    initializeHive();
    initializeConnectivity();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initializeHive() async {
    await Hive.initFlutter();
    hiveBox = await Hive.openBox<String>('modes');
    loadModesFromHive();
  }

  void initializeConnectivity() {
    connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        isOnline = result != ConnectivityResult.none;
      });

      if (isOnline) {
        syncModesWithFirestore();
      }
    });
  }

  void loadModesFromHive() {
    if (hiveBox != null) {
      modeTexts = hiveBox!.values.toList();
      setState(() {});
    }
  }

  void addModeToHive(String text) {
    hiveBox!.add(text);
  }

  void deleteModeFromHive(int index) {
    hiveBox!.deleteAt(index);
    setState(() {
      modeTexts.removeAt(index);
    });
  }

  void syncModesWithFirestore() {
    FirebaseFirestore.instance
        .collection('Focus')
        .get()
        .then((QuerySnapshot querySnapshot) {
      final List<String> fetchedModeTexts = [];
      querySnapshot.docs.forEach((doc) {
        final text = doc['text'];
        fetchedModeTexts.add(text);
        if (!modeTexts.contains(text)) {
          addModeToHive(text);
        }
      });

      setState(() {
        modeTexts = fetchedModeTexts;
      });
    });
  }

  void deleteModeFromFirestore(int index) {
    FirebaseFirestore.instance
        .collection('Focus')
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (index < querySnapshot.docs.length) {
        final modeId = querySnapshot.docs[index].id;
        FirebaseFirestore.instance
            .collection('Focus')
            .doc(modeId)
            .delete()
            .then((_) {
          setState(() {
            modeTexts.removeAt(index);
          });
        });
      }
    });
  }

  void navigateToCreateFocusScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateFocusScreen(),
      ),
    );
  }

/*
  Widget _buildPredefinedCard(int index) {
    late IconData icon;
    late Color color;
    late String text;

    switch (index) {
      case 0:
        icon = CupertinoIcons.book_fill;
        color = Colors.orange;
        text = 'Reading';
        break;
      case 1:
        icon = const IconData(0xe28d, fontFamily: 'MaterialIcons');
        color = Colors.green;
        text = 'Fitness';
        break;
      case 2:
        icon = const IconData(0xf5ee,
            fontFamily: CupertinoIcons.iconFont,
            fontPackage: CupertinoIcons.iconFontPackage);
        color = Colors.blue;
        text = 'Mindfulness';
        break;
      case 3:
        icon = const IconData(0xf625,
            fontFamily: CupertinoIcons.iconFont,
            fontPackage: CupertinoIcons.iconFontPackage);
        color = Colors.red;
        text = 'Work';
        break;
      default:
        return Container();
    }

    return Container(
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
            backgroundColor: color.withOpacity(0.3),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
*/
  Widget _buildPredefinedCard(int index) {
    // Predefined modes
    final predefinedModes = [
      {
        'icon': CupertinoIcons.book_fill,
        'color': Colors.orange,
        'text': 'Reading',
      },
      {
        'icon': const IconData(0xe28d, fontFamily: 'MaterialIcons'),
        'color': Colors.green,
        'text': 'Fitness',
      },
      {
        'icon': const IconData(0xf5ee,
            fontFamily: CupertinoIcons.iconFont,
            fontPackage: CupertinoIcons.iconFontPackage),
        'color': Colors.blue,
        'text': 'Mindfulness',
      },
      {
        'icon': const IconData(0xf625,
            fontFamily: CupertinoIcons.iconFont,
            fontPackage: CupertinoIcons.iconFontPackage),
        'color': Colors.red,
        'text': 'Work',
      },
    ];

    if (index < predefinedModes.length) {
      final modeData = predefinedModes[index];
      final icon = modeData['icon'] as IconData;
      final color = modeData['color'] as Color;
      final text = modeData['text'] as String;

      return Container(
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
              backgroundColor: color.withOpacity(0.3),
              child: Icon(
                icon,
                color: color,
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      // User-created modes from Firestore
      final firebaseIndex = index - predefinedModes.length;
      if (firebaseIndex < modeTexts.length) {
        final modeText = modeTexts[firebaseIndex];

        return StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Focus')
              .doc(modeText)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator(); // Loading indicator
            }

            final focusData = snapshot.data?.data() as Map<String, dynamic>;
            if (focusData == null) {
              return Container(); // Return an empty container if data doesn't exist
            }

            final icon = focusData['icon'] as IconData;
            final color = Color(int.parse(focusData['color']));
            final iconData = IconData(int.parse(focusData['iconData']),
                fontFamily: 'MaterialIcons');

            return Container(
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
                    backgroundColor: color.withOpacity(0.3),
                    child: Icon(
                      iconData,
                      color: color,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Center(
                      child: Text(
                        modeText,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      } else {
        return Container(); // Return an empty container if index is out of range
      }
    }
  }

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
                        'Choose your Focus',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                CupertinoButton(
                  onPressed: () {
                    navigateToCreateFocusScreen(context);
                  },
                  child: const Icon(
                    CupertinoIcons.add,
                    size: 30,
                  ),
                ),
              ],
            ),
            Expanded(
              child: CupertinoScrollbar(
                child: ListView.builder(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 10,
                    right: 20,
                    bottom: 10,
                  ),
                  itemCount: modeTexts.length + 4,
                  itemBuilder: (context, index) {
                    if (index < 4) {
                      return _buildPredefinedCard(index);
                    } else {
                      final modeIndex = index - 4;
                      //return _buildCreatedCard(modeIndex);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateFocusScreen extends StatelessWidget {
  const CreateFocusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 140),
                const Text(
                  'What do you want to focus on?',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Choose a Focus to get started',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const CustomFocusScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 325,
                    height: 60,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: const Row(
                      children: [
                        SizedBox(width: 10),
                        Icon(
                          CupertinoIcons.add_circled_solid,
                          color: Colors.grey,
                          size: 20,
                        ),
                        Spacer(),
                        Text(
                          'Custom',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Spacer(),
                        Icon(CupertinoIcons.forward, color: Colors.black),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 5,
              right: 20,
              child: CupertinoButton(
                padding: const EdgeInsets.all(5),
                child: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: CupertinoColors.systemGrey,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
class CustomFocusScreen extends StatefulWidget {
  const CustomFocusScreen({Key? key}) : super(key: key);

  @override
  _CustomFocusScreenState createState() => _CustomFocusScreenState();
}

class _CustomFocusScreenState extends State<CustomFocusScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  bool isEditing = false;
  Color? selectedColor;

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        isEditing = _textEditingController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CupertinoButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Row(
                    children: [
                      Icon(CupertinoIcons.left_chevron),
                      Text('Back'),
                    ],
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 20),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Name Your Focus',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isEditing = true;
                  });
                },
                child: Card(
                  elevation: 0.1,
                  color: Colors.grey.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: 300,
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: isEditing
                        ? CupertinoTextField(
                            controller: _textEditingController,
                            placeholder: '',
                            autofocus: true,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.transparent,
                              ),
                            ),
                          )
                        : const Center(
                            child: Text(
                              'Name',
                              style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(backgroundColor: Colors.blue, radius: 20),
                CircleAvatar(backgroundColor: Colors.brown, radius: 20),
                CircleAvatar(backgroundColor: Colors.grey, radius: 20),
                CircleAvatar(backgroundColor: Colors.green, radius: 20),
                CircleAvatar(backgroundColor: Colors.purple, radius: 20),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(backgroundColor: Colors.orange, radius: 20),
                CircleAvatar(backgroundColor: Colors.red, radius: 20),
                CircleAvatar(backgroundColor: Colors.pink, radius: 20),
                CircleAvatar(backgroundColor: Colors.redAccent, radius: 20),
                CircleAvatar(backgroundColor: Colors.cyan, radius: 20),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 20,
                  child: Icon(
                    CupertinoIcons.piano,
                    color: Colors.grey,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 20,
                  child: Icon(
                    CupertinoIcons.slider_horizontal_3,
                    color: Colors.grey,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 20,
                  child: Icon(
                    CupertinoIcons.sportscourt_fill,
                    color: Colors.grey,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 20,
                  child: Icon(
                    CupertinoIcons.tickets_fill,
                    color: Colors.grey,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 20,
                  child: Icon(
                    CupertinoIcons.train_style_two,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 20,
                  child: Icon(
                    CupertinoIcons.cart_fill,
                    color: Colors.grey,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 20,
                  child: Icon(
                    CupertinoIcons.chat_bubble_text_fill,
                    color: Colors.grey,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 20,
                  child: Icon(
                    CupertinoIcons.create_solid,
                    color: Colors.grey,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 20,
                  child: Icon(
                    CupertinoIcons.creditcard_fill,
                    color: Colors.grey,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 20,
                  child: Icon(
                    CupertinoIcons.device_laptop,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 20,
                  child: Icon(
                    CupertinoIcons.airplane,
                    color: Colors.grey,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 20,
                  child: Icon(
                    CupertinoIcons.game_controller_solid,
                    color: Colors.grey,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 20,
                  child: Icon(
                    CupertinoIcons.sportscourt_fill,
                    color: Colors.grey,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 20,
                  child: Icon(
                    CupertinoIcons.recordingtape,
                    color: Colors.grey,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 20,
                  child: Icon(
                    CupertinoIcons.delete_simple,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 20,
                  child: Icon(
                    CupertinoIcons.money_yen,
                    color: Colors.grey,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 20,
                  child: Icon(
                    CupertinoIcons.ellipses_bubble,
                    color: Colors.grey,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 20,
                  child: Icon(
                    CupertinoIcons.badge_plus_radiowaves_right,
                    color: Colors.grey,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 20,
                  child: Icon(
                    CupertinoIcons.xmark_octagon,
                    color: Colors.grey,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 20,
                  child: Icon(
                    CupertinoIcons.waveform_path,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Handle the "Create" action
                },
                child: Card(
                  elevation: 0.1,
                  color:
                      const Color.fromARGB(255, 195, 195, 195).withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: 200,
                    height: 50,
                    alignment: Alignment.center,
                    child: const Text(
                      'Create',
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
*/
//works try

/*
class CustomFocusScreen extends StatefulWidget {
  const CustomFocusScreen({Key? key}) : super(key: key);

  @override
  _CustomFocusScreenState createState() => _CustomFocusScreenState();
}

class _CustomFocusScreenState extends State<CustomFocusScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  bool isEditing = false;
  Color? selectedColor;
  IconData? selectedIcon;
  Color initialSelectedColor = Colors.blue;
  IconData initialSelectedIcon = CupertinoIcons.piano;

  @override
  void initState() {
    super.initState();
    selectedColor = initialSelectedColor;
    selectedIcon = initialSelectedIcon;
    _textEditingController.addListener(() {
      setState(() {
        isEditing = _textEditingController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CupertinoButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Row(
                      children: [
                        Icon(CupertinoIcons.left_chevron),
                        Text('Back'),
                      ],
                    ),
                  ),
                ],
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Name Your Focus',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              // Selected icon with color above text card
              SizedBox(height: 20),
              Center(
                child: selectedIcon != null
                    ? CircleAvatar(
                        backgroundColor: selectedColor,
                        radius: 20,
                        child: Icon(
                          selectedIcon,
                          color: Colors.white,
                        ),
                      )
                    : Container(),
              ),
              const SizedBox(height: 80),

              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isEditing = true;
                    });
                  },
                  child: Card(
                    elevation: 0.1,
                    color: Colors.grey.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: 300,
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: isEditing
                          ? CupertinoTextField(
                              controller: _textEditingController,
                              placeholder: '',
                              autofocus: true,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                              ),
                            )
                          : const Center(
                              child: Text(
                                'Name',
                                style: TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(backgroundColor: Colors.blue, radius: 20),
                  CircleAvatar(backgroundColor: Colors.brown, radius: 20),
                  CircleAvatar(backgroundColor: Colors.grey, radius: 20),
                  CircleAvatar(backgroundColor: Colors.green, radius: 20),
                  CircleAvatar(backgroundColor: Colors.purple, radius: 20),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(backgroundColor: Colors.orange, radius: 20),
                  CircleAvatar(backgroundColor: Colors.red, radius: 20),
                  CircleAvatar(backgroundColor: Colors.pink, radius: 20),
                  CircleAvatar(backgroundColor: Colors.redAccent, radius: 20),
                  CircleAvatar(backgroundColor: Colors.cyan, radius: 20),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 20,
                    child: Icon(
                      CupertinoIcons.piano,
                      color: Colors.grey,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 20,
                    child: Icon(
                      CupertinoIcons.slider_horizontal_3,
                      color: Colors.grey,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 20,
                    child: Icon(
                      CupertinoIcons.sportscourt_fill,
                      color: Colors.grey,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 20,
                    child: Icon(
                      CupertinoIcons.tickets_fill,
                      color: Colors.grey,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 20,
                    child: Icon(
                      CupertinoIcons.train_style_two,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 20,
                    child: Icon(
                      CupertinoIcons.cart_fill,
                      color: Colors.grey,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 20,
                    child: Icon(
                      CupertinoIcons.chat_bubble_text_fill,
                      color: Colors.grey,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 20,
                    child: Icon(
                      CupertinoIcons.create_solid,
                      color: Colors.grey,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 20,
                    child: Icon(
                      CupertinoIcons.creditcard_fill,
                      color: Colors.grey,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 20,
                    child: Icon(
                      CupertinoIcons.device_laptop,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 20,
                    child: Icon(
                      CupertinoIcons.airplane,
                      color: Colors.grey,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 20,
                    child: Icon(
                      CupertinoIcons.game_controller_solid,
                      color: Colors.grey,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 20,
                    child: Icon(
                      CupertinoIcons.sportscourt_fill,
                      color: Colors.grey,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 20,
                    child: Icon(
                      CupertinoIcons.recordingtape,
                      color: Colors.grey,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 20,
                    child: Icon(
                      CupertinoIcons.delete_simple,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 20,
                    child: Icon(
                      CupertinoIcons.money_yen,
                      color: Colors.grey,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 20,
                    child: Icon(
                      CupertinoIcons.ellipses_bubble,
                      color: Colors.grey,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 20,
                    child: Icon(
                      CupertinoIcons.badge_plus_radiowaves_right,
                      color: Colors.grey,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 20,
                    child: Icon(
                      CupertinoIcons.xmark_octagon,
                      color: Colors.grey,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 20,
                    child: Icon(
                      CupertinoIcons.waveform_path,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Handle the "Create" action
                  },
                  child: Card(
                    elevation: 0.1,
                    color: const Color.fromARGB(255, 195, 195, 195)
                        .withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: 200,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        'Create',
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

*/

//new code

class CustomFocusScreen extends StatefulWidget {
  const CustomFocusScreen({Key? key}) : super(key: key);

  @override
  _CustomFocusScreenState createState() => _CustomFocusScreenState();
}

class _CustomFocusScreenState extends State<CustomFocusScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  bool isEditing = false;
  Color? selectedColor;
  IconData? selectedIcon;
  Color initialSelectedColor = Colors.blue;
  IconData initialSelectedIcon = CupertinoIcons.piano;

  @override
  void initState() {
    super.initState();
    selectedColor = initialSelectedColor;
    selectedIcon = initialSelectedIcon;
    _textEditingController.addListener(() {
      setState(() {
        isEditing = _textEditingController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void changeSelectedIcon(IconData newIcon) {
    setState(() {
      selectedIcon = newIcon;
    });
  }

  void changeSelectedColor(Color newColor) {
    setState(() {
      selectedColor = newColor;
    });
  }

  //saving data
  Future<void> saveFocusData() async {
    // Get the focus name from the text field
    String focusName = _textEditingController.text;

    // Save data to Firebase
    await FirebaseFirestore.instance.collection('focus').add({
      'name': focusName,
      'icon': selectedIcon.toString(),
      'color': selectedColor.toString(),
    });

    // Save data to Hive
    final focusBox = await Hive.openBox('focusBox');
    final focusId = await focusBox.add({
      'name': focusName,
      'icon': selectedIcon.toString(),
      'color': selectedColor.toString(),
    });

    print('Focus data saved with ID: $focusId');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CupertinoButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Row(
                      children: [
                        Icon(CupertinoIcons.left_chevron),
                        Text('Back'),
                      ],
                    ),
                  ),
                ],
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Name Your Focus',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              // const SizedBox(height: 100),
              // Selected icon with color above text card
              const SizedBox(height: 40),
              Center(
                child: selectedIcon != null
                    ? CircleAvatar(
                        backgroundColor: selectedColor,
                        radius: 30,
                        child: Icon(
                          selectedIcon,
                          color: Colors.white,
                        ),
                      )
                    : Container(),
              ),
              const SizedBox(height: 50),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isEditing = true;
                    });
                  },
                  child: Card(
                    elevation: 0.1,
                    color: Colors.grey.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: 300,
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: isEditing
                          ? CupertinoTextField(
                              controller: _textEditingController,
                              placeholder: '',
                              autofocus: true,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                              ),
                            )
                          : const Center(
                              child: Text(
                                'Name',
                                style: TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      changeSelectedColor(Colors.blue);
                    },
                    child: const CircleAvatar(
                        backgroundColor: Colors.blue, radius: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeSelectedColor(Colors.brown);
                    },
                    child: const CircleAvatar(
                        backgroundColor: Colors.brown, radius: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeSelectedColor(Colors.grey);
                    },
                    child: const CircleAvatar(
                        backgroundColor: Colors.grey, radius: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeSelectedColor(Colors.green);
                    },
                    child: const CircleAvatar(
                        backgroundColor: Colors.green, radius: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeSelectedColor(Colors.purple);
                    },
                    child: const CircleAvatar(
                        backgroundColor: Colors.purple, radius: 20),
                  ),

                  // Add more color options here
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      changeSelectedColor(Colors.orange);
                    },
                    child: const CircleAvatar(
                        backgroundColor: Colors.orange, radius: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeSelectedColor(Colors.red);
                    },
                    child: const CircleAvatar(
                        backgroundColor: Colors.red, radius: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeSelectedColor(Colors.pink);
                    },
                    child: const CircleAvatar(
                        backgroundColor: Colors.pink, radius: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeSelectedColor(Colors.redAccent);
                    },
                    child: const CircleAvatar(
                        backgroundColor: Colors.redAccent, radius: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeSelectedColor(Colors.cyan);
                    },
                    child: const CircleAvatar(
                        backgroundColor: Colors.cyan, radius: 20),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              //row 1 icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      changeSelectedIcon(CupertinoIcons.piano);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 20,
                      child: Icon(
                        CupertinoIcons.piano,
                        color: selectedIcon == CupertinoIcons.piano
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeSelectedIcon(CupertinoIcons.slider_horizontal_3);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 20,
                      child: Icon(
                        CupertinoIcons.slider_horizontal_3,
                        color:
                            selectedIcon == CupertinoIcons.slider_horizontal_3
                                ? Colors.white
                                : Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeSelectedIcon(
                        CupertinoIcons.sportscourt_fill,
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 20,
                      child: Icon(
                        CupertinoIcons.sportscourt_fill,
                        color: selectedIcon == CupertinoIcons.sportscourt_fill
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeSelectedIcon(
                        CupertinoIcons.tickets_fill,
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 20,
                      child: Icon(
                        CupertinoIcons.tickets_fill,
                        color: selectedIcon == CupertinoIcons.tickets_fill
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeSelectedIcon(
                        CupertinoIcons.train_style_two,
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 20,
                      child: Icon(
                        CupertinoIcons.train_style_two,
                        color: selectedIcon == CupertinoIcons.train_style_two
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                  // Add more icon options here
                ],
              ),
              // ... more rows of CircleAvatar widgets ...
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      changeSelectedIcon(CupertinoIcons.cart_fill);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 20,
                      child: Icon(
                        CupertinoIcons.cart_fill,
                        color: selectedIcon == CupertinoIcons.cart_fill
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeSelectedIcon(CupertinoIcons.chat_bubble_text_fill);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 20,
                      child: Icon(
                        CupertinoIcons.chat_bubble_text_fill,
                        color:
                            selectedIcon == CupertinoIcons.chat_bubble_text_fill
                                ? Colors.white
                                : Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeSelectedIcon(
                        CupertinoIcons.create_solid,
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 20,
                      child: Icon(
                        CupertinoIcons.create_solid,
                        color: selectedIcon == CupertinoIcons.create_solid
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeSelectedIcon(
                        CupertinoIcons.creditcard_fill,
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 20,
                      child: Icon(
                        CupertinoIcons.creditcard_fill,
                        color: selectedIcon == CupertinoIcons.creditcard_fill
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeSelectedIcon(
                        CupertinoIcons.device_laptop,
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 20,
                      child: Icon(
                        CupertinoIcons.device_laptop,
                        color: selectedIcon == CupertinoIcons.device_laptop
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                  // Add more icon options here
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      changeSelectedIcon(CupertinoIcons.airplane);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 20,
                      child: Icon(
                        CupertinoIcons.airplane,
                        color: selectedIcon == CupertinoIcons.airplane
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeSelectedIcon(CupertinoIcons.game_controller_solid);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 20,
                      child: Icon(
                        CupertinoIcons.game_controller_solid,
                        color:
                            selectedIcon == CupertinoIcons.game_controller_solid
                                ? Colors.white
                                : Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeSelectedIcon(
                        CupertinoIcons.recordingtape,
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 20,
                      child: Icon(
                        CupertinoIcons.recordingtape,
                        color: selectedIcon == CupertinoIcons.recordingtape
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeSelectedIcon(
                        CupertinoIcons.delete_simple,
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 20,
                      child: Icon(
                        CupertinoIcons.delete_simple,
                        color: selectedIcon == CupertinoIcons.delete_simple
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeSelectedIcon(
                        CupertinoIcons.money_yen,
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 20,
                      child: Icon(
                        CupertinoIcons.money_yen,
                        color: selectedIcon == CupertinoIcons.money_yen
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                  // Add more icon options here
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      changeSelectedIcon(CupertinoIcons.ellipses_bubble);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 20,
                      child: Icon(
                        CupertinoIcons.ellipses_bubble,
                        color: selectedIcon == CupertinoIcons.ellipses_bubble
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeSelectedIcon(
                          CupertinoIcons.badge_plus_radiowaves_right);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 20,
                      child: Icon(
                        CupertinoIcons.badge_plus_radiowaves_right,
                        color: selectedIcon ==
                                CupertinoIcons.badge_plus_radiowaves_right
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeSelectedIcon(
                        CupertinoIcons.xmark_octagon,
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 20,
                      child: Icon(
                        CupertinoIcons.xmark_octagon,
                        color: selectedIcon == CupertinoIcons.xmark_octagon
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeSelectedIcon(
                        CupertinoIcons.waveform_path,
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 20,
                      child: Icon(
                        CupertinoIcons.waveform_path,
                        color: selectedIcon == CupertinoIcons.waveform_path
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeSelectedIcon(
                        CupertinoIcons.forward,
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 20,
                      child: Icon(
                        CupertinoIcons.forward,
                        color: selectedIcon == CupertinoIcons.forward
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                  // Add more icon options here
                ],
              ),
              const SizedBox(height: 60),
              Center(
                child: GestureDetector(
                  onTap: () {
                    saveFocusData();
                    Navigator.pop(context);
                  },
                  child: Card(
                    elevation: 0.1,
                    color: const Color.fromARGB(255, 195, 195, 195)
                        .withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: 200,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        'Create',
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
