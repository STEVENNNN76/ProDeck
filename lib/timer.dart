//code 1
/*
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_circular_progress_indicator/flutter_circular_progress_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:prodeck/pages/task_page.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late Duration _duration = Duration.zero;
  bool _isPaused = false;
  bool _isStarted = false;
  double _percentComplete = 0.0;
  Timer? _timer;

  void _startTimer() {
    if (_duration.inSeconds == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No time has been set.'),
        ),
      );
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_duration.inSeconds == 0) {
            timer.cancel();
            _isStarted = false;
          } else {
            _duration = Duration(seconds: _duration.inSeconds - 1);
            _percentComplete = 1.0 -
                (_duration.inSeconds / _duration.inSeconds.ceilToDouble());
          }
        });
      });
    }
  }

  void _pauseTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      setState(() {
        _isPaused = true;
      });
    }
  }

  void _stopTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    setState(() {
      _isPaused = false;
      _isStarted = false;
      _duration = const Duration();
      _percentComplete = 0.0;
    });
  }

  void _setTimer(Duration duration) {
    if (duration.inSeconds == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No time has been set.'),
        ),
      );
    } else {
      setState(() {
        _duration = duration;
        _isStarted = true;
        _isPaused = false;
        _percentComplete = 0.0;
      });
      _startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              ' ',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            !_isStarted
                ? CupertinoTimerPicker(
                    mode: CupertinoTimerPickerMode.hms,
                    onTimerDurationChanged: (duration) {
                      _duration = duration;
                    },
                  )
                : CircularPercentIndicator(
                    radius: MediaQuery.of(context).size.width * 0.6,
                    lineWidth: 10.0,
                    percent: _percentComplete,
                    center: Text(
                      '${_duration.inHours.toString().padLeft(2, '0')}:${(_duration.inMinutes % 60).toString().padLeft(2, '0')}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}',
                      style: const TextStyle(fontSize: 40),
                    ),
                    progressColor: Colors.pink,
                  ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _isStarted && !_isPaused
                    ? ElevatedButton(
                        onPressed: _pauseTimer,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(120, 48),
                        ),
                        child: const Text(
                          'Pause',
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () => _setTimer(_duration),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(120, 48),
                        ),
                        child: Text(
                          _isPaused ? 'Resume' : 'Start',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                ElevatedButton(
                  onPressed: _isStarted ? _stopTimer : null,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(120, 48),
                  ),
                  child: const Text(
                    'Stop',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/

//live
/*

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:prodeck/pages/task_page.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'dynamic/dynamic_island_manager.dart';
import 'dynamic/dynamic_island_stopwatch_data_model.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late Duration _duration = Duration.zero;
  bool _isPaused = false;
  bool _isStarted = false;
  double _percentComplete = 0.0;
  Timer? _timer;
  final DynamicIslandManager diManager = DynamicIslandManager(channelKey: 'DI');
  // Live Activity variables
  bool _isLiveActivityRunning = false;
  Timer? _liveActivityTimer;
  int _liveActivitySeconds = 0;

  void _startLiveActivity() {
    setState(() {
      _isLiveActivityRunning = true;
    });

    // Invoking startLiveActivity Method
    diManager.startLiveActivity(
      jsonData: DynamicIslandStopwatchDataModel(elapsedSeconds: 0).toMap(),
    );

    _liveActivityTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _liveActivitySeconds++;
      });

      // Invoking the updateLiveActivity Method
      diManager.updateLiveActivity(
        jsonData: DynamicIslandStopwatchDataModel(
          elapsedSeconds: _liveActivitySeconds,
        ).toMap(),
      );
    });
  }

  void _stopLiveActivity() {
    _liveActivityTimer?.cancel();
    setState(() {
      _liveActivitySeconds = 0;
      _isLiveActivityRunning = false;
    });

    // Invoking the stopLiveActivity Method
    diManager.stopLiveActivity();
  }

  void _startTimer() {
    if (_duration.inSeconds == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No time has been set.'),
        ),
      );
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_duration.inSeconds == 0) {
            timer.cancel();
            _isStarted = false;
          } else {
            _duration = Duration(seconds: _duration.inSeconds - 1);
            _percentComplete = 1.0 -
                (_duration.inSeconds / _duration.inSeconds.ceilToDouble());
          }
        });
      });
    }
  }

  void _pauseTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      setState(() {
        _isPaused = true;
      });
    }
  }

  void _stopTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    setState(() {
      _isPaused = false;
      _isStarted = false;
      _duration = const Duration();
      _percentComplete = 0.0;
    });
  }

  void _setTimer(Duration duration) {
    if (duration.inSeconds == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No time has been set.'),
        ),
      );
    } else {
      setState(() {
        _duration = duration;
        _isStarted = true;
        _isPaused = false;
        _percentComplete = 0.0;
      });
      _startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              ' ',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            !_isStarted
                ? CupertinoTimerPicker(
                    mode: CupertinoTimerPickerMode.hms,
                    onTimerDurationChanged: (duration) {
                      _duration = duration;
                    },
                  )
                : CircularPercentIndicator(
                    radius: MediaQuery.of(context).size.width * 0.6,
                    lineWidth: 10.0,
                    percent: _percentComplete,
                    center: Text(
                      '${_duration.inHours.toString().padLeft(2, '0')}:${(_duration.inMinutes % 60).toString().padLeft(2, '0')}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}',
                      style: const TextStyle(fontSize: 40),
                    ),
                    progressColor: Colors.pink,
                  ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _isStarted && !_isPaused
                    ? ElevatedButton(
                        onPressed: _pauseTimer,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(120, 48),
                        ),
                        child: const Text(
                          'Pause',
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () => _setTimer(_duration),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(120, 48),
                        ),
                        child: Text(
                          _isPaused ? 'Resume' : 'Start',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                ElevatedButton(
                  onPressed: _isStarted ? _stopTimer : null,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(120, 48),
                  ),
                  child: const Text(
                    'Stop',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ElevatedButton(
                  onPressed: _isLiveActivityRunning
                      ? _stopLiveActivity
                      : _startLiveActivity,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(120, 48),
                  ),
                  child: Text(
                    _isLiveActivityRunning ? 'Stop Live' : 'Start Live',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/

// Dynamic island works
/*
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:prodeck/pages/task_page.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'dynamic/dynamic_island_manager.dart';
import 'dynamic/dynamic_island_stopwatch_data_model.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late Duration _duration = Duration.zero;
  bool _isPaused = false;
  bool _isStarted = false;
  double _percentComplete = 0.0;
  Timer? _timer;
  final DynamicIslandManager diManager = DynamicIslandManager(channelKey: 'DI');
  // Live Activity variables
  bool _isLiveActivityRunning = false;
  Timer? _liveActivityTimer;
  int _liveActivitySeconds = 0;

  void _startLiveActivity() {
    setState(() {
      _isLiveActivityRunning = true;
    });

    // Invoking startLiveActivity Method
    diManager.startLiveActivity(
      jsonData: DynamicIslandStopwatchDataModel(elapsedSeconds: 0).toMap(),
    );

    _liveActivityTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _liveActivitySeconds++;
      });

      // Invoking the updateLiveActivity Method
      diManager.updateLiveActivity(
        jsonData: DynamicIslandStopwatchDataModel(
          elapsedSeconds: _liveActivitySeconds,
        ).toMap(),
      );
    });
  }

  void _stopLiveActivity() {
    _liveActivityTimer?.cancel();
    setState(() {
      _liveActivitySeconds = 0;
      _isLiveActivityRunning = false;
    });

    // Invoking the stopLiveActivity Method
    diManager.stopLiveActivity();
  }

  void _startTimer() {
    if (_duration.inSeconds == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No time has been set.'),
        ),
      );
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_duration.inSeconds == 0) {
            timer.cancel();
            _isStarted = false;
          } else {
            _duration = Duration(seconds: _duration.inSeconds - 1);
            _percentComplete = 1.0 -
                (_duration.inSeconds / _duration.inSeconds.ceilToDouble());

            // Check if live activity is not running and start it
            if (!_isLiveActivityRunning) {
              _startLiveActivity();
            }
          }
        });
      });
    }
  }

  void _pauseTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      setState(() {
        _isPaused = true;
      });
    }
  }

  void _stopTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    setState(() {
      _isPaused = false;
      _isStarted = false;
      _duration = const Duration();
      _percentComplete = 0.0;
    });
  }

  void _setTimer(Duration duration) {
    if (duration.inSeconds == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No time has been set.'),
        ),
      );
    } else {
      setState(() {
        _duration = duration;
        _isStarted = true;
        _isPaused = false;
        _percentComplete = 0.0;
      });
      _startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              ' ',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            !_isStarted
                ? CupertinoTimerPicker(
                    mode: CupertinoTimerPickerMode.hms,
                    onTimerDurationChanged: (duration) {
                      _duration = duration;
                    },
                  )
                : CircularPercentIndicator(
                    radius: MediaQuery.of(context).size.width * 0.6,
                    lineWidth: 10.0,
                    percent: _percentComplete,
                    center: Text(
                      '${_duration.inHours.toString().padLeft(2, '0')}:${(_duration.inMinutes % 60).toString().padLeft(2, '0')}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}',
                      style: const TextStyle(fontSize: 40),
                    ),
                    progressColor: Colors.pink,
                  ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _isStarted && !_isPaused
                    ? ElevatedButton(
                        onPressed: _pauseTimer,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(120, 48),
                        ),
                        child: const Text(
                          'Pause',
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () => _setTimer(_duration),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(120, 48),
                        ),
                        child: Text(
                          _isPaused ? 'Resume' : 'Start',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                ElevatedButton(
                  onPressed: _isStarted ? _stopTimer : null,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(120, 48),
                  ),
                  child: const Text(
                    'Stop',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/

//fix
//circular percent indicator works
//live activty works
/*
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:prodeck/pages/task_page.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'dynamic/dynamic_island_manager.dart';
import 'dynamic/dynamic_island_stopwatch_data_model.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late Duration _duration = Duration.zero;
  bool _isPaused = false;
  bool _isStarted = false;
  double _percentComplete = 0.0;
  Timer? _timer;
  final DynamicIslandManager diManager = DynamicIslandManager(channelKey: 'DI');
  // Live Activity variables
  bool _isLiveActivityRunning = false;
  Timer? _liveActivityTimer;
  int _liveActivitySeconds = 0;
  Duration _elapsedDuration = Duration.zero;

  void _startLiveActivity() {
    setState(() {
      _isLiveActivityRunning = true;
    });

    // Invoking startLiveActivity Method
    diManager.startLiveActivity(
      jsonData: DynamicIslandStopwatchDataModel(elapsedSeconds: 0).toMap(),
    );

    _liveActivityTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _liveActivitySeconds++;
      });

      // Invoking the updateLiveActivity Method
      diManager.updateLiveActivity(
        jsonData: DynamicIslandStopwatchDataModel(
          elapsedSeconds: _liveActivitySeconds,
        ).toMap(),
      );
    });
  }

  void _stopLiveActivity() {
    _liveActivityTimer?.cancel();
    setState(() {
      _liveActivitySeconds = 0;
      _isLiveActivityRunning = false;
    });

    // Invoking the stopLiveActivity Method
    diManager.stopLiveActivity();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedDuration = Duration(seconds: _elapsedDuration.inSeconds + 1);
        _percentComplete = _elapsedDuration.inSeconds / _duration.inSeconds;

        // Check if live activity is not running and start it
        if (!_isLiveActivityRunning) {
          _startLiveActivity();
        }
      });
    });
  }

  void _pauseTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      setState(() {
        _isPaused = true;
      });
    }
  }

  void _stopTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    setState(() {
      _isPaused = false;
      _isStarted = false;
      _duration = const Duration();
      _percentComplete = 0.0;
    });
  }

  void _setTimer(Duration duration) {
    if (duration.inSeconds == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No time has been set.'),
        ),
      );
    } else {
      setState(() {
        _duration = duration;
        _isStarted = true;
        _isPaused = false;
        _elapsedDuration = const Duration();
        _percentComplete = 0.0;
      });
      _startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              ' ',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            !_isStarted
                ? CupertinoTimerPicker(
                    mode: CupertinoTimerPickerMode.hms,
                    onTimerDurationChanged: (duration) {
                      _duration = duration;
                    },
                  )
                : CircularPercentIndicator(
                    radius: MediaQuery.of(context).size.width * 0.6,
                    lineWidth: 10.0,
                    percent: _percentComplete,
                    center: Text(
                      '${_duration.inHours.toString().padLeft(2, '0')}:${(_duration.inMinutes % 60).toString().padLeft(2, '0')}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}',
                      style: const TextStyle(fontSize: 40),
                    ),
                    progressColor: Colors.pink,
                  ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _isStarted && !_isPaused
                    ? ElevatedButton(
                        onPressed: _pauseTimer,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(120, 48),
                        ),
                        child: const Text(
                          'Pause',
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () => _setTimer(_duration),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(120, 48),
                        ),
                        child: Text(
                          _isPaused ? 'Resume' : 'Start',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                ElevatedButton(
                  onPressed: _isStarted ? _stopTimer : null,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(120, 48),
                  ),
                  child: const Text(
                    'Stop',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/

//fix 2
//live activity and timer works fine
/*
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'dynamic/dynamic_island_manager.dart';
import 'dynamic/dynamic_island_stopwatch_data_model.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late Duration _duration = Duration.zero;
  bool _isPaused = false;
  bool _isStarted = false;
  double _percentComplete = 0.0;
  Timer? _timer;
  Duration _elapsedDuration = Duration.zero;

  final DynamicIslandManager diManager = DynamicIslandManager(channelKey: 'DI');
  // Live Activity variables
  bool _isLiveActivityRunning = false;
  Timer? _liveActivityTimer;
  int _liveActivitySeconds = 0;

  void _startLiveActivity() {
    setState(() {
      _isLiveActivityRunning = true;
    });

    // Invoking startLiveActivity Method
    diManager.startLiveActivity(
      jsonData: DynamicIslandStopwatchDataModel(elapsedSeconds: 0).toMap(),
    );

    _liveActivityTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _liveActivitySeconds++;
      });

      // Invoking the updateLiveActivity Method
      diManager.updateLiveActivity(
        jsonData: DynamicIslandStopwatchDataModel(
          elapsedSeconds: _liveActivitySeconds,
        ).toMap(),
      );
    });
  }

  void _stopLiveActivity() {
    _liveActivityTimer?.cancel();
    setState(() {
      _liveActivitySeconds = 0;
      _isLiveActivityRunning = false;
    });

    // Invoking the stopLiveActivity Method
    diManager.stopLiveActivity();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_elapsedDuration.inSeconds >= _duration.inSeconds) {
          timer.cancel();
          _isStarted = false;
        } else {
          _elapsedDuration = Duration(seconds: _elapsedDuration.inSeconds + 1);
          _percentComplete = _elapsedDuration.inSeconds / _duration.inSeconds;

          // Check if live activity is not running and start it
          if (!_isLiveActivityRunning) {
            _startLiveActivity();
          }
        }
      });
    });
  }

  void _pauseTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      setState(() {
        _isPaused = true;
      });
    }
  }

  void _stopTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    setState(() {
      _isPaused = false;
      _isStarted = false;
      _duration = const Duration();
      _percentComplete = 0.0;
      _stopLiveActivity();
    });
  }

  void _setTimer(Duration duration) {
    if (duration.inSeconds == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No time has been set.'),
        ),
      );
    } else {
      setState(() {
        _duration = duration;
        _isStarted = true;
        _isPaused = false;
        _elapsedDuration = const Duration();
        _percentComplete = 0.0;
      });
      _startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            !_isStarted
                ? CupertinoTimerPicker(
                    mode: CupertinoTimerPickerMode.hms,
                    onTimerDurationChanged: (duration) {
                      _duration = duration;
                    },
                  )
                : CircularPercentIndicator(
                    radius: MediaQuery.of(context).size.width * 0.6,
                    lineWidth: 10.0,
                    percent: _percentComplete,
                    center: Text(
                      '${_elapsedDuration.inHours.toString().padLeft(2, '0')}:${(_elapsedDuration.inMinutes % 60).toString().padLeft(2, '0')}:${(_elapsedDuration.inSeconds % 60).toString().padLeft(2, '0')}',
                      style: const TextStyle(fontSize: 40),
                    ),
                    progressColor: Colors.pink,
                  ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _isStarted && !_isPaused
                    ? ElevatedButton(
                        onPressed: _pauseTimer,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(120, 48),
                        ),
                        child: const Text(
                          'Pause',
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () => _setTimer(_duration),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(120, 48),
                        ),
                        child: Text(
                          _isPaused ? 'Resume' : 'Start',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                ElevatedButton(
                  onPressed: _isStarted ? _stopTimer : null,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(120, 48),
                  ),
                  child: const Text(
                    'Stop',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/

//fix 3
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'dynamic/dynamic_island_manager.dart';
import 'dynamic/dynamic_island_stopwatch_data_model.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late Duration _duration = Duration.zero;
  bool _isPaused = false;
  bool _isStarted = false;
  double _percentComplete = 0.0;
  Timer? _timer;
  Duration _elapsedDuration = Duration.zero;
  Duration _pausedDuration = Duration.zero;

  final DynamicIslandManager diManager = DynamicIslandManager(channelKey: 'DI');
  bool _isLiveActivityRunning = false;
  Timer? _liveActivityTimer;
  int _liveActivitySeconds = 0;

  void _startLiveActivity() {
    setState(() {
      _isLiveActivityRunning = true;
    });

    // Invoking startLiveActivity Method
    diManager.startLiveActivity(
      jsonData: DynamicIslandStopwatchDataModel(elapsedSeconds: 0).toMap(),
    );

    _liveActivityTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _liveActivitySeconds++;
      });

      // Invoking the updateLiveActivity Method
      diManager.updateLiveActivity(
        jsonData: DynamicIslandStopwatchDataModel(
          elapsedSeconds: _liveActivitySeconds,
        ).toMap(),
      );
    });
  }

  void _stopLiveActivity() {
    _liveActivityTimer?.cancel();
    setState(() {
      _liveActivitySeconds = 0;
      _isLiveActivityRunning = false;
    });

    // Invoking the stopLiveActivity Method
    diManager.stopLiveActivity();
  }

  void _pauseTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      _pausedDuration = _elapsedDuration; // Store the paused time
      setState(() {
        _isPaused = true;
      });
    }
  }

  void _resumeTimer() {
    setState(() {
      _isPaused = false;
    });
    _startTimerFromPaused();
  }

  void _startTimerFromPaused() {
    final pausedSeconds = _pausedDuration.inSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if ((_elapsedDuration + Duration(seconds: pausedSeconds)).inSeconds >=
            _duration.inSeconds) {
          timer.cancel();
          _isStarted = false;
        } else {
          _elapsedDuration = _elapsedDuration + Duration(seconds: 1);

          if (!_isPaused) {
            _percentComplete = (_elapsedDuration.inSeconds + pausedSeconds) /
                _duration.inSeconds;
          }

          // Check if live activity is not running and start it
          if (!_isLiveActivityRunning) {
            _startLiveActivity();
          }
        }
      });
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_elapsedDuration.inSeconds >= _duration.inSeconds) {
          timer.cancel();
          _isStarted = false;
        } else {
          _elapsedDuration = Duration(seconds: _elapsedDuration.inSeconds + 1);
          _percentComplete = _elapsedDuration.inSeconds / _duration.inSeconds;

          // Check if live activity is not running and start it
          if (!_isLiveActivityRunning) {
            _startLiveActivity();
          }
        }
      });
    });
  }

  void _stopTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    setState(() {
      _isPaused = false;
      _isStarted = false;
      _duration = const Duration();
      _percentComplete = 0.0;
      _stopLiveActivity();
    });
  }

  void _setTimer(Duration duration) {
    if (duration.inSeconds == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No time has been set.'),
        ),
      );
    } else {
      setState(() {
        _duration = duration;
        _isStarted = true;
        _isPaused = false;
        _elapsedDuration = const Duration();
        _percentComplete = 0.0;
      });
      _startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            !_isStarted
                ? CupertinoTimerPicker(
                    mode: CupertinoTimerPickerMode.hms,
                    onTimerDurationChanged: (duration) {
                      _duration = duration;
                    },
                  )
                : CircularPercentIndicator(
                    radius: MediaQuery.of(context).size.width * 0.6,
                    lineWidth: 10.0,
                    percent: _percentComplete,
                    center: Text(
                      '${_elapsedDuration.inHours.toString().padLeft(2, '0')}:${(_elapsedDuration.inMinutes % 60).toString().padLeft(2, '0')}:${(_elapsedDuration.inSeconds % 60).toString().padLeft(2, '0')}',
                      style: const TextStyle(fontSize: 40),
                    ),
                    progressColor: Colors.pink,
                  ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _isStarted && !_isPaused
                    ? ElevatedButton(
                        onPressed: _pauseTimer,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(120, 48),
                        ),
                        child: const Text(
                          'Pause',
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: _isPaused
                            ? _resumeTimer
                            : () => _setTimer(_duration),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(120, 48),
                        ),
                        child: Text(
                          _isPaused ? 'Resume' : 'Start',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                ElevatedButton(
                  onPressed: _isStarted ? _stopTimer : null,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(120, 48),
                  ),
                  child: const Text(
                    'Stop',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
