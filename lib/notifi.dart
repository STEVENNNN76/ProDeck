import 'package:flutter/material.dart';

import 'Services/notifi_service.dart';

class NotificationButton extends StatefulWidget {
  const NotificationButton({super.key, required this.title});

  final String title;

  @override
  State<NotificationButton> createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: ElevatedButton(
        child: const Text('Show notifications'),
        onPressed: () {
          NotificationService()
              .showNotification(title: 'ProDeck', body: 'Ur mum');
        },
      )),
    );
  }
}
