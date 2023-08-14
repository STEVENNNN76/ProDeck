import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ignore: use_key_in_widget_constructors
class DropPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Data Deletion'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Delete all data from Hive local storage?',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Delete all data from Hive box
                await Hive.box('taskId').clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('All data deleted from Hive')),
                );
              },
              child: const Text('Delete Data'),
            ),
          ],
        ),
      ),
    );
  }
}
