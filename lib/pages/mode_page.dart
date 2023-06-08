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
