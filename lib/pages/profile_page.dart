/*
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Profile'),
        leading: CupertinoButton(
          onPressed: () => Navigator.pop(context),
          child: const Icon(CupertinoIcons.back),
        ),
        trailing: CupertinoButton(
          onPressed: signUserOut,
          child: const Text('Logout'),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'User Profile',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .doc(user!.uid)
                  .get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;

                  return Column(
                    children: [
                      Text('Name: ${data['name']}'),
                      Text('Email: ${user!.email}'),
                      Text('Age: ${data['age']}'),
                    ],
                  );
                }

                return const CupertinoActivityIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }
}
*/
/*
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Profile'),
        leading: CupertinoButton(
          onPressed: () => Navigator.pop(context),
          child: const Icon(CupertinoIcons.back),
        ),
        trailing: CupertinoButton(
          onPressed: signUserOut,
          child: const Text('Logout'),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'User Profile',
              style: Theme.of(context).textTheme.headlineMedium!,
            ),
            const SizedBox(height: 20),
            FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .doc(user?.uid)
                  .get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic>? data =
                      snapshot.data?.data() as Map<String, dynamic>?;

                  if (data != null) {
                    return Column(
                      children: [
                        Text('Name: ${data['name']}'),
                        Text('Email: ${user?.email}'),
                        Text('Age: ${data['age']}'),
                      ],
                    );
                  } else {
                    return const Text('User data not found');
                  }
                }

                return const CupertinoActivityIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }
}
*/

//code 2
/*
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User? user = FirebaseAuth.instance.currentUser;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  String _selectedSex = '';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Profile'),
        leading: CupertinoButton(
          onPressed: () => Navigator.pop(context),
          child: const Icon(CupertinoIcons.back),
        ),
        trailing: CupertinoButton(
          onPressed: signUserOut,
          child: const Text('Logout'),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              FutureBuilder<DocumentSnapshot>(
                future: DatabaseService().Hospital.doc(user?.uid).get(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, dynamic>? data =
                        snapshot.data?.data() as Map<String, dynamic>?;

                    if (data != null) {
                      _nameController.text = data['name'];
                      _emailController.text = user?.email ?? '';
                      _ageController.text = data['age'].toString();
                      _selectedSex = data['sex'] ?? '';

                      return buildUserDataForm();
                    } else {
                      return buildUserDataForm();
                    }
                  }

                  return const Center(child: CupertinoActivityIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildUserDataForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CupertinoTextField(
            controller: _nameController,
            placeholder: 'Name',
          ),
          const SizedBox(height: 16.0),
          CupertinoTextField(
            controller: _emailController,
            placeholder: 'Email',
            enabled: false,
          ),
          const SizedBox(height: 16.0),
          CupertinoTextField(
            controller: _ageController,
            placeholder: 'Age',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16.0),
          CupertinoSlidingSegmentedControl<String>(
            groupValue: _selectedSex,
            onValueChanged: (value) {
              setState(() {
                _selectedSex = value ?? '';
              });
            },
            children: {
              'Male': const Text('Male'),
              'Female': const Text('Female'),
              'PreferNotToSay': const Text('Prefer Not to Say'),
            },
          ),
          const SizedBox(height: 16.0),
          CupertinoButton.filled(
            onPressed: saveUserData,
            child: const Text('Save User Data'),
          ),
        ],
      ),
    );
  }

  void saveUserData() {
    String name = _nameController.text;
    int age = int.tryParse(_ageController.text) ?? 0;

    // Create a new user document with the entered data
    Map<String, dynamic> userData = {
      'name': name,
      'age': age,
      'sex': _selectedSex,
    };

    DatabaseService().Hospital.doc(user?.uid).set(userData);
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }
}

class DatabaseService {
  // Collection reference
  final CollectionReference Hospital =
      FirebaseFirestore.instance.collection('User');
}
*/

//code 3
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User? user = FirebaseAuth.instance.currentUser;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch user data on initialization
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final snapshot = await DatabaseService().Hospital.doc(user?.uid).get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>?;
        if (data != null) {
          _nameController.text = data['name'];
          _ageController.text = data['age'].toString();
        }
      }
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Profile'),
        leading: CupertinoButton(
          onPressed: () => Navigator.pop(context),
          child: const Icon(CupertinoIcons.back),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          // Dismiss the keyboard when tapping outside the text fields
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                buildUserDataForm(),
                const SizedBox(height: 20),
                CupertinoButton(
                  onPressed: signUserOut,
                  child: const Text('Logout'),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildUserDataForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CupertinoTextField(
            controller: _nameController,
            placeholder: 'Name',
            textInputAction: TextInputAction.next,
            onEditingComplete: () {
              // Move focus to the next text field (age field)
              FocusScope.of(context).nextFocus();
            },
          ),
          const SizedBox(height: 16.0),
          CupertinoTextField(
            controller: _ageController,
            placeholder: 'Age',
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            onEditingComplete: () {
              // Dismiss the keyboard when pressing done on age field
              FocusScope.of(context).unfocus();
            },
          ),
          const SizedBox(height: 16.0),
          CupertinoButton.filled(
            onPressed: saveUserData,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void saveUserData() {
    String name = _nameController.text;
    int age = int.tryParse(_ageController.text) ?? 0;

    // Create a new user document with the entered data
    Map<String, dynamic> userData = {
      'name': name,
      'age': age,
    };

    DatabaseService().Hospital.doc(user?.uid).set(userData);

    // Remove focus from text fields and hide keyboard
    FocusScope.of(context).unfocus();
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }
}

class DatabaseService {
  final CollectionReference Hospital =
      FirebaseFirestore.instance.collection('User');
}
