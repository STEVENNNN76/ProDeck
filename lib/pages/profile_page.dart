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
*/

// best working code
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prodeck/pages/auth_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User? user = FirebaseAuth.instance.currentUser;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    openUserBox();
    fetchUserData();
  }

  Future<void> openUserBox() async {
    await Hive.initFlutter();
    await Hive.openBox('user');
  }

  Future<void> fetchUserData() async {
    try {
      final snapshot = await DatabaseService().Hospital.doc(user?.uid).get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>?;
        if (data != null) {
          setState(() {
            _nameController.text = data['name'];
            _ageController.text = data['age'].toString();
            _passwordController.text = data['password'];
          });
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
              FocusScope.of(context).nextFocus();
            },
          ),
          const SizedBox(height: 16.0),
          CupertinoTextField(
            controller: _ageController,
            placeholder: 'Age',
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            onEditingComplete: () {
              FocusScope.of(context).nextFocus();
            },
          ),
          const SizedBox(height: 16.0),
          CupertinoTextField(
            readOnly: true,
            controller: TextEditingController(text: user?.email ?? ''),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          const SizedBox(height: 16.0),
          Stack(
            alignment: Alignment.centerRight,
            children: [
              CupertinoTextField(
                controller: _passwordController,
                readOnly: true,
                obscureText: !_passwordVisible,
                placeholder: 'Password',
              ),
              Positioned(
                right: 8.0,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  child: Icon(
                    _passwordVisible
                        ? CupertinoIcons.eye_slash
                        : CupertinoIcons.eye,
                  ),
                ),
              ),
            ],
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

  Future<void> saveUserData() async {
    String name = _nameController.text;
    int age = int.tryParse(_ageController.text) ?? 0;
    String password = _passwordController.text;

    Map<String, dynamic> userData = {
      'name': name,
      'age': age,
      'email': user?.email,
      'password': password,
    };

    Box userBox = Hive.box('user');
    userBox.put('name', name);
    userBox.put('age', age);
    userBox.put('email', user?.email);
    userBox.put('password', password);

    await DatabaseService().Hospital.doc(user?.uid).set(userData);

    FocusScope.of(context).unfocus();
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AuthPage(onTap: () {})),
    );
  }
}

class DatabaseService {
  final CollectionReference Hospital =
      FirebaseFirestore.instance.collection('User');
}
*/
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:prodeck/pages/auth_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User? user = FirebaseAuth.instance.currentUser;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;
  File? _profileImage;

  @override
  void initState() {
    super.initState();
    openUserBox();
    fetchUserData();
  }

  Future<void> openUserBox() async {
    await Hive.initFlutter();
    await Hive.openBox('user');
  }

  Future<void> fetchUserData() async {
    try {
      final snapshot = await DatabaseService().Hospital.doc(user?.uid).get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>?;
        if (data != null) {
          setState(() {
            _nameController.text = data['name'];
            _ageController.text = data['age'].toString();
            _passwordController.text = data['password'];
          });
        }
      }
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _profileImage = File(pickedImage.path);
      });
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
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                buildProfilePicture(),
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

  Widget buildProfilePicture() {
    return GestureDetector(
      onTap: () {
        showImagePicker();
      },
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey),
        ),
        child: ClipOval(
          child: _profileImage != null
              ? Image.file(
                  _profileImage!,
                  fit: BoxFit.cover,
                )
              : Icon(
                  CupertinoIcons.person,
                  size: 120,
                ),
        ),
      ),
    );
  }

  Future<void> showImagePicker() async {
    final picker = ImagePicker();
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () async {
                Navigator.pop(context);
                final pickedImage = await picker.pickImage(
                  source: ImageSource.camera,
                );
                if (pickedImage != null) {
                  setState(() {
                    _profileImage = File(pickedImage.path);
                  });
                }
              },
              child: const Text('Take a Photo'),
            ),
            CupertinoActionSheetAction(
              onPressed: () async {
                Navigator.pop(context);
                final pickedImage = await picker.pickImage(
                  source: ImageSource.gallery,
                );
                if (pickedImage != null) {
                  setState(() {
                    _profileImage = File(pickedImage.path);
                  });
                }
              },
              child: const Text('Choose from Gallery'),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        );
      },
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
              FocusScope.of(context).nextFocus();
            },
          ),
          const SizedBox(height: 16.0),
          CupertinoTextField(
            controller: _ageController,
            placeholder: 'Age',
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            onEditingComplete: () {
              FocusScope.of(context).nextFocus();
            },
          ),
          const SizedBox(height: 16.0),
          CupertinoTextField(
            readOnly: true,
            controller: TextEditingController(text: user?.email ?? ''),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          const SizedBox(height: 16.0),
          Stack(
            alignment: Alignment.centerRight,
            children: [
              CupertinoTextField(
                controller: _passwordController,
                readOnly: true,
                obscureText: !_passwordVisible,
                placeholder: 'Password',
              ),
              Positioned(
                right: 8.0,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  child: Icon(
                    _passwordVisible
                        ? CupertinoIcons.eye_slash
                        : CupertinoIcons.eye,
                  ),
                ),
              ),
            ],
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

  Future<void> saveUserData() async {
    String name = _nameController.text;
    int age = int.tryParse(_ageController.text) ?? 0;
    String password = _passwordController.text;

    Map<String, dynamic> userData = {
      'name': name,
      'age': age,
      'email': user?.email,
      'password': password,
    };

    Box userBox = Hive.box('user');
    userBox.put('name', name);
    userBox.put('age', age);
    userBox.put('email', user?.email);
    userBox.put('password', password);

    await DatabaseService().Hospital.doc(user?.uid).set(userData);

    // Upload profile image to Firebase Storage
    if (_profileImage != null) {
      try {
        String imageUrl = await uploadImageToFirebaseStorage();
        userData['profileImageUrl'] = imageUrl;
        await DatabaseService().Hospital.doc(user?.uid).update(userData);
      } catch (error) {
        print('Error uploading profile image: $error');
      }
    }

    FocusScope.of(context).unfocus();
  }

  Future<String> uploadImageToFirebaseStorage() async {
    try {
      final fileName =
          '${user?.uid}_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child(fileName);
      await storageRef.putFile(_profileImage!);
      final imageUrl = await storageRef.getDownloadURL();
      return imageUrl;
    } catch (error) {
      print('Error uploading profile image: $error');
      throw error;
    }
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AuthPage(onTap: () {})),
    );
  }
}

class DatabaseService {
  final CollectionReference Hospital =
      FirebaseFirestore.instance.collection('User');
}
