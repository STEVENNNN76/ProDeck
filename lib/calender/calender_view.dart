import 'package:flutter/material.dart';
import 'package:prodeck/calender/calender.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  _CalenderViewState createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          child: const Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 19.0, right: 4),
            child: Text(
              "Calender",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_drop_down),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: const Padding(
        padding: EdgeInsets.all(4.0),
        child: Calender(),
      ),
    );
  }
}
