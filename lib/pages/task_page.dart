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

*/
//code 15
/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailsPage()));
            },
            child: const Text('Tap here!')),
      ),
    );
  }
}

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool _showDatePicker = false;
  bool _showTimePicker = false;

  final _taskNameController = TextEditingController(text: 'Task name');
  final _notesController = TextEditingController(text: 'Notes');

  DateTime? _selectedDate; // Added variable
  TimeOfDay? _selectedTime; // Added variable

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _initializeHive() async {
    await Hive.initFlutter();
    await Hive.openBox('tasks');
  }

  @override
  void initState() {
    super.initState();
    _initializeHive();
  }

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
    final box = Hive.box('tasks');
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
*/

//code 16
//works
/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
      ),
      body: Center(
        child: TaskList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DetailsPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Text('Loading...');
        }

        final tasks = snapshot.data!.docs;

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final taskData = tasks[index].data()
                as Map<String, dynamic>; // Explicit casting to Map
            final taskName = taskData['taskName'];

            return Card(
              child: ListTile(
                title: Text(taskName ?? 'No Task Name'),
              ),
            );
          },
        );
      },
    );
  }
}

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool _showDatePicker = false;
  bool _showTimePicker = false;

  final _taskNameController = TextEditingController(text: 'Task name');
  final _notesController = TextEditingController(text: 'Notes');

  DateTime? _selectedDate; // Added variable
  TimeOfDay? _selectedTime; // Added variable

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _initializeHive() async {
    await Hive.initFlutter();
    await Hive.openBox('tasks');
  }

  @override
  void initState() {
    super.initState();
    _initializeHive();
  }

  void _unfocus() {
    FocusScope.of(context).unfocus();
  }

  void _saveToFirestore(
      String taskName, String notes, DateTime? date, TimeOfDay? time) {
    _firestore.collection('tasks').add({
      'taskName': taskName,
      'notes': notes,
      'date': date != null ? Timestamp.fromDate(date) : null,
      'time': time != null ? DateTime(0, 0, 0, time.hour, time.minute) : null,
    });
  }

  void _saveToHive(
      String taskName, String notes, DateTime? date, TimeOfDay? time) async {
    final box = Hive.box('tasks');
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
*/
//code 17

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_cupertino/dropdown_cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: CupertinoNavigationBarBackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Task List',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0, // Remove shadow from the app bar
      ),
      body: Container(
        color: Colors.white, // Set the background color to white
        padding: const EdgeInsets.all(20.0), // Add padding to tasks
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: Text('Loading...'));
            }

            final tasks = snapshot.data!.docs;

            if (tasks.isEmpty) {
              return const Center(
                child: Text('You don\'t have any tasks.'),
              );
            }

            return SingleChildScrollView(
              child: Column(
                children: tasks.map((task) {
                  final taskData = task.data() as Map<String, dynamic>;
                  final taskId = task.id;
                  final taskName = taskData['taskName'];
                  final date = taskData['date'] as Timestamp?;
                  final bool isCompleted = taskData['completed'] ?? false;

                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TaskPage(taskData: taskData),
                            ),
                          );
                          // Provide haptic feedback when the task name is pressed
                          HapticFeedback.mediumImpact();
                        },
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Toggle task completion state and update in Firestore and Hive
                                final bool newCompletionState = !isCompleted;
                                task.reference
                                    .update({'completed': newCompletionState});
                                final box = Hive.box('tasks');
                                box.put(taskId, {
                                  ...taskData,
                                  'completed': newCompletionState
                                });
                                // Provide haptic feedback when the circle is pressed
                                HapticFeedback.mediumImpact();
                              },
                              child: Icon(
                                CupertinoIcons.largecircle_fill_circle,
                                color: isCompleted ? Colors.blue : Colors.grey,
                                size: 20.0,
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Expanded(
                              child: Text(
                                taskName ?? 'No Task Name',
                                style: const TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Row(
                        children: [
                          SizedBox(
                              width: 30.0), // Add 15px space from the left edge
                          Expanded(
                            child: Divider(
                              height: 15,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DetailsPage()),
              );
              // Provide haptic feedback when the "New Task" button is pressed
              HapticFeedback.mediumImpact();
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    CupertinoIcons.add_circled_solid,
                    color: Colors.blueAccent,
                    size: 30.0,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'New task',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
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

// Task Page where we supposed to edit and delete the
class TaskPage extends StatefulWidget {
  final Map<String, dynamic> taskData;

  const TaskPage({Key? key, required this.taskData}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  bool _showDatePicker = false;
  bool _showTimePicker = false;
  bool _showFocusPicker = false;

  late TextEditingController _taskNameController;
  late TextEditingController _notesController;

  FocusOption _selectedFocus = FocusOption.none;
  ReminderOption _selectedReminder = ReminderOption.never;

  bool _showReminderPicker = false; // Added variable

  List<String> _reminderOptions = [
    'Never',
    '5 minutes before',
    '15 minutes before',
    '30 minutes before',
    '1 hour before',
  ];

  Map<String, String> _reminderMap = {
    'Never': 'Never',
    '5 minutes before': '5 min before',
    '15 minutes before': '15 min before',
    '30 minutes before': '30 min before',
    '1 hour before': '1 hour before',
  };

  List<String> _focusOptions = [
    'None',
    'Reading',
    'Fitness',
    'Work',
    'Mindfulness',
  ];

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    _openHiveBox();
    _taskNameController =
        TextEditingController(text: widget.taskData['taskName']);
    _notesController = TextEditingController(text: widget.taskData['notes']);
    _selectedDate = widget.taskData['date']?.toDate();
    _selectedTime = widget.taskData['time'] != null
        ? TimeOfDay.fromDateTime(widget.taskData['time'].toDate())
        : null;
  }

  void _openHiveBox() async {
    await Hive.initFlutter();
    await Hive.openBox('tasks');
  }

  void _unfocus() {
    FocusScope.of(context).unfocus();
  }

  String _formatSelectedDate(DateTime? date) {
    if (date == null) return 'Today';
    final String day = DateFormat('EEEE').format(date);
    final String month = DateFormat('MMMM').format(date);
    final String dayOfMonth = DateFormat('d').format(date);
    final String year = DateFormat('y').format(date);
    return '$day, $month $dayOfMonth, $year';
  }

  String _formatSelectedTime(TimeOfDay? time) {
    if (time == null) return 'No time set';
    final String hour = time.hourOfPeriod.toString().padLeft(2, '0');
    final String minute = time.minute.toString().padLeft(2, '0');
    final String period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  String _generateTaskId(String taskName, DateTime date) {
    final String dateString = DateFormat('yyyyMMddHHmmss').format(date);
    return '${taskName.hashCode}-$dateString';
  }

  void _saveToFirestore(
    String taskName,
    String notes,
    DateTime? date,
    TimeOfDay? time,
  ) {
    final firestore = FirebaseFirestore.instance;

    if (date != null) {
      final taskId = _generateTaskId(taskName, date);
      final taskDocRef = firestore.collection('tasks').doc(taskId);

      taskDocRef.get().then((docSnapshot) {
        if (docSnapshot.exists) {
          taskDocRef.update({
            'taskName': taskName,
            'notes': notes,
            'date': date,
            'time': time != null ? _timeOfDayToDateTime(time) : null,
            'reminder': _selectedReminder.toString(),
            'focus': _selectedFocus.toString(),
          });
        } else {
          taskDocRef.set({
            'taskName': taskName,
            'notes': notes,
            'date': date,
            'time': time != null ? _timeOfDayToDateTime(time) : null,
            'reminder': _selectedReminder.toString(),
            'focus': _selectedFocus.toString(),
          });
        }
      }).catchError((error) {
        print('Error while checking/updating Firestore document: $error');
      });
    } else {
      print('Error: Date parameter is null.');
    }
  }

  DateTime? _timeOfDayToDateTime(TimeOfDay time) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, time.hour, time.minute);
  }

  void _saveToHive(
    String taskName,
    String notes,
    DateTime? date,
    TimeOfDay? time,
  ) async {
    final box = Hive.box('tasks');
    final existingTask = box.values.firstWhere(
      (task) =>
          task['taskName'] == taskName &&
          _dateEquals(task['date'], date) &&
          _timeEquals(task['time'], time),
      orElse: () => null,
    );

    if (existingTask != null) {
      // If the task already exists, update it
      final taskId = existingTask['taskId'];
      box.put(taskId, {
        'taskName': taskName,
        'notes': notes,
        'date': date,
        'time': time != null ? _timeOfDayToDateTime(time) : null,
      });
    } else {
      // If the task is new, generate a task ID and add it to Hive
    }
  }

  bool _dateEquals(DateTime? dateTime1, DateTime? dateTime2) {
    if (dateTime1 == null && dateTime2 == null) {
      return true;
    }
    return dateTime1?.compareTo(dateTime2 ?? DateTime(0)) == 0;
  }

  bool _timeEquals(DateTime? dateTime, TimeOfDay? time) {
    if (dateTime == null && time == null) {
      return true;
    }
    if (dateTime == null || time == null) {
      return false;
    }
    return dateTime.hour == time.hour && dateTime.minute == time.minute;
  }

  String _timeOfDayToString(TimeOfDay? time) {
    if (time == null) return '';
    return '${time.hour}:${time.minute}';
  }

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Delete Task'),
          content: const Text('Are you sure you want to delete this task?'),
          actions: [
            CupertinoDialogAction(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              child: const Text('Delete'),
              isDestructiveAction: true,
              onPressed: () {
                final taskName = widget.taskData['taskName'];

                _deleteTask(taskName);

                Navigator.pop(context);
                Navigator.pop(
                    context); // Pop twice to go back to the previous screen
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteTask(String taskName) async {
    final box = Hive.box('tasks');
    final taskIndex =
        box.values.toList().indexWhere((task) => task['taskName'] == taskName);

    if (taskIndex != -1) {
      await box.deleteAt(taskIndex);
    }

    // Also delete the task from Firestore if needed
    final taskQuery = await FirebaseFirestore.instance
        .collection('tasks')
        .where('taskName', isEqualTo: taskName)
        .get();

    for (final doc in taskQuery.docs) {
      await doc.reference.delete();
    }
  }

  void _toggleDatePicker() {
    setState(() {
      _showDatePicker = !_showDatePicker;
      if (_showDatePicker) {
        _showTimePicker = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _unfocus,
      child: Scaffold(
        appBar: CupertinoNavigationBar(
          leading: CupertinoNavigationBarBackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          middle: const Text('Task Details'),
          trailing: GestureDetector(
            onTap: _showDeleteConfirmationDialog,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(CupertinoIcons.ellipsis),
            ),
          ),
        ),
        body: CupertinoScrollbar(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  //const SizedBox(height: 10.0),
                  Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CupertinoTextField(
                            controller: _taskNameController,
                            placeholder: 'Task name',
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CupertinoTextField(
                            controller: _notesController,
                            placeholder: 'Notes',
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
                    child: GestureDetector(
                      onTap: () {
                        _toggleDatePicker();
                      },
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Date'),
                                    const SizedBox(
                                        height: 2), // Space between lines
                                    Text(
                                      _selectedDate != null
                                          ? DateFormat('yyyy-MM-dd')
                                              .format(_selectedDate!)
                                          : '', // Format and display the selected date, or leave it blank
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                CupertinoSwitch(
                                  value: _showDatePicker,
                                  onChanged: (val) {
                                    setState(() {
                                      _toggleDatePicker();
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          if (_showDatePicker)
                            Column(
                              children: [
                                const Divider(),
                                Container(
                                  height: 200.0,
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    initialDateTime: _selectedDate,
                                    onDateTimeChanged: (val) {
                                      setState(() {
                                        _selectedDate = val;
                                      });
                                    },
                                  ),
                                ),
                              ],
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Time'),
                                    const SizedBox(
                                        height: 2), // Space between lines
                                    Text(
                                      _selectedTime != null
                                          ? _selectedTime!.format(context)
                                          : '', // Format and display the selected time, or leave it blank
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                CupertinoSwitch(
                                  value: _showTimePicker,
                                  onChanged: (val) {
                                    setState(() {
                                      _showTimePicker = val;
                                      if (!_showTimePicker && _showDatePicker) {
                                        _showDatePicker = false;
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          if (_showTimePicker)
                            Column(
                              children: [
                                const Divider(),
                                Container(
                                  height: 200.0,
                                  child: CupertinoTimerPicker(
                                    mode: CupertinoTimerPickerMode.hm,
                                    initialTimerDuration: _selectedTime != null
                                        ? Duration(
                                            hours: _selectedTime!.hour,
                                            minutes: _selectedTime!.minute)
                                        : Duration.zero,
                                    onTimerDurationChanged: (val) {
                                      setState(() {
                                        _selectedTime = TimeOfDay.fromDateTime(
                                            DateTime(0, 0, 0).add(val));
                                      });
                                    },
                                  ),
                                ),
                                if (_showTimePicker && _selectedTime != null)
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          CupertinoIcons.clock_fill,
                                          color: Colors.blueAccent,
                                        ),
                                        const SizedBox(width: 10.0),
                                        Text(
                                          _formatSelectedTime(_selectedTime),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                  //Early reminders
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Early Reminder'),
                                  const SizedBox(
                                      height: 2), // Space between lines
                                  Text(
                                    '${reminderOptionMap[_selectedReminder] ?? ""}',
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showReminderPicker = !_showReminderPicker;
                                  });
                                },
                                child: const Icon(
                                  CupertinoIcons.chevron_right,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (_showReminderPicker)
                          SizedBox(
                            height: 200.0,
                            child: CupertinoPicker(
                              itemExtent: 32.0,
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  _selectedReminder =
                                      ReminderOption.values[index];
                                });
                              },
                              children: reminderOptionMap.values
                                  .map((option) => Text(option))
                                  .toList(),
                            ),
                          ),
                        const SizedBox(
                          height: 2, // Space to separate from picker
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
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _showFocusPicker = !_showFocusPicker;
                              });
                            },
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.pinkAccent,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: const Icon(
                                    CupertinoIcons
                                        .square_stack_3d_down_dottedline,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Focus'),
                                    const SizedBox(
                                        height:
                                            2), // Space between "Focus" and selected focus
                                    Text(
                                      '${_selectedFocus.toString().split('.').last}', // Display selected focus here
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Icon(
                                  CupertinoIcons.chevron_right,
                                  color: _showFocusPicker
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          AnimatedContainer(
                            height: _showFocusPicker ? 100.0 : 0.0,
                            duration: const Duration(milliseconds: 200),
                            child: CupertinoPicker(
                              itemExtent: 32.0,
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  _selectedFocus = FocusOption.values[index];
                                });
                              },
                              children: _focusOptions
                                  .map((option) => Text(option))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30.0),
                  CupertinoButton(
                    child: const Text('Save'),
                    onPressed: () {
                      _unfocus();
                      _saveToFirestore(
                        _taskNameController.text.trim(),
                        _notesController.text.trim(),
                        _selectedDate,
                        _selectedTime,
                      );
                      _saveToHive(
                        _taskNameController.text.trim(),
                        _notesController.text.trim(),
                        _selectedDate,
                        _selectedTime,
                      );
                      Navigator.pop(context);
                    },
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

//fix made

enum FocusOption {
  none,
  reading,
  fitness,
  work,
  mindfulness,
}

enum ReminderOption {
  never,
  oneMinuteBefore,
  fiveMinutesBefore,
  tenMinutesBefore,
}

Map<ReminderOption, String> reminderOptionMap = {
  ReminderOption.never: "Never",
  ReminderOption.oneMinuteBefore: "1 minute before",
  ReminderOption.fiveMinutesBefore: "5 minutes before",
  ReminderOption.tenMinutesBefore: "10 minutes before",
};

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool _showDatePicker = false;
  bool _showTimePicker = false;

  final _taskNameController = TextEditingController(text: 'Task name');
  final _notesController = TextEditingController(text: 'Notes');

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  bool _showFocusPicker = false;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FocusOption _selectedFocus = FocusOption.none;
  ReminderOption _selectedReminder = ReminderOption.never;

  bool _showReminderPicker = false; // Added variable

  List<String> _reminderOptions = [
    'Never',
    '5 minutes before',
    '15 minutes before',
    '30 minutes before',
    '1 hour before',
  ];

  Map<String, String> _reminderMap = {
    'Never': 'Never',
    '5 minutes before': '5 min before',
    '15 minutes before': '15 min before',
    '30 minutes before': '30 min before',
    '1 hour before': '1 hour before',
  };

  List<String> _focusOptions = [
    'None',
    'Reading',
    'Fitness',
    'Work',
    'Mindfulness',
  ];

  @override
  void initState() {
    super.initState();
    _initializeHive();
    _checkAndAddNewFocusOptions();
  }

  Future<void> _checkAndAddNewFocusOptions() async {
    QuerySnapshot focusOptionsSnapshot =
        await _firestore.collection('focusOptions').get();
    List<String> newFocusOptions = focusOptionsSnapshot.docs
        .map((doc) => doc['option'] as String)
        .toList();

    for (String newOption in newFocusOptions) {
      if (!_focusOptions.contains(newOption)) {
        setState(() {
          _focusOptions.add(newOption);
        });
      }
    }
  }

  Future<void> _initializeHive() async {
    await Hive.initFlutter();
    await Hive.openBox('tasks');
  }

  void _unfocus() {
    FocusScope.of(context).unfocus();
  }

//fix firestore date and time

  void _saveToFirestore(
      String taskName, String notes, DateTime? date, TimeOfDay? time) {
    // Convert TimeOfDay to DateTime with the selected time
    DateTime? selectedDateTime;
    if (date != null && time != null) {
      selectedDateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    }

    _firestore.collection('tasks').add({
      'taskName': taskName,
      'notes': notes,
      'date': date != null
          ? Timestamp.fromDate(DateTime(date.year, date.month, date.day))
          : null,
      'time': selectedDateTime != null
          ? Timestamp.fromDate(selectedDateTime)
          : null,
      'focus': _selectedFocus.toString().split('.').last,
      'reminder': _selectedReminder.toString().split('.').last,
    });
  }

  void _saveToHive(
      String taskName, String notes, DateTime? date, TimeOfDay? time) async {
    final box = Hive.box('tasks');
    box.add({
      'taskName': taskName,
      'notes': notes,
      'date': date,
      'time': time != null && date != null
          ? DateTime(date.year, date.month, date.day, time.hour, time.minute)
          : null,
      'focus': _selectedFocus.toString().split('.').last,
      'reminder': _selectedReminder.toString().split('.').last,
    });
  }

  String _formatSelectedDate(DateTime? date) {
    if (date == null) return 'Today';
    final String day = DateFormat('EEEE').format(date);
    final String month = DateFormat('MMMM').format(date);
    final String dayOfMonth = DateFormat('d').format(date);
    final String year = DateFormat('y').format(date);
    return '$day, $month $dayOfMonth, $year';
  }

  String _formatSelectedTime(TimeOfDay? time) {
    if (time == null) return 'No time set';
    final String hour = time.hourOfPeriod.toString().padLeft(2, '0');
    final String minute = time.minute.toString().padLeft(2, '0');
    final String period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  void _toggleDatePicker() {
    setState(() {
      _showDatePicker = !_showDatePicker;
      if (_showDatePicker) {
        _showTimePicker = false;
      }
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
                          Navigator.pop(
                              context); // Navigate back to the previous page
                        },
                      ),
                      const Text('Details', style: TextStyle(fontSize: 18.0)),
                      CupertinoButton(
                        child: const Text('Done'),
                        onPressed: () {
                          String taskName = _taskNameController.text;
                          String notes = _notesController.text;

                          print("Selected Date: $_selectedDate");
                          print("Selected Time: $_selectedTime");

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
                    child: GestureDetector(
                      onTap: () {
                        _toggleDatePicker();
                      },
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Date'),
                                    const SizedBox(
                                        height: 2), // Space between lines
                                    Text(
                                      _selectedDate != null
                                          ? DateFormat('yyyy-MM-dd')
                                              .format(_selectedDate!)
                                          : '', // Format and display the selected date, or leave it blank
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                CupertinoSwitch(
                                  value: _showDatePicker,
                                  onChanged: (val) {
                                    setState(() {
                                      _toggleDatePicker();
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          if (_showDatePicker)
                            Column(
                              children: [
                                const Divider(),
                                Container(
                                  height: 200.0,
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    initialDateTime: _selectedDate,
                                    onDateTimeChanged: (val) {
                                      setState(() {
                                        _selectedDate = val;
                                      });
                                    },
                                  ),
                                ),
                              ],
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Time'),
                                    const SizedBox(
                                        height: 2), // Space between lines
                                    Text(
                                      _selectedTime != null
                                          ? _selectedTime!.format(context)
                                          : '', // Format and display the selected time, or leave it blank
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                CupertinoSwitch(
                                  value: _showTimePicker,
                                  onChanged: (val) {
                                    setState(() {
                                      _showTimePicker = val;
                                      if (!_showTimePicker && _showDatePicker) {
                                        _showDatePicker = false;
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          if (_showTimePicker)
                            Column(
                              children: [
                                const Divider(),
                                Container(
                                  height: 200.0,
                                  child: CupertinoTimerPicker(
                                    mode: CupertinoTimerPickerMode.hm,
                                    initialTimerDuration: _selectedTime != null
                                        ? Duration(
                                            hours: _selectedTime!.hour,
                                            minutes: _selectedTime!.minute)
                                        : Duration.zero,
                                    onTimerDurationChanged: (val) {
                                      setState(() {
                                        _selectedTime = TimeOfDay.fromDateTime(
                                            DateTime(0, 0, 0).add(val));
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  //fix 1
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Early Reminder'),
                                  const SizedBox(
                                      height: 2), // Space between lines
                                  Text(
                                    '${reminderOptionMap[_selectedReminder] ?? ""}',
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showReminderPicker = !_showReminderPicker;
                                  });
                                },
                                child: const Icon(
                                  CupertinoIcons.chevron_right,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (_showReminderPicker)
                          SizedBox(
                            height: 200.0,
                            child: CupertinoPicker(
                              itemExtent: 32.0,
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  _selectedReminder =
                                      ReminderOption.values[index];
                                });
                              },
                              children: reminderOptionMap.values
                                  .map((option) => Text(option))
                                  .toList(),
                            ),
                          ),
                        const SizedBox(
                          height: 2, // Space to separate from picker
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

//above should be fixed
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _showFocusPicker = !_showFocusPicker;
                              });
                            },
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.pinkAccent,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: const Icon(
                                    CupertinoIcons
                                        .square_stack_3d_down_dottedline,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Focus'),
                                    const SizedBox(
                                        height:
                                            2), // Space between "Focus" and selected focus
                                    Text(
                                      '${_selectedFocus.toString().split('.').last}', // Display selected focus here
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Icon(
                                  CupertinoIcons.chevron_right,
                                  color: _showFocusPicker
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          AnimatedContainer(
                            height: _showFocusPicker ? 100.0 : 0.0,
                            duration: const Duration(milliseconds: 200),
                            child: CupertinoPicker(
                              itemExtent: 32.0,
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  _selectedFocus = FocusOption.values[index];
                                });
                              },
                              children: _focusOptions
                                  .map((option) => Text(option))
                                  .toList(),
                            ),
                          ),
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
