/*

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Task {
  String name;
  DateTime date;

  Task({required this.name, required this.date});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Reminders',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late List<Task> tasks;
  TextEditingController nameController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  bool isDateSwitchedOn = false;
  bool isTimeSwitchedOn = false;
  bool isAddingTask = false;

  @override
  void initState() {
    super.initState();
    tasks = [];
  }

  void _addTask() {
    setState(() {
      String name = nameController.text.trim();
      if (name.isNotEmpty && selectedDate != null) {
        Task task = Task(name: name, date: selectedDate!);
        tasks.insert(0, task);
        nameController.clear();
        selectedDate = null;
        selectedTime = null;
        isDateSwitchedOn = false;
        isTimeSwitchedOn = false;
        isAddingTask = false;
        _showNotification(task);
      }
    });
  }

  void _showNotification(Task task) {
    // Code to show a notification with the task name
    // when the specified time is reached.
    // This is platform-specific and requires using plugins.
    // You can use the flutter_local_notifications package, for example.
    // Refer to the package documentation for implementation details.
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CupertinoNavigationBarBackButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(width: 8.0),
                  const Text(
                    'Task Reminders',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.normal,
                      color: CupertinoColors.systemBlue,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  Task task = tasks[index];
                  return ListTile(
                    title: Text(
                      task.name,
                      style: const TextStyle(
                        color: CupertinoColors.systemGrey,
                        fontSize: 18.0,
                      ),
                    ),
                    subtitle: Text(
                      '${task.date.day}/${task.date.month}/${task.date.year} ${task.date.hour}:${task.date.minute}',
                    ),
                    leading: const CircleAvatar(
                      backgroundColor: CupertinoColors.systemBlue,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CupertinoButton(
                    onPressed: () {
                      setState(() {
                        isAddingTask = true;
                      });
                    },
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 32.0),
                    ),
                  ),
                  if (isAddingTask) ...[
                    const SizedBox(height: 16.0),
                    CupertinoTextField(
                      controller: nameController,
                      placeholder: 'New Task',
                      cursorColor: CupertinoColors.systemGrey,
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        CupertinoSwitch(
                          value: isDateSwitchedOn,
                          onChanged: (value) {
                            setState(() {
                              isDateSwitchedOn = value;
                              if (isDateSwitchedOn) {
                                _selectDateTime(context);
                              }
                            });
                          },
                        ),
                        const SizedBox(width: 8.0),
                        const Icon(CupertinoIcons.calendar),
                        const SizedBox(width: 8.0),
                        Text(
                          selectedDate != null
                              ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                              : 'No Date Selected',
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        CupertinoSwitch(
                          value: isTimeSwitchedOn,
                          onChanged: (value) {
                            setState(() {
                              isTimeSwitchedOn = value;
                              if (isTimeSwitchedOn) {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((pickedTime) {
                                  if (pickedTime != null) {
                                    setState(() {
                                      selectedTime = pickedTime;
                                      selectedDate = DateTime(
                                        selectedDate!.year,
                                        selectedDate!.month,
                                        selectedDate!.day,
                                        selectedTime!.hour,
                                        selectedTime!.minute,
                                      );
                                    });
                                  }
                                });
                              }
                            });
                          },
                        ),
                        const SizedBox(width: 8.0),
                        const Icon(CupertinoIcons.clock),
                        const SizedBox(width: 8.0),
                        Text(
                          selectedTime != null
                              ? '${selectedTime!.hour}:${selectedTime!.minute.toString().padLeft(2, '0')}'
                              : 'No Time Selected',
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    CupertinoButton(
                      onPressed: _addTask,
                      child: const Text('Add Task'),
                      color: CupertinoColors.activeGreen,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
//code 2 currently working
/*

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:prodeck/home.dart';

class Task {
  String name;
  DateTime date;

  Task({required this.name, required this.date});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late List<Task> tasks;
  TextEditingController nameController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  bool isDateSwitchedOn = false;
  bool isTimeSwitchedOn = false;
  bool isAddingTask = false;

  @override
  void initState() {
    super.initState();
    tasks = [];
  }

  void _addTask() {
    setState(() {
      String name = nameController.text.trim();
      if (name.isNotEmpty && selectedDate != null) {
        Task task = Task(name: name, date: selectedDate!);
        tasks.insert(0, task);
        nameController.clear();
        selectedDate = null;
        selectedTime = null;
        isDateSwitchedOn = false;
        isTimeSwitchedOn = false;
      }
    });
  }

  void _selectDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CupertinoNavigationBarBackButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(width: 8.0),
                ],
              ),
            ),
            const SizedBox(height: 5.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Today',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.systemBlue,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  Task task = tasks[index];
                  return ListTile(
                    title: Text(
                      task.name,
                      style: const TextStyle(
                        color: CupertinoColors.systemGrey,
                        fontSize: 18.0,
                      ),
                    ),
                    subtitle: Text(
                      '${task.date.day}/${task.date.month}/${task.date.year} ${task.date.hour}:${task.date.minute.toString().padLeft(2, '0')}',
                    ),
                    leading: const CircleAvatar(
                      backgroundColor: CupertinoColors.systemBlue,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CupertinoButton(
                    onPressed: () {
                      setState(() {
                        isAddingTask = true;
                      });
                    },
                    child: Row(
                      children: const [
                        Text(
                          '+',
                          style: TextStyle(fontSize: 32.0),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'New Task',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                  if (isAddingTask) ...[
                    const SizedBox(height: 16.0),
                    CupertinoTextField(
                      controller: nameController,
                      placeholder: 'Enter task',
                      cursorColor: CupertinoColors.systemGrey,
                      decoration: BoxDecoration(
                        border: Border.all(color: CupertinoColors.systemGrey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      onChanged: (value) {
                        // Update the textfield value
                      },
                      onSubmitted: (value) {
                        _addTask();
                      },
                    ),
                    const SizedBox(height: 16.0),
                    if (isDateSwitchedOn) ...[
                      CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: selectedDate ?? DateTime.now(),
                        onDateTimeChanged: (DateTime newDateTime) {
                          setState(() {
                            selectedDate = newDateTime;
                          });
                        },
                      ),
                    ],
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        CupertinoSwitch(
                          value: isDateSwitchedOn,
                          onChanged: (value) {
                            setState(() {
                              isDateSwitchedOn = value;
                              if (isDateSwitchedOn) {
                                _selectDateTime(context);
                              }
                            });
                          },
                        ),
                        const SizedBox(width: 8.0),
                        const Icon(CupertinoIcons.calendar),
                        const SizedBox(width: 8.0),
                        Text(
                          selectedDate != null
                              ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                              : 'No Date Selected',
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    if (isTimeSwitchedOn) ...[
                      CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.time,
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (DateTime newDateTime) {
                          setState(() {
                            selectedTime = TimeOfDay.fromDateTime(newDateTime);
                            selectedDate = DateTime(
                              selectedDate!.year,
                              selectedDate!.month,
                              selectedDate!.day,
                              selectedTime!.hour,
                              selectedTime!.minute,
                            );
                          });
                        },
                      ),
                    ],
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        CupertinoSwitch(
                          value: isTimeSwitchedOn,
                          onChanged: (value) {
                            setState(() {
                              isTimeSwitchedOn = value;
                            });
                          },
                        ),
                        const SizedBox(width: 8.0),
                        const Icon(CupertinoIcons.clock),
                        const SizedBox(width: 8.0),
                        Text(
                          selectedTime != null
                              ? '${selectedTime!.hour}:${selectedTime!.minute.toString().padLeft(2, '0')}'
                              : 'No Time Selected',
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    CupertinoButton(
                      onPressed: _addTask,
                      child: const Text('Add Task'),
                      color: CupertinoColors.activeGreen,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

//code 3 made progress
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Task {
  String name;
  bool completed;

  Task({required this.name, this.completed = false});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskPage(),
    );
  }
}

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late List<Task> tasks;
  TextEditingController nameController = TextEditingController();
  bool isAddingTask = false;

  @override
  void initState() {
    super.initState();
    tasks = [];
  }

  void _addTask() {
    setState(() {
      String name = nameController.text.trim();
      if (name.isNotEmpty) {
        Task task = Task(name: name);
        tasks.insert(0, task);
        nameController.clear();
        isAddingTask = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CupertinoNavigationBarBackButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(width: 8.0),
                ],
              ),
            ),
            const SizedBox(height: 5.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Today',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.systemBlue,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoScrollbar(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      Task task = tasks[index];
                      return Dismissible(
                        key: Key(task.name),
                        direction: DismissDirection.endToStart,
                        onDismissed: (_) {
                          setState(() {
                            tasks.removeAt(index);
                          });
                        },
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20.0),
                          color: CupertinoColors.systemRed,
                          child: Icon(
                            CupertinoIcons.delete,
                            color: CupertinoColors.white,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Card(
                            margin: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: ListTile(
                              title: Text(
                                task.name,
                                style: const TextStyle(
                                  color: CupertinoColors.systemGrey,
                                  fontSize: 18.0,
                                ),
                              ),
                              leading: CircleAvatar(
                                backgroundColor: task.completed
                                    ? CupertinoColors.systemGrey
                                    : CupertinoColors.systemBlue,
                                child: IconButton(
                                  icon: Icon(
                                    task.completed
                                        ? CupertinoIcons.check_mark
                                        : CupertinoIcons.circle,
                                    color: CupertinoColors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      task.completed = !task.completed;
                                    });
                                  },
                                ),
                              ),
                              trailing: CupertinoButton(
                                padding: EdgeInsets.zero,
                                child: Icon(
                                  CupertinoIcons.info,
                                  color: CupertinoColors.systemGrey,
                                ),
                                onPressed: () {
                                  // Show additional options
                                  // You can implement a dropdown menu here
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (!isAddingTask)
                    CupertinoButton(
                      onPressed: () {
                        setState(() {
                          isAddingTask = true;
                        });
                      },
                      child: Text(
                        '+ Add New Task',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: CupertinoColors.activeBlue,
                        ),
                      ),
                    ),
                  if (isAddingTask) ...[
                    CupertinoTextField(
                      controller: nameController,
                      placeholder: 'Enter task',
                      cursorColor: CupertinoColors.systemGrey,
                      decoration: BoxDecoration(
                        border: Border.all(color: CupertinoColors.systemGrey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      onChanged: (value) {
                        // Update the textfield value
                      },
                      onSubmitted: (value) {
                        _addTask();
                      },
                    ),
                    SizedBox(height: 16.0),
                    CupertinoButton(
                      onPressed: _addTask,
                      child: Text('Add Task'),
                      color: CupertinoColors.activeGreen,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

//code 4
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Task {
  String name;
  bool completed;

  Task({required this.name, this.completed = false});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TaskPage(),
    );
  }
}

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late List<Task> tasks;
  TextEditingController nameController = TextEditingController();
  bool isAddingTask = false;

  @override
  void initState() {
    super.initState();
    tasks = [];
  }

  void _addTask() {
    setState(() {
      String name = nameController.text.trim();
      if (name.isNotEmpty) {
        Task task = Task(name: name);
        tasks.insert(0, task);
        nameController.clear();
      }
      isAddingTask = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CupertinoNavigationBarBackButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(width: 8.0),
                ],
              ),
            ),
            const SizedBox(height: 5.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Today',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.systemBlue,
                  decoration: TextDecoration.none, // Remove underline
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoScrollbar(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      Task task = tasks[index];
                      return Dismissible(
                        key: Key(task.name),
                        direction: DismissDirection.endToStart,
                        onDismissed: (_) {
                          setState(() {
                            tasks.removeAt(index);
                          });
                        },
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20.0),
                          color: CupertinoColors.systemRed,
                          child: const Icon(
                            CupertinoIcons.delete,
                            color: CupertinoColors.white,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Card(
                            margin: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: ListTile(
                              title: Text(
                                task.name,
                                style: const TextStyle(
                                  color: CupertinoColors.systemGrey,
                                  fontSize: 18.0,
                                ),
                              ),
                              leading: CircleAvatar(
                                backgroundColor: task.completed
                                    ? CupertinoColors.systemGrey
                                    : CupertinoColors.systemBlue,
                                child: IconButton(
                                  icon: Icon(
                                    task.completed
                                        ? CupertinoIcons.check_mark
                                        : CupertinoIcons.circle,
                                    color: CupertinoColors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      task.completed = !task.completed;
                                    });
                                  },
                                ),
                              ),
                              trailing: CupertinoButton(
                                padding: EdgeInsets.zero,
                                child: const Icon(
                                  CupertinoIcons.ellipsis,
                                  color: CupertinoColors.systemGrey,
                                ),
                                onPressed: () {
                                  // Show additional options
                                  // You can implement a dropdown menu here
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (!isAddingTask)
                    CupertinoButton(
                      onPressed: () {
                        setState(() {
                          isAddingTask = true;
                        });
                      },
                      child: const Text(
                        '+ Add New Task',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: CupertinoColors.activeBlue,
                        ),
                      ),
                    ),
                  if (isAddingTask) ...[
                    const SizedBox(height: 16.0),
                    CupertinoTextField(
                      controller: nameController,
                      placeholder: 'Enter task',
                      cursorColor: CupertinoColors.systemGrey,
                      padding: EdgeInsets.zero,
                      onChanged: (value) {
                        // Update the textfield value
                      },
                      onSubmitted: (value) {
                        _addTask();
                      },
                      decoration: BoxDecoration(
                        color: CupertinoColors.white,
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CupertinoButton(
                          onPressed: () {
                            setState(() {
                              isAddingTask = false;
                            });
                          },
                          child: const Text('Cancel'),
                        ),
                        CupertinoButton(
                          onPressed: _addTask,
                          child: const Text('Done'),
                          color: CupertinoColors.activeGreen,
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

//code 5 the button in the created to do list works greyes it out and can be delted
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Task {
  String name;
  bool completed;

  Task({required this.name, this.completed = false});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TaskPage(),
    );
  }
}

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late List<Task> tasks;
  TextEditingController nameController = TextEditingController();
  bool isAddingTask = false;

  @override
  void initState() {
    super.initState();
    tasks = [];
  }

  void _addTask() {
    setState(() {
      String name = nameController.text.trim();
      if (name.isNotEmpty) {
        Task task = Task(name: name);
        tasks.insert(0, task);
        nameController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CupertinoNavigationBarBackButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(width: 8.0),
                ],
              ),
            ),
            const SizedBox(height: 5.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Today',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.systemBlue,
                  decoration: TextDecoration.none, // Remove underline
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoScrollbar(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      Task task = tasks[index];
                      return Dismissible(
                        key: Key(task.name),
                        direction: DismissDirection.endToStart,
                        onDismissed: (_) {
                          setState(() {
                            tasks.removeAt(index);
                          });
                        },
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20.0),
                          color: CupertinoColors.systemRed,
                          child: const Icon(
                            CupertinoIcons.delete,
                            color: CupertinoColors.white,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Card(
                            margin: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: ListTile(
                              title: Text(
                                task.name,
                                style: const TextStyle(
                                  color: CupertinoColors.systemGrey,
                                  fontSize: 18.0,
                                ),
                              ),
                              leading: CircleAvatar(
                                backgroundColor: task.completed
                                    ? CupertinoColors.systemGrey
                                    : CupertinoColors.systemBlue,
                                child: IconButton(
                                  icon: Icon(
                                    task.completed
                                        ? CupertinoIcons.check_mark
                                        : CupertinoIcons.circle,
                                    color: CupertinoColors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      task.completed = !task.completed;
                                    });
                                  },
                                ),
                              ),
                              trailing: CupertinoButton(
                                padding: EdgeInsets.zero,
                                child: const Icon(
                                  CupertinoIcons.ellipsis,
                                  color: CupertinoColors.systemGrey,
                                ),
                                onPressed: () {
                                  // Show additional options
                                  // You can implement a dropdown menu here
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (!isAddingTask)
                    CupertinoButton(
                      onPressed: () {
                        setState(() {
                          isAddingTask = true;
                        });
                      },
                      child: const Text(
                        '+ Add New Task',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: CupertinoColors.activeBlue,
                        ),
                      ),
                    ),
                  if (isAddingTask) ...[
                    const SizedBox(height: 16.0),
                    Card(
                      margin: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: CupertinoTextField(
                        controller: nameController,
                        placeholder: 'Enter task',
                        cursorColor: CupertinoColors.systemGrey,
                        padding: EdgeInsets.zero,
                        onChanged: (value) {
                          // Update the textfield value
                        },
                        onSubmitted: (value) {
                          _addTask();
                        },
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CupertinoButton(
                          onPressed: () {
                            setState(() {
                              isAddingTask = false;
                            });
                          },
                          child: const Text('Cancel'),
                        ),
                        CupertinoButton(
                          onPressed: _addTask,
                          child: const Text('Done'),
                          color: CupertinoColors.activeGreen,
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
//code 6 best working
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Task {
  String name;
  bool completed;

  Task({required this.name, this.completed = false});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TaskPage(),
    );
  }
}

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late List<Task> tasks;
  TextEditingController nameController = TextEditingController();
  bool isAddingTask = false;

  @override
  void initState() {
    super.initState();
    tasks = [];
  }

  void _addTask() {
    setState(() {
      String name = nameController.text.trim();
      if (name.isNotEmpty) {
        Task task = Task(name: name);
        tasks.insert(0, task);
        nameController.clear();
        isAddingTask = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            // Dismiss the text field when tapped outside
            if (isAddingTask) {
              setState(() {
                isAddingTask = false;
              });
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CupertinoNavigationBarBackButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 8.0),
                  ],
                ),
              ),
              const SizedBox(height: 5.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.systemBlue,
                    decoration: TextDecoration.none, // Remove underline
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoScrollbar(
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        Task task = tasks[index];
                        return Dismissible(
                          key: Key(task.name),
                          direction: DismissDirection.endToStart,
                          onDismissed: (_) {
                            setState(() {
                              tasks.removeAt(index);
                            });
                          },
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20.0),
                            color: CupertinoColors.systemRed,
                            child: const Icon(
                              CupertinoIcons.delete,
                              color: CupertinoColors.white,
                            ),
                          ),
                          child: GestureDetector(
                            onHorizontalDragUpdate: (details) {
                              // Show editing options on partial swipe
                              if (details.delta.dx < -50) {
                                // TODO: Show editing options
                                print('Show editing options for ${task.name}');
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Card(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: ListTile(
                                  title: Text(
                                    task.name,
                                    style: const TextStyle(
                                      color: CupertinoColors.systemGrey,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  trailing: const Icon(
                                    CupertinoIcons.ellipsis,
                                    color: CupertinoColors.systemGrey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (!isAddingTask)
                      CupertinoButton(
                        onPressed: () {
                          setState(() {
                            isAddingTask = true;
                          });
                        },
                        child: const Text(
                          '+ Add New Task',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: CupertinoColors.activeBlue,
                          ),
                        ),
                      ),
                    if (isAddingTask) ...[
                      const SizedBox(height: 16.0),
                      Card(
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 4.0,
                          ),
                          child: CupertinoTextField.borderless(
                            controller: nameController,
                            placeholder: 'Enter task',
                            cursorColor: CupertinoColors.systemGrey,
                            padding: EdgeInsets.zero,
                            style: const TextStyle(fontSize: 20.0),
                            autofocus: true,
                            onSubmitted: (_) {
                              _addTask();
                            },
                          ),
                        ),
                      ),
                    ],
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
*/

//code 7 best working one
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Task {
  String name;
  bool completed;

  Task({required this.name, this.completed = false});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TaskPage(),
    );
  }
}

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late List<Task> tasks;
  TextEditingController nameController = TextEditingController();
  bool isAddingTask = false;

  @override
  void initState() {
    super.initState();
    tasks = [];
  }

  void _addTask() {
    setState(() {
      String name = nameController.text.trim();
      if (name.isNotEmpty) {
        Task task = Task(name: name);
        tasks.insert(0, task);
        nameController.clear();
        isAddingTask = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            // Dismiss the text field when tapped outside
            if (isAddingTask) {
              setState(() {
                isAddingTask = false;
              });
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CupertinoNavigationBarBackButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 8.0),
                  ],
                ),
              ),
              const SizedBox(height: 5.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.systemBlue,
                    decoration: TextDecoration.none, // Remove underline
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoScrollbar(
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        Task task = tasks[index];
                        return Dismissible(
                          key: Key(task.name),
                          direction: DismissDirection.endToStart,
                          onDismissed: (_) {
                            setState(() {
                              tasks.removeAt(index);
                            });
                          },
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20.0),
                            color: CupertinoColors.systemRed,
                            child: const Icon(
                              CupertinoIcons.delete,
                              color: CupertinoColors.white,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Card(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: ListTile(
                                title: Text(
                                  task.name,
                                  style: const TextStyle(
                                    color: CupertinoColors.systemGrey,
                                    fontSize: 18.0,
                                  ),
                                ),
                                leading: CircleAvatar(
                                  backgroundColor: task.completed
                                      ? CupertinoColors.systemGrey
                                      : CupertinoColors.systemBlue,
                                  child: IconButton(
                                    icon: Icon(
                                      task.completed
                                          ? CupertinoIcons.check_mark
                                          : CupertinoIcons.circle,
                                      color: CupertinoColors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        task.completed = !task.completed;
                                      });
                                    },
                                  ),
                                ),
                                trailing: CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  child: const Icon(
                                    CupertinoIcons.ellipsis,
                                    color: CupertinoColors.systemGrey,
                                  ),
                                  onPressed: () {
                                    // Show additional options
                                    // You can implement a dropdown menu here
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (!isAddingTask)
                      CupertinoButton(
                        onPressed: () {
                          setState(() {
                            isAddingTask = true;
                          });
                        },
                        child: const Text(
                          '+ Add New Task',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: CupertinoColors.activeBlue,
                          ),
                        ),
                      ),
                    if (isAddingTask) ...[
                      const SizedBox(height: 16.0),
                      Card(
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 4.0,
                          ),
                          child: CupertinoTextField.borderless(
                            controller: nameController,
                            placeholder: 'Enter task',
                            cursorColor: CupertinoColors.systemGrey,
                            padding: EdgeInsets.zero,
                            style: const TextStyle(fontSize: 20.0),
                            autofocus: true,
                            onSubmitted: (_) {
                              _addTask();
                            },
                          ),
                        ),
                      ),
                    ],
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
*/

//code 8 best workking
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Task {
  String name;
  bool completed;
  DateTime? date;
  TimeOfDay? time;

  Task({required this.name, this.completed = false});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TaskPage(),
    );
  }
}

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late List<Task> tasks;
  TextEditingController nameController = TextEditingController();
  bool isAddingTask = false;
  bool isShowingOptions = false;
  bool isShowingDatePicker = false;
  bool isShowingTimePicker = false;

  @override
  void initState() {
    super.initState();
    tasks = [];
  }

  void _addTask() {
    setState(() {
      String name = nameController.text.trim();
      if (name.isNotEmpty) {
        Task task = Task(name: name);
        tasks.insert(0, task);
        nameController.clear();
        isAddingTask = false;
      }
    });
  }

  void _showOptions() {
    setState(() {
      isShowingOptions = !isShowingOptions;
      isShowingDatePicker = false;
      isShowingTimePicker = false;
    });
  }

  void _showDatePicker() {
    setState(() {
      isShowingDatePicker = !isShowingDatePicker;
      isShowingTimePicker = false;
    });
  }

  void _showTimePicker() {
    setState(() {
      isShowingTimePicker = !isShowingTimePicker;
      isShowingDatePicker = false;
    });
  }

  void _selectDate(DateTime date) {
    setState(() {
      tasks[0].date = date;
    });
  }

  void _selectTime(TimeOfDay time) {
    setState(() {
      tasks[0].time = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            // Dismiss the text field and options when tapped outside
            if (isAddingTask || isShowingOptions) {
              setState(() {
                isAddingTask = false;
                isShowingOptions = false;
              });
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CupertinoNavigationBarBackButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 8.0),
                  ],
                ),
              ),
              const SizedBox(height: 5.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.systemBlue,
                    decoration: TextDecoration.none, // Remove underline
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoScrollbar(
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        Task task = tasks[index];
                        return Dismissible(
                          key: Key(task.name),
                          direction: DismissDirection.endToStart,
                          onDismissed: (_) {
                            setState(() {
                              tasks.removeAt(index);
                            });
                          },
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20.0),
                            color: CupertinoColors.systemRed,
                            child: const Icon(
                              CupertinoIcons.delete,
                              color: CupertinoColors.white,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Card(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: ListTile(
                                title: Text(
                                  task.name,
                                  style: const TextStyle(
                                    color: CupertinoColors.systemGrey,
                                    fontSize: 18.0,
                                  ),
                                ),
                                subtitle: task.date != null || task.time != null
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (task.date != null)
                                            Text(
                                              'Date: ${DateFormat.yMMMd().format(task.date!)}',
                                              style: const TextStyle(
                                                color:
                                                    CupertinoColors.systemGrey,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          if (task.time != null)
                                            Text(
                                              'Time: ${task.time!.format(context)}',
                                              style: const TextStyle(
                                                color:
                                                    CupertinoColors.systemGrey,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                        ],
                                      )
                                    : null,
                                leading: CircleAvatar(
                                  backgroundColor: task.completed
                                      ? CupertinoColors.systemGrey
                                      : CupertinoColors.systemBlue,
                                  child: IconButton(
                                    icon: Icon(
                                      task.completed
                                          ? CupertinoIcons.check_mark
                                          : CupertinoIcons.circle,
                                      color: CupertinoColors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        task.completed = !task.completed;
                                      });
                                    },
                                  ),
                                ),
                                trailing: CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  child: const Icon(
                                    CupertinoIcons.ellipsis,
                                    color: CupertinoColors.systemGrey,
                                  ),
                                  onPressed: _showOptions,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (!isAddingTask)
                      CupertinoButton(
                        onPressed: () {
                          setState(() {
                            isAddingTask = true;
                          });
                        },
                        child: const Text(
                          '+ Add New Task',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: CupertinoColors.activeBlue,
                          ),
                        ),
                      ),
                    if (isAddingTask) ...[
                      const SizedBox(height: 16.0),
                      Card(
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 4.0,
                          ),
                          child: CupertinoTextField.borderless(
                            controller: nameController,
                            placeholder: 'Enter task',
                            cursorColor: CupertinoColors.systemGrey,
                            padding: EdgeInsets.zero,
                            style: const TextStyle(fontSize: 20.0),
                            autofocus: true,
                            onSubmitted: (_) {
                              _addTask();
                            },
                          ),
                        ),
                      ),
                    ],
                    if (isShowingOptions) ...[
                      const SizedBox(height: 16.0),
                      Card(
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Column(
                          children: [
                            CupertinoButton(
                              onPressed: _showDatePicker,
                              child: const Text('Date'),
                            ),
                            if (isShowingDatePicker)
                              Container(
                                height: 200.0, // Adjust the height as needed
                                child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.date,
                                  onDateTimeChanged: _selectDate,
                                ),
                              ),
                            CupertinoButton(
                              onPressed: _showTimePicker,
                              child: const Text('Time'),
                            ),
                            if (isShowingTimePicker)
                              Container(
                                height: 200.0, // Adjust the height as needed
                                child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.time,
                                  onDateTimeChanged: (DateTime dateTime) {
                                    _selectTime(
                                      TimeOfDay.fromDateTime(dateTime),
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
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
*/

//code 9
//Best working yet
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Task {
  String name;
  bool completed;
  DateTime? date;
  TimeOfDay? time;

  Task({required this.name, this.completed = false});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TaskPage(),
    );
  }
}

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late List<Task> tasks;
  TextEditingController nameController = TextEditingController();
  bool isAddingTask = false;
  bool isShowingOptions = false;
  bool isShowingDatePicker = false;
  bool isShowingTimePicker = false;
  int selectedTaskIndex = -1;

  @override
  void initState() {
    super.initState();
    tasks = [];
  }

  void _addTask() {
    setState(() {
      String name = nameController.text.trim();
      if (name.isNotEmpty) {
        Task task = Task(name: name);
        tasks.insert(0, task);
        nameController.clear();
        isAddingTask = false;
      }
    });
  }

  void _showOptions(int index) {
    setState(() {
      isShowingOptions = !isShowingOptions;
      isShowingDatePicker = false;
      isShowingTimePicker = false;
      selectedTaskIndex = index;
    });
  }

  void _showDatePicker() {
    setState(() {
      isShowingDatePicker = !isShowingDatePicker;
      isShowingTimePicker = false;
    });
  }

  void _showTimePicker() {
    setState(() {
      isShowingTimePicker = !isShowingTimePicker;
      isShowingDatePicker = false;
    });
  }

  void _selectDate(DateTime date) {
    setState(() {
      tasks[selectedTaskIndex].date = date;
    });
  }

  void _selectTime(TimeOfDay time) {
    setState(() {
      tasks[selectedTaskIndex].time = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            if (isAddingTask || isShowingOptions) {
              setState(() {
                isAddingTask = false;
                isShowingOptions = false;
              });
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CupertinoNavigationBarBackButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 8.0),
                  ],
                ),
              ),
              const SizedBox(height: 5.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.systemBlue,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoScrollbar(
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        Task task = tasks[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Dismissible(
                              key: Key(task.name),
                              direction: DismissDirection.endToStart,
                              onDismissed: (_) {
                                setState(() {
                                  tasks.removeAt(index);
                                });
                              },
                              background: Container(
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(right: 20.0),
                                color: CupertinoColors.systemRed,
                                child: const Icon(
                                  CupertinoIcons.delete,
                                  color: CupertinoColors.white,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Card(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 2.0),
                                  child: ListTile(
                                    title: Text(
                                      task.name,
                                      style: const TextStyle(
                                        color: CupertinoColors.systemGrey,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    subtitle:
                                        task.date != null || task.time != null
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (task.date != null)
                                                    Text(
                                                      'Date: ${DateFormat.yMMMd().format(task.date!)}',
                                                      style: const TextStyle(
                                                        color: CupertinoColors
                                                            .systemGrey,
                                                        fontSize: 16.0,
                                                      ),
                                                    ),
                                                  if (task.time != null)
                                                    Text(
                                                      'Time: ${task.time!.format(context)}',
                                                      style: const TextStyle(
                                                        color: CupertinoColors
                                                            .systemGrey,
                                                        fontSize: 16.0,
                                                      ),
                                                    ),
                                                ],
                                              )
                                            : null,
                                    leading: CircleAvatar(
                                      backgroundColor: task.completed
                                          ? CupertinoColors.systemGrey
                                          : CupertinoColors.systemBlue,
                                      child: IconButton(
                                        icon: Icon(
                                          task.completed
                                              ? CupertinoIcons.check_mark
                                              : CupertinoIcons.circle,
                                          color: CupertinoColors.white,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            task.completed = !task.completed;
                                          });
                                        },
                                      ),
                                    ),
                                    trailing: CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      child: const Icon(
                                        CupertinoIcons.ellipsis,
                                        color: CupertinoColors.systemGrey,
                                      ),
                                      onPressed: () {
                                        _showOptions(index);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (isShowingOptions && index == selectedTaskIndex)
                              const SizedBox(height: 16.0),
                            if (isShowingOptions && index == selectedTaskIndex)
                              Card(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Column(
                                  children: [
                                    CupertinoButton(
                                      onPressed: _showDatePicker,
                                      child: const Text('Date'),
                                    ),
                                    if (isShowingDatePicker)
                                      Container(
                                        height:
                                            200.0, // Adjust the height as needed
                                        child: CupertinoDatePicker(
                                          mode: CupertinoDatePickerMode.date,
                                          onDateTimeChanged: _selectDate,
                                        ),
                                      ),
                                    CupertinoButton(
                                      onPressed: _showTimePicker,
                                      child: const Text('Time'),
                                    ),
                                    if (isShowingTimePicker)
                                      Container(
                                        height:
                                            200.0, // Adjust the height as needed
                                        child: CupertinoDatePicker(
                                          mode: CupertinoDatePickerMode.time,
                                          onDateTimeChanged:
                                              (DateTime dateTime) {
                                            _selectTime(
                                              TimeOfDay.fromDateTime(dateTime),
                                            );
                                          },
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (!isAddingTask)
                      CupertinoButton(
                        onPressed: () {
                          setState(() {
                            isAddingTask = true;
                          });
                        },
                        child: const Text(
                          'Add Task',
                          style: TextStyle(
                            color: CupertinoColors.systemBlue,
                          ),
                        ),
                      ),
                    if (isAddingTask)
                      Row(
                        children: [
                          Expanded(
                            child: CupertinoTextField(
                              controller: nameController,
                              placeholder: 'Task Name',
                              onSubmitted: (_) {
                                _addTask();
                              },
                            ),
                          ),
                          CupertinoButton(
                            onPressed: () {
                              _addTask();
                            },
                            child: const Icon(
                              CupertinoIcons.check_mark,
                              color: CupertinoColors.systemBlue,
                            ),
                          ),
                          CupertinoButton(
                            onPressed: () {
                              setState(() {
                                isAddingTask = false;
                                nameController.clear();
                              });
                            },
                            child: const Icon(
                              CupertinoIcons.clear,
                              color: CupertinoColors.systemRed,
                            ),
                          ),
                        ],
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


*/
//code 10
//best code after 9 , need to add toggle switches

/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Task {
  String name;
  bool completed;
  DateTime? date;
  TimeOfDay? time;

  Task({required this.name, this.completed = false});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TaskPage(),
    );
  }
}

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late List<Task> tasks;
  TextEditingController nameController = TextEditingController();
  bool isAddingTask = false;
  bool isShowingOptions = false;
  bool isShowingDatePicker = false;
  bool isShowingTimePicker = false;
  int selectedTaskIndex = -1;

  @override
  void initState() {
    super.initState();
    tasks = [];
  }

  void _addTask() {
    setState(() {
      String name = nameController.text.trim();
      if (name.isNotEmpty) {
        Task task = Task(name: name);
        tasks.insert(0, task);
        nameController.clear();
        isAddingTask = false;
      }
    });
  }

  void _showOptions(int index) {
    setState(() {
      isShowingOptions = !isShowingOptions;
      isShowingDatePicker = false;
      isShowingTimePicker = false;
      selectedTaskIndex = index;
    });
  }

  void _showDatePicker() {
    setState(() {
      isShowingDatePicker = !isShowingDatePicker;
      isShowingTimePicker = false;
    });
  }

  void _showTimePicker() {
    setState(() {
      isShowingTimePicker = !isShowingTimePicker;
      isShowingDatePicker = false;
    });
  }

  void _selectDate(DateTime date) {
    setState(() {
      tasks[selectedTaskIndex].date = date;
    });
  }

  void _selectTime(TimeOfDay time) {
    setState(() {
      tasks[selectedTaskIndex].time = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            if (isAddingTask || isShowingOptions) {
              setState(() {
                isAddingTask = false;
                isShowingOptions = false;
              });
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CupertinoNavigationBarBackButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 8.0),
                  ],
                ),
              ),
              const SizedBox(height: 5.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'To-do',
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.systemBlue,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoScrollbar(
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        Task task = tasks[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Dismissible(
                              key: Key(task.name),
                              direction: DismissDirection.endToStart,
                              onDismissed: (_) {
                                setState(() {
                                  tasks.removeAt(index);
                                });
                              },
                              background: Container(
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(right: 20.0),
                                color: CupertinoColors.systemRed,
                                child: const Icon(
                                  CupertinoIcons.delete,
                                  color: CupertinoColors.white,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Card(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 2.0),
                                  child: ListTile(
                                    title: Text(
                                      task.name,
                                      style: const TextStyle(
                                        color: CupertinoColors.systemGrey,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    subtitle:
                                        task.date != null || task.time != null
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (task.date != null)
                                                    Text(
                                                      'Date: ${DateFormat.yMMMd().format(task.date!)}',
                                                      style: const TextStyle(
                                                        color: CupertinoColors
                                                            .systemGrey,
                                                        fontSize: 16.0,
                                                      ),
                                                    ),
                                                  if (task.time != null)
                                                    Text(
                                                      'Time: ${task.time!.format(context)}',
                                                      style: const TextStyle(
                                                        color: CupertinoColors
                                                            .systemGrey,
                                                        fontSize: 16.0,
                                                      ),
                                                    ),
                                                ],
                                              )
                                            : null,
                                    leading: CircleAvatar(
                                      backgroundColor: task.completed
                                          ? CupertinoColors.systemGrey
                                          : CupertinoColors.systemBlue,
                                      child: IconButton(
                                        icon: Icon(
                                          task.completed
                                              ? CupertinoIcons.check_mark
                                              : CupertinoIcons.circle,
                                          color: CupertinoColors.white,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            task.completed = !task.completed;
                                          });
                                        },
                                      ),
                                    ),
                                    trailing: CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      child: const Icon(
                                        CupertinoIcons.ellipsis,
                                        color: CupertinoColors.systemGrey,
                                      ),
                                      onPressed: () {
                                        _showOptions(index);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (isShowingOptions && index == selectedTaskIndex)
                              const SizedBox(height: 16.0),
                            if (isShowingOptions && index == selectedTaskIndex)
                              Card(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Column(
                                  children: [
                                    CupertinoButton(
                                      onPressed: _showDatePicker,
                                      child: const Text('Date'),
                                    ),
                                    if (isShowingDatePicker)
                                      Container(
                                        height:
                                            200.0, // Adjust the height as needed
                                        child: CupertinoDatePicker(
                                          mode: CupertinoDatePickerMode.date,
                                          onDateTimeChanged: _selectDate,
                                        ),
                                      ),
                                    CupertinoButton(
                                      onPressed: _showTimePicker,
                                      child: const Text('Time'),
                                    ),
                                    if (isShowingTimePicker)
                                      Container(
                                        height:
                                            200.0, // Adjust the height as needed
                                        child: CupertinoDatePicker(
                                          mode: CupertinoDatePickerMode.time,
                                          onDateTimeChanged:
                                              (DateTime dateTime) {
                                            _selectTime(
                                              TimeOfDay.fromDateTime(dateTime),
                                            );
                                          },
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (!isAddingTask)
                      CupertinoButton(
                        onPressed: () {
                          setState(() {
                            isAddingTask = true;
                          });
                        },
                        child: const Text(
                          'Add Task',
                          style: TextStyle(
                            color: CupertinoColors.systemBlue,
                          ),
                        ),
                      ),
                    if (isAddingTask)
                      Row(
                        children: [
                          Expanded(
                            child: CupertinoTextField(
                              controller: nameController,
                              placeholder: 'Task Name',
                              onSubmitted: (_) {
                                _addTask();
                              },
                            ),
                          ),
                        ],
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

*/

//code 11
//firestore works
/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final TextEditingController nameController = TextEditingController();

  List<Task> tasks = [];
  bool isAddingTask = false;
  bool isShowingOptions = false;
  int selectedTaskIndex = -1;
  bool isShowingDatePicker = false;
  bool isShowingTimePicker = false;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  void initState() {
    super.initState();
    fetchTasksFromFirestore();
  }

  void fetchTasksFromFirestore() async {
    final QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('tasks').get();

    setState(() {
      tasks = querySnapshot.docs.map((doc) => Task.fromFirestore(doc)).toList();
    });
  }

  void addTaskToFirestore(Task task) async {
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('tasks').doc();

    task.id = documentReference.id;

    await documentReference.set(task.toMap());
  }

  void deleteTaskFromFirestore(String taskId) async {
    await FirebaseFirestore.instance.collection('tasks').doc(taskId).delete();
  }

  void _addTask() {
    String taskName = nameController.text.trim();

    if (taskName.isNotEmpty) {
      Task newTask = Task(name: taskName, completed: false);

      setState(() {
        tasks.add(newTask);
        addTaskToFirestore(newTask);
        nameController.clear();
        isAddingTask = false;
      });
    }
  }

  void _deleteTask(int index, String taskId) {
    setState(() {
      tasks.removeAt(index);
      deleteTaskFromFirestore(taskId);
    });
  }

  void _showOptions(int index) {
    setState(() {
      isShowingOptions = !isShowingOptions;
      selectedTaskIndex = index;
    });
  }

  void _showDatePicker() {
    setState(() {
      isShowingDatePicker = !isShowingDatePicker;
      isShowingTimePicker = false;
    });
  }

  void _showTimePicker() {
    setState(() {
      isShowingTimePicker = !isShowingTimePicker;
      isShowingDatePicker = false;
    });
  }

  void _selectDate(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  void _selectTime(TimeOfDay time) {
    setState(() {
      selectedTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            if (isAddingTask || isShowingOptions) {
              setState(() {
                isAddingTask = false;
                isShowingOptions = false;
              });
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CupertinoNavigationBarBackButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 8.0),
                  ],
                ),
              ),
              const SizedBox(height: 5.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Tasks',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        tasks.length,
                        (index) {
                          Task task = tasks[index];
                          bool isCompleted = task.completed ?? false;
                          String formattedDate = DateFormat.yMMMd()
                              .format(task.date ?? DateTime.now());
                          String formattedTime = DateFormat.jm().format(
                              task.time?.toDateTime() ?? DateTime.now());

                          return Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          task.name ?? '',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            decoration: isCompleted
                                                ? TextDecoration.lineThrough
                                                : null,
                                          ),
                                        ),
                                        if (task.date != null &&
                                            task.time != null)
                                          Text(
                                            '$formattedDate $formattedTime',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  CupertinoButton(
                                    onPressed: () {
                                      _showOptions(index);
                                    },
                                    child: const Icon(
                                      CupertinoIcons.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16.0),
                              if (isShowingOptions &&
                                  index == selectedTaskIndex)
                                Card(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 2.0),
                                  child: Column(
                                    children: [
                                      CupertinoButton(
                                        onPressed: _showDatePicker,
                                        child: const Text('Date'),
                                      ),
                                      if (isShowingDatePicker)
                                        Container(
                                          height:
                                              200.0, // Adjust the height as needed
                                          child: CupertinoDatePicker(
                                            mode: CupertinoDatePickerMode.date,
                                            onDateTimeChanged: _selectDate,
                                          ),
                                        ),
                                      CupertinoButton(
                                        onPressed: _showTimePicker,
                                        child: const Text('Time'),
                                      ),
                                      if (isShowingTimePicker)
                                        Container(
                                          height:
                                              200.0, // Adjust the height as needed
                                          child: CupertinoDatePicker(
                                            mode: CupertinoDatePickerMode.time,
                                            onDateTimeChanged:
                                                (DateTime dateTime) {
                                              _selectTime(
                                                TimeOfDay.fromDateTime(
                                                    dateTime),
                                              );
                                            },
                                          ),
                                        ),
                                      CupertinoButton(
                                        onPressed: () {
                                          if (selectedDate != null &&
                                              selectedTime != null) {
                                            setState(() {
                                              task.date = selectedDate;
                                              task.time = selectedTime;
                                              isShowingOptions = false;
                                              selectedTaskIndex = -1;
                                              selectedDate = null;
                                              selectedTime = null;
                                            });
                                          }
                                        },
                                        child: const Text('Save'),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (!isAddingTask)
                      CupertinoButton(
                        onPressed: () {
                          setState(() {
                            isAddingTask = true;
                          });
                        },
                        child: const Text(
                          'Add Task',
                          style: TextStyle(
                            color: CupertinoColors.systemBlue,
                          ),
                        ),
                      ),
                    if (isAddingTask)
                      Row(
                        children: [
                          Expanded(
                            child: CupertinoTextField(
                              controller: nameController,
                              placeholder: 'Task Name',
                              onSubmitted: (_) {
                                _addTask();
                              },
                            ),
                          ),
                          CupertinoButton(
                            onPressed: _addTask,
                            child: const Text('Save'),
                          ),
                        ],
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

class Task {
  String? id;
  String? name;
  bool? completed;
  DateTime? date;
  TimeOfDay? time;

  Task({
    this.id,
    this.name,
    this.completed,
    this.date,
    this.time,
  });

  Task.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    id = doc.id;
    name = data['name'];
    completed = data['completed'];
    date = (data['date'] as Timestamp?)?.toDate();
    time = data['time'] != null
        ? TimeOfDay.fromDateTime((data['time'] as Timestamp).toDate())
        : null;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'completed': completed,
      'date': date != null ? Timestamp.fromDate(date!) : null,
      'time': time != null ? Timestamp.fromDate(time!.toDateTime()) : null,
    };
  }
}

extension TimeOfDayExtension on TimeOfDay {
  DateTime toDateTime() {
    final now = DateTime.now();
    return DateTime(
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
  }
}
*/

//code 11
//trying to make it look better
//yay better
/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Task {
  String id; // Firestore document ID
  String name;
  bool completed;
  DateTime? date;
  TimeOfDay? time;

  Task({
    required this.id,
    required this.name,
    this.completed = false,
    this.date,
    this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'completed': completed,
      'date': date,
      'time': time != null ? DateTime(0, 0, 0, time!.hour, time!.minute) : null,
    };
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TaskPage(),
    );
  }
}

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late List<Task> tasks;
  TextEditingController nameController = TextEditingController();
  bool isAddingTask = false;
  bool isShowingOptions = false;
  bool isShowingDatePicker = false;
  bool isShowingTimePicker = false;
  int selectedTaskIndex = -1;

  @override
  void initState() {
    super.initState();
    tasks = [];
  }

  void _addTask() async {
    String name = nameController.text.trim();
    if (name.isNotEmpty) {
      Task task = Task(id: '', name: name);
      DocumentReference documentReference = await FirebaseFirestore.instance
          .collection('tasks')
          .add(task.toMap());
      task.id = documentReference.id;
      setState(() {
        tasks.insert(0, task);
        nameController.clear();
        isAddingTask = false;
      });
    }
  }

  void _deleteTask(int index) async {
    Task task = tasks[index];
    await FirebaseFirestore.instance.collection('tasks').doc(task.id).delete();
    setState(() {
      tasks.removeAt(index);
    });
  }

  void _toggleCompleted(int index) async {
    Task task = tasks[index];
    bool completed = !task.completed;
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(task.id)
        .update({'completed': completed});
    setState(() {
      tasks[index].completed = completed;
    });
  }

  void _showOptions(int index) {
    setState(() {
      isShowingOptions = !isShowingOptions;
      isShowingDatePicker = false;
      isShowingTimePicker = false;
      selectedTaskIndex = index;
    });
  }

  void _showDatePicker() {
    setState(() {
      isShowingDatePicker = !isShowingDatePicker;
      isShowingTimePicker = false;
    });
  }

  void _showTimePicker() {
    setState(() {
      isShowingTimePicker = !isShowingTimePicker;
      isShowingDatePicker = false;
    });
  }

  void _selectDate(DateTime date) async {
    Task task = tasks[selectedTaskIndex];
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(task.id)
        .update({'date': date});
    setState(() {
      tasks[selectedTaskIndex].date = date;
    });
  }

  void _selectTime(TimeOfDay time) async {
    Task task = tasks[selectedTaskIndex];
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(task.id)
        .update({'time': time});
    setState(() {
      tasks[selectedTaskIndex].time = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            if (isAddingTask || isShowingOptions) {
              setState(() {
                isAddingTask = false;
                isShowingOptions = false;
              });
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CupertinoNavigationBarBackButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 8.0),
                  ],
                ),
              ),
              const SizedBox(height: 5.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'To-do',
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.systemBlue,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoScrollbar(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('tasks')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          tasks = snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            return Task(
                              id: document.id,
                              name: data['name'],
                              completed: data['completed'],
                              date: data['date'] != null
                                  ? (data['date'] as Timestamp).toDate()
                                  : null,
                              time: data['time'] != null
                                  ? TimeOfDay.fromDateTime(
                                      data['time'].toDate())
                                  : null,
                            );
                          }).toList();
                          return ListView.builder(
                            itemCount: tasks.length,
                            itemBuilder: (BuildContext context, int index) {
                              Task task = tasks[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Dismissible(
                                    key: Key(task.id),
                                    direction: DismissDirection.endToStart,
                                    onDismissed: (_) {
                                      _deleteTask(index);
                                    },
                                    background: Container(
                                      alignment: Alignment.centerRight,
                                      padding:
                                          const EdgeInsets.only(right: 20.0),
                                      color: CupertinoColors.systemRed,
                                      child: const Icon(
                                        CupertinoIcons.delete,
                                        color: CupertinoColors.white,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Card(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        child: ListTile(
                                          title: Text(
                                            task.name,
                                            style: const TextStyle(
                                              color: CupertinoColors.systemGrey,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                          subtitle: task.date != null ||
                                                  task.time != null
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    if (task.date != null)
                                                      Text(
                                                        'Date: ${DateFormat.yMMMd().format(task.date!)}',
                                                        style: const TextStyle(
                                                          color: CupertinoColors
                                                              .systemGrey,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                    if (task.time != null)
                                                      Text(
                                                        'Time: ${task.time!.format(context)}',
                                                        style: const TextStyle(
                                                          color: CupertinoColors
                                                              .systemGrey,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                  ],
                                                )
                                              : null,
                                          leading: CircleAvatar(
                                            backgroundColor: task.completed
                                                ? CupertinoColors.systemGrey
                                                : CupertinoColors.systemBlue,
                                            child: IconButton(
                                              icon: Icon(
                                                task.completed
                                                    ? CupertinoIcons.check_mark
                                                    : CupertinoIcons.circle,
                                                color: CupertinoColors.white,
                                              ),
                                              onPressed: () {
                                                _toggleCompleted(index);
                                              },
                                            ),
                                          ),
                                          trailing: CupertinoButton(
                                            padding: EdgeInsets.zero,
                                            child: const Icon(
                                              CupertinoIcons.ellipsis,
                                              color: CupertinoColors.systemGrey,
                                            ),
                                            onPressed: () {
                                              _showOptions(index);
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (isShowingOptions &&
                                      index == selectedTaskIndex)
                                    const SizedBox(height: 16.0),
                                  if (isShowingOptions &&
                                      index == selectedTaskIndex)
                                    Card(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 2.0),
                                      child: Column(
                                        children: [
                                          CupertinoButton(
                                            onPressed: _showDatePicker,
                                            child: const Text('Date'),
                                          ),
                                          if (isShowingDatePicker)
                                            Container(
                                              height: 200.0,
                                              child: CupertinoDatePicker(
                                                mode: CupertinoDatePickerMode
                                                    .date,
                                                onDateTimeChanged: _selectDate,
                                              ),
                                            ),
                                          CupertinoButton(
                                            onPressed: _showTimePicker,
                                            child: const Text('Time'),
                                          ),
                                          if (isShowingTimePicker)
                                            Container(
                                              height: 200.0,
                                              child: CupertinoDatePicker(
                                                mode: CupertinoDatePickerMode
                                                    .time,
                                                onDateTimeChanged:
                                                    (DateTime dateTime) {
                                                  _selectTime(
                                                      TimeOfDay.fromDateTime(
                                                          dateTime));
                                                },
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                ],
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (!isAddingTask)
                      CupertinoButton(
                        onPressed: () {
                          setState(() {
                            isAddingTask = true;
                          });
                        },
                        child: const Text(
                          'Add Task',
                          style: TextStyle(
                            color: CupertinoColors.systemBlue,
                          ),
                        ),
                      ),
                    if (isAddingTask)
                      Row(
                        children: [
                          Expanded(
                            child: CupertinoTextField(
                              controller: nameController,
                              placeholder: 'Task Name',
                              onSubmitted: (_) {
                                _addTask();
                              },
                            ),
                          ),
                        ],
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
*/

//code 12
/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Task {
  String id; // Firestore document ID
  String name;
  bool completed;
  DateTime? date;
  TimeOfDay? time;

  Task({
    required this.id,
    required this.name,
    this.completed = false,
    this.date,
    this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'completed': completed,
      'date': date,
      'time': time != null ? DateTime(0, 0, 0, time!.hour, time!.minute) : null,
    };
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TaskPage(),
    );
  }
}

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late List<Task> tasks;
  TextEditingController nameController = TextEditingController();
  bool isAddingTask = false;
  bool isShowingOptions = false;
  bool isShowingDatePicker = false;
  bool isShowingTimePicker = false;
  int selectedTaskIndex = -1;

  @override
  void initState() {
    super.initState();
    tasks = [];
  }

  void _addTask() async {
    String name = nameController.text.trim();
    if (name.isNotEmpty) {
      Task task = Task(id: '', name: name);
      DocumentReference documentReference = await FirebaseFirestore.instance
          .collection('tasks')
          .add(task.toMap());
      task.id = documentReference.id;
      setState(() {
        tasks.insert(0, task);
        nameController.clear();
        isAddingTask = false;
      });
    }
  }

  void _deleteTask(int index) async {
    Task task = tasks[index];
    await FirebaseFirestore.instance.collection('tasks').doc(task.id).delete();
    setState(() {
      tasks.removeAt(index);
    });
  }

  void _toggleCompleted(int index) async {
    Task task = tasks[index];
    bool completed = !task.completed;
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(task.id)
        .update({'completed': completed});
    setState(() {
      tasks[index].completed = completed;
    });
  }

  void _showOptions(int index) {
    setState(() {
      isShowingOptions = !isShowingOptions;
      isShowingDatePicker = false;
      isShowingTimePicker = false;
      selectedTaskIndex = index;
    });
  }

  void _showDatePicker() {
    setState(() {
      isShowingDatePicker = !isShowingDatePicker;
      isShowingTimePicker = false;
    });
  }

  void _showTimePicker() {
    setState(() {
      isShowingTimePicker = !isShowingTimePicker;
      isShowingDatePicker = false;
    });
  }

  void _selectDate(DateTime date) async {
    Task task = tasks[selectedTaskIndex];
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(task.id)
        .update({'date': date});
    setState(() {
      tasks[selectedTaskIndex].date = date;
    });
  }

  void _selectTime(TimeOfDay time) async {
    Task task = tasks[selectedTaskIndex];
    DateTime now = DateTime.now();
    DateTime selectedDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(task.id)
        .update({'time': selectedDateTime});

    setState(() {
      tasks[selectedTaskIndex].time = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            if (isAddingTask || isShowingOptions) {
              setState(() {
                isAddingTask = false;
                isShowingOptions = false;
              });
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CupertinoNavigationBarBackButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 8.0),
                  ],
                ),
              ),
              const SizedBox(height: 5.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'To-do',
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.systemBlue,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoScrollbar(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('tasks')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          tasks = snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            return Task(
                              id: document.id,
                              name: data['name'],
                              completed: data['completed'],
                              date: data['date'] != null
                                  ? (data['date'] as Timestamp).toDate()
                                  : null,
                              time: data['time'] != null
                                  ? TimeOfDay.fromDateTime(
                                      data['time'].toDate())
                                  : null,
                            );
                          }).toList();
                          return ListView.builder(
                            itemCount: tasks.length,
                            itemBuilder: (BuildContext context, int index) {
                              Task task = tasks[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Dismissible(
                                    key: Key(task.id),
                                    direction: DismissDirection.endToStart,
                                    onDismissed: (_) {
                                      _deleteTask(index);
                                    },
                                    background: Container(
                                      alignment: Alignment.centerRight,
                                      padding:
                                          const EdgeInsets.only(right: 20.0),
                                      color: CupertinoColors.systemRed,
                                      child: const Icon(
                                        CupertinoIcons.delete,
                                        color: CupertinoColors.white,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Card(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        child: ListTile(
                                          title: Text(
                                            task.name,
                                            style: const TextStyle(
                                              color: CupertinoColors.systemGrey,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                          subtitle: task.date != null ||
                                                  task.time != null
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    if (task.date != null)
                                                      Text(
                                                        'Date: ${DateFormat.yMMMd().format(task.date!)}',
                                                        style: const TextStyle(
                                                          color: CupertinoColors
                                                              .systemGrey,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                    if (task.time != null)
                                                      Text(
                                                        'Time: ${task.time!.format(context)}',
                                                        style: const TextStyle(
                                                          color: CupertinoColors
                                                              .systemGrey,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                  ],
                                                )
                                              : null,
                                          leading: CircleAvatar(
                                            backgroundColor: task.completed
                                                ? CupertinoColors.systemGrey
                                                : CupertinoColors.systemBlue,
                                            child: IconButton(
                                              icon: Icon(
                                                task.completed
                                                    ? CupertinoIcons.check_mark
                                                    : CupertinoIcons.circle,
                                                color: CupertinoColors.white,
                                              ),
                                              onPressed: () {
                                                _toggleCompleted(index);
                                              },
                                            ),
                                          ),
                                          trailing: CupertinoButton(
                                            padding: EdgeInsets.zero,
                                            child: const Icon(
                                              CupertinoIcons.ellipsis,
                                              color: CupertinoColors.systemGrey,
                                            ),
                                            onPressed: () {
                                              _showOptions(index);
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (isShowingOptions &&
                                      index == selectedTaskIndex)
                                    const SizedBox(height: 16.0),
                                  if (isShowingOptions &&
                                      index == selectedTaskIndex)
                                    Card(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 2.0),
                                      child: Column(
                                        children: [
                                          CupertinoButton(
                                            onPressed: _showDatePicker,
                                            child: const Text('Date'),
                                          ),
                                          if (isShowingDatePicker)
                                            Container(
                                              height: 200.0,
                                              child: CupertinoDatePicker(
                                                mode: CupertinoDatePickerMode
                                                    .date,
                                                onDateTimeChanged: _selectDate,
                                              ),
                                            ),
                                          CupertinoButton(
                                            onPressed: _showTimePicker,
                                            child: const Text('Time'),
                                          ),
                                          if (isShowingTimePicker)
                                            Container(
                                              height: 200.0,
                                              child: CupertinoDatePicker(
                                                mode: CupertinoDatePickerMode
                                                    .time,
                                                onDateTimeChanged:
                                                    (DateTime dateTime) {
                                                  _selectTime(
                                                      TimeOfDay.fromDateTime(
                                                          dateTime));
                                                },
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                ],
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (!isAddingTask)
                      CupertinoButton(
                        onPressed: () {
                          setState(() {
                            isAddingTask = true;
                          });
                        },
                        child: const Text(
                          'Add Task',
                          style: TextStyle(
                            color: CupertinoColors.systemBlue,
                          ),
                        ),
                      ),
                    if (isAddingTask)
                      Row(
                        children: [
                          Expanded(
                            child: CupertinoTextField(
                              controller: nameController,
                              placeholder: 'Task Name',
                              onSubmitted: (_) {
                                _addTask();
                              },
                            ),
                          ),
                        ],
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
*/

//cdoe 13
/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Task {
  String id; // Firestore document ID
  String name;
  bool completed;
  DateTime? date;
  TimeOfDay? time;

  Task({
    required this.id,
    required this.name,
    this.completed = false,
    this.date,
    this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'completed': completed,
      'date': date,
      'time': time != null ? DateTime(0, 0, 0, time!.hour, time!.minute) : null,
    };
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TaskPage(),
    );
  }
}

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late List<Task> tasks;
  TextEditingController nameController = TextEditingController();
  bool isAddingTask = false;
  bool isShowingOptions = false;
  bool isShowingDatePicker = false;
  bool isShowingTimePicker = false;
  int selectedTaskIndex = -1;

  @override
  void initState() {
    super.initState();
    tasks = [];
  }

  void _addTask() async {
    String name = nameController.text.trim();
    if (name.isNotEmpty) {
      Task task = Task(id: '', name: name);
      DocumentReference documentReference = await FirebaseFirestore.instance
          .collection('tasks')
          .add(task.toMap());
      task.id = documentReference.id;
      setState(() {
        tasks.insert(0, task);
        nameController.clear();
        isAddingTask = false;
      });
    }
  }

  void _deleteTask(int index) async {
    Task task = tasks[index];
    await FirebaseFirestore.instance.collection('tasks').doc(task.id).delete();
    setState(() {
      tasks.removeAt(index);
    });
  }

  void _toggleCompleted(int index) async {
    Task task = tasks[index];
    bool completed = !task.completed;
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(task.id)
        .update({'completed': completed});
    setState(() {
      tasks[index].completed = completed;
    });
  }

  void _showOptions(int index) {
    setState(() {
      isShowingOptions = !isShowingOptions;
      isShowingDatePicker = false;
      isShowingTimePicker = false;
      selectedTaskIndex = index;
    });
  }

  void _showDatePicker() {
    setState(() {
      isShowingDatePicker = !isShowingDatePicker;
      isShowingTimePicker = false;
    });
  }

  void _showTimePicker() {
    setState(() {
      isShowingTimePicker = !isShowingTimePicker;
      isShowingDatePicker = false;
    });
  }

  void _selectDate(DateTime date) async {
    Task task = tasks[selectedTaskIndex];
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(task.id)
        .update({'date': date});
    setState(() {
      tasks[selectedTaskIndex].date = date;
    });
  }

  void _selectTime(TimeOfDay time) async {
    Task task = tasks[selectedTaskIndex];
    DateTime now = DateTime.now();
    DateTime selectedDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(task.id)
        .update({'time': selectedDateTime});

    setState(() {
      tasks[selectedTaskIndex].time = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            if (isAddingTask || isShowingOptions) {
              setState(() {
                isAddingTask = false;
                isShowingOptions = false;
              });
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CupertinoNavigationBarBackButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 8.0),
                    CupertinoButton(
                      onPressed: () {
                        // TODO: Implement edit button functionality
                      },
                      child: const Icon(CupertinoIcons.pencil),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'To-do',
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.systemBlue,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCard('Today', CupertinoIcons.calendar, '0',
                        CupertinoColors.systemBlue),
                    _buildCard('Scheduled', CupertinoIcons.calendar, '0',
                        CupertinoColors.systemRed),
                    _buildCard('All', CupertinoIcons.square, '0', null),
                    _buildCard('Completed', CupertinoIcons.check_mark, '0',
                        CupertinoColors.systemGrey),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoScrollbar(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('tasks')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          tasks = snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            return Task(
                              id: document.id,
                              name: data['name'],
                              completed: data['completed'],
                              date: data['date'] != null
                                  ? (data['date'] as Timestamp).toDate()
                                  : null,
                              time: data['time'] != null
                                  ? TimeOfDay.fromDateTime(
                                      data['time'].toDate())
                                  : null,
                            );
                          }).toList();
                          return ListView.builder(
                            itemCount: tasks.length,
                            itemBuilder: (BuildContext context, int index) {
                              Task task = tasks[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Dismissible(
                                    key: Key(task.id),
                                    direction: DismissDirection.endToStart,
                                    onDismissed: (_) {
                                      _deleteTask(index);
                                    },
                                    background: Container(
                                      alignment: Alignment.centerRight,
                                      padding:
                                          const EdgeInsets.only(right: 20.0),
                                      color: CupertinoColors.systemRed,
                                      child: const Icon(
                                        CupertinoIcons.delete,
                                        color: CupertinoColors.white,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Card(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        child: ListTile(
                                          title: Text(
                                            task.name,
                                            style: const TextStyle(
                                              color: CupertinoColors.systemGrey,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                          subtitle: task.date != null ||
                                                  task.time != null
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    if (task.date != null)
                                                      Text(
                                                        'Date: ${DateFormat.yMMMd().format(task.date!)}',
                                                        style: const TextStyle(
                                                          color: CupertinoColors
                                                              .systemGrey,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                    if (task.time != null)
                                                      Text(
                                                        'Time: ${task.time!.format(context)}',
                                                        style: const TextStyle(
                                                          color: CupertinoColors
                                                              .systemGrey,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                  ],
                                                )
                                              : null,
                                          leading: CircleAvatar(
                                            backgroundColor: task.completed
                                                ? CupertinoColors.systemGrey
                                                : CupertinoColors.systemBlue,
                                            child: IconButton(
                                              icon: Icon(
                                                task.completed
                                                    ? CupertinoIcons.check_mark
                                                    : CupertinoIcons.circle,
                                                color: CupertinoColors.white,
                                              ),
                                              onPressed: () {
                                                _toggleCompleted(index);
                                              },
                                            ),
                                          ),
                                          trailing: CupertinoButton(
                                            padding: EdgeInsets.zero,
                                            child: const Icon(
                                              CupertinoIcons.ellipsis,
                                              color: CupertinoColors.systemGrey,
                                            ),
                                            onPressed: () {
                                              _showOptions(index);
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (isShowingOptions &&
                                      index == selectedTaskIndex)
                                    const SizedBox(height: 16.0),
                                  if (isShowingOptions &&
                                      index == selectedTaskIndex)
                                    Card(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 2.0),
                                      child: Column(
                                        children: [
                                          CupertinoButton(
                                            onPressed: _showDatePicker,
                                            child: const Text('Date'),
                                          ),
                                          if (isShowingDatePicker)
                                            Container(
                                              height: 200.0,
                                              child: CupertinoDatePicker(
                                                mode: CupertinoDatePickerMode
                                                    .date,
                                                onDateTimeChanged: _selectDate,
                                              ),
                                            ),
                                          CupertinoButton(
                                            onPressed: _showTimePicker,
                                            child: const Text('Time'),
                                          ),
                                          if (isShowingTimePicker)
                                            Container(
                                              height: 200.0,
                                              child: CupertinoDatePicker(
                                                mode: CupertinoDatePickerMode
                                                    .time,
                                                onDateTimeChanged:
                                                    (DateTime dateTime) {
                                                  _selectTime(
                                                      TimeOfDay.fromDateTime(
                                                          dateTime));
                                                },
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                ],
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (!isAddingTask)
                      CupertinoButton(
                        onPressed: () {
                          setState(() {
                            isAddingTask = true;
                          });
                        },
                        child: const Text(
                          'Add Task',
                          style: TextStyle(
                            color: CupertinoColors.systemBlue,
                          ),
                        ),
                      ),
                    if (isAddingTask)
                      Row(
                        children: [
                          Expanded(
                            child: CupertinoTextField(
                              controller: nameController,
                              placeholder: 'Task Name',
                              onSubmitted: (_) {
                                _addTask();
                              },
                            ),
                          ),
                          CupertinoButton(
                            child: const Text('Done'),
                            onPressed: () {
                              _addTask();
                            },
                          ),
                        ],
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

  Widget _buildCard(String title, IconData icon, String count, Color? color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(icon, color: color ?? CupertinoColors.systemGrey),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Text(
                  count,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.systemBlue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/

// code 14

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Task {
  String id; // Firestore document ID
  String name;
  bool completed;
  DateTime? date;
  TimeOfDay? time;

  Task({
    required this.id,
    required this.name,
    this.completed = false,
    this.date,
    this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'completed': completed,
      'date': date,
      'time': time != null ? DateTime(0, 0, 0, time!.hour, time!.minute) : null,
    };
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TaskPage(),
    );
  }
}

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late List<Task> tasks;
  TextEditingController nameController = TextEditingController();
  bool isAddingTask = false;
  bool isShowingOptions = false;
  bool isShowingDatePicker = false;
  bool isShowingTimePicker = false;
  int selectedTaskIndex = -1;

  @override
  void initState() {
    super.initState();
    tasks = [];
  }

  void _addTask() async {
    String name = nameController.text.trim();
    if (name.isNotEmpty) {
      Task task = Task(id: '', name: name);
      DocumentReference documentReference = await FirebaseFirestore.instance
          .collection('tasks')
          .add(task.toMap());
      task.id = documentReference.id;
      setState(() {
        tasks.insert(0, task);
        nameController.clear();
        isAddingTask = false;
      });
    }
  }

  void _deleteTask(int index) async {
    Task task = tasks[index];
    await FirebaseFirestore.instance.collection('tasks').doc(task.id).delete();
    setState(() {
      tasks.removeAt(index);
    });
  }

  void _toggleCompleted(int index) async {
    Task task = tasks[index];
    bool completed = !task.completed;
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(task.id)
        .update({'completed': completed});
    setState(() {
      tasks[index].completed = completed;
    });
  }

  void _showOptions(int index) {
    setState(() {
      isShowingOptions = !isShowingOptions;
      isShowingDatePicker = false;
      isShowingTimePicker = false;
      selectedTaskIndex = index;
    });
  }

  void _showDatePicker() {
    setState(() {
      isShowingDatePicker = !isShowingDatePicker;
      isShowingTimePicker = false;
    });
  }

  void _showTimePicker() {
    setState(() {
      isShowingTimePicker = !isShowingTimePicker;
      isShowingDatePicker = false;
    });
  }

  void _selectDate(DateTime date) async {
    Task task = tasks[selectedTaskIndex];
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(task.id)
        .update({'date': date});
    setState(() {
      tasks[selectedTaskIndex].date = date;
    });
  }

  void _selectTime(TimeOfDay time) async {
    Task task = tasks[selectedTaskIndex];
    DateTime now = DateTime.now();
    DateTime selectedDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(task.id)
        .update({'time': selectedDateTime});

    setState(() {
      tasks[selectedTaskIndex].time = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            if (isAddingTask || isShowingOptions) {
              setState(() {
                isAddingTask = false;
                isShowingOptions = false;
              });
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CupertinoNavigationBarBackButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 8.0),
                  ],
                ),
              ),
              const SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCard('Today', CupertinoIcons.calendar_today, '0',
                        CupertinoColors.systemBlue),
                    _buildCard('Scheduled', CupertinoIcons.calendar, '0',
                        CupertinoColors.systemRed),
                    /*
                    _buildCard1('All', CupertinoIcons.square, '0', null),
                    _buildCard1('Completed', CupertinoIcons.check_mark, '0',
                        CupertinoColors.systemGrey),
                        */
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'To-do',
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CupertinoScrollbar(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('tasks')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          tasks = snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            return Task(
                              id: document.id,
                              name: data['name'],
                              completed: data['completed'],
                              date: data['date'] != null
                                  ? (data['date'] as Timestamp).toDate()
                                  : null,
                              time: data['time'] != null
                                  ? TimeOfDay.fromDateTime(
                                      data['time'].toDate())
                                  : null,
                            );
                          }).toList();
                          return ListView.builder(
                            itemCount: tasks.length,
                            itemBuilder: (BuildContext context, int index) {
                              Task task = tasks[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Dismissible(
                                    key: Key(task.id),
                                    direction: DismissDirection.endToStart,
                                    onDismissed: (_) {
                                      _deleteTask(index);
                                    },
                                    background: Container(
                                      alignment: Alignment.centerRight,
                                      padding:
                                          const EdgeInsets.only(right: 20.0),
                                      color: CupertinoColors.systemRed,
                                      child: const Icon(
                                        CupertinoIcons.delete,
                                        color: CupertinoColors.white,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Card(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        child: ListTile(
                                          title: Text(
                                            task.name,
                                            style: const TextStyle(
                                              color: CupertinoColors.systemGrey,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                          subtitle: task.date != null ||
                                                  task.time != null
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    if (task.date != null)
                                                      Text(
                                                        'Date: ${DateFormat.yMMMd().format(task.date!)}',
                                                        style: const TextStyle(
                                                          color: CupertinoColors
                                                              .systemGrey,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                    if (task.time != null)
                                                      Text(
                                                        'Time: ${task.time!.format(context)}',
                                                        style: const TextStyle(
                                                          color: CupertinoColors
                                                              .systemGrey,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                  ],
                                                )
                                              : null,
                                          leading: CircleAvatar(
                                            backgroundColor: task.completed
                                                ? CupertinoColors.systemGrey
                                                : CupertinoColors.systemBlue,
                                            child: IconButton(
                                              icon: Icon(
                                                task.completed
                                                    ? CupertinoIcons.check_mark
                                                    : CupertinoIcons.circle,
                                                color: CupertinoColors.white,
                                              ),
                                              onPressed: () {
                                                _toggleCompleted(index);
                                              },
                                            ),
                                          ),
                                          trailing: CupertinoButton(
                                            padding: EdgeInsets.zero,
                                            child: const Icon(
                                              CupertinoIcons.ellipsis,
                                              color: CupertinoColors.systemGrey,
                                            ),
                                            onPressed: () {
                                              _showOptions(index);
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (isShowingOptions &&
                                      index == selectedTaskIndex)
                                    const SizedBox(height: 16.0),
                                  if (isShowingOptions &&
                                      index == selectedTaskIndex)
                                    Card(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 2.0),
                                      child: Column(
                                        children: [
                                          CupertinoButton(
                                            onPressed: _showDatePicker,
                                            child: const Text('Date'),
                                          ),
                                          if (isShowingDatePicker)
                                            Container(
                                              height: 200.0,
                                              child: CupertinoDatePicker(
                                                mode: CupertinoDatePickerMode
                                                    .date,
                                                onDateTimeChanged: _selectDate,
                                              ),
                                            ),
                                          CupertinoButton(
                                            onPressed: _showTimePicker,
                                            child: const Text('Time'),
                                          ),
                                          if (isShowingTimePicker)
                                            Container(
                                              height: 200.0,
                                              child: CupertinoDatePicker(
                                                mode: CupertinoDatePickerMode
                                                    .time,
                                                onDateTimeChanged:
                                                    (DateTime dateTime) {
                                                  _selectTime(
                                                      TimeOfDay.fromDateTime(
                                                          dateTime));
                                                },
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                ],
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (!isAddingTask)
                      CupertinoButton(
                        onPressed: () {
                          setState(() {
                            isAddingTask = true;
                          });
                        },
                        child: const Text(
                          'Add Task',
                          style: TextStyle(
                            color: CupertinoColors.systemBlue,
                          ),
                        ),
                      ),
                    if (isAddingTask)
                      Row(
                        children: [
                          Expanded(
                            child: CupertinoTextField(
                              controller: nameController,
                              placeholder: 'Task Name',
                              onSubmitted: (_) {
                                _addTask();
                              },
                            ),
                          ),
                          CupertinoButton(
                            child: const Text('Done'),
                            onPressed: () {
                              _addTask();
                            },
                          ),
                        ],
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

// cards
  Widget _buildCard(String title, IconData icon, String count, Color? color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(10.0), // Adjust the value as needed
          child: Card(
            elevation: 2.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        icon,
                        color: color ?? CupertinoColors.systemGrey,
                        size: 40.0,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      count,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.systemBlue,
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

  Widget _buildCard1(String title, IconData icon, String count, Color? color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
        child: Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Icon(
                        icon,
                        color: color ?? CupertinoColors.systemGrey,
                        size: 40.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    count,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.systemBlue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
