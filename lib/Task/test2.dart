import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hive/hive.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool _showDatePicker = false;
  bool _showTimePicker = false;

  final _taskNameController = TextEditingController(text: 'Task name');
  final _notesController = TextEditingController(text: 'Notes');

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  void _unfocus() {
    FocusScope.of(context).unfocus();
  }

  void _saveToFirestore(
      String taskName, String notes, DateTime? date, TimeOfDay? time) {
    _firestore.collection('tasks').add({
      'taskName': taskName,
      'notes': notes,
      'date': date,
      'time': time != null ? DateTime(0, 0, 0, time.hour, time.minute) : null,
    });
  }

  void _saveToHive(
      String taskName, String notes, DateTime? date, TimeOfDay? time) async {
    final box = await Hive.openBox('tasks');
    box.add({
      'taskName': taskName,
      'notes': notes,
      'date': date,
      'time': time != null ? DateTime(0, 0, 0, time.hour, time.minute) : null,
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _unfocus,
      child: Scaffold(
        body: CupertinoScrollbar(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 40.0),

                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CupertinoButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          // Cancel logic
                        },
                      ),
                      const Text('Details', style: TextStyle(fontSize: 18.0)),
                      CupertinoButton(
                        child: const Text('Done'),
                        onPressed: () {
                          String taskName = _taskNameController.text;
                          String notes = _notesController.text;

                          _saveToFirestore(
                              taskName, notes, _selectedDate, _selectedTime);
                          _saveToHive(
                              taskName, notes, _selectedDate, _selectedTime);

                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),

                  const SizedBox(height: 30.0),

                  // Task Name/Notes Card
                  Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CupertinoTextField(
                            controller: _taskNameController,
                            placeholder: 'Task name',
                            onTap: () {
                              _taskNameController.clear();
                            },
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CupertinoTextField(
                            controller: _notesController,
                            placeholder: 'Notes',
                            onTap: () {
                              _notesController.clear();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30.0),

                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: const Icon(
                                  CupertinoIcons.calendar_badge_plus,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              const Text('Date'),
                              const Spacer(),
                              CupertinoSwitch(
                                value: _showDatePicker,
                                onChanged: (val) {
                                  setState(() {
                                    _showDatePicker = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        if (_showDatePicker)
                          Container(
                            height: 200.0,
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.date,
                              onDateTimeChanged: (val) {
                                setState(() {
                                  _selectedDate = val;
                                });
                              },
                            ),
                          ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: const Icon(
                                  CupertinoIcons.clock_fill,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              const Text('Time'),
                              const Spacer(),
                              CupertinoSwitch(
                                value: _showTimePicker,
                                onChanged: (val) {
                                  setState(() {
                                    _showTimePicker = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        if (_showTimePicker)
                          Container(
                            height: 200.0,
                            child: CupertinoTimerPicker(
                              mode: CupertinoTimerPickerMode.hm,
                              minuteInterval: 1,
                              onTimerDurationChanged: (val) {
                                setState(() {
                                  _selectedTime = TimeOfDay.fromDateTime(
                                      DateTime(0, 0, 0).add(val));
                                });
                              },
                            ),
                          )
                      ],
                    ),
                  ),

                  const SizedBox(height: 20.0),

                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: const Icon(
                                  CupertinoIcons.bell_fill,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              const Text('Early Reminder'),
                              const Spacer(),
                              const Text('Never'),
                            ],
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: const Icon(
                                  CupertinoIcons.repeat,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              const Text('Repeat'),
                              const Spacer(),
                              const Text('Never'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.pinkAccent,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Icon(
                              CupertinoIcons.square_stack_3d_down_dottedline,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          const Text('Focus'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
