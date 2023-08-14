import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DeleteBoxesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete All Hive Boxes'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await Hive.deleteFromDisk();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('All Hive boxes deleted from disk')),
            );
          },
          child: Text('Delete All Boxes'),
        ),
      ),
    );
  }
}
