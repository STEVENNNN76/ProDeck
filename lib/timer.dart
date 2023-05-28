import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_circular_progress_indicator/flutter_circular_progress_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:prodeck/pages/task_page.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
