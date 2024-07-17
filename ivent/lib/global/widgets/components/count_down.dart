import 'package:flutter/material.dart';
import 'dart:async';

class CountdownTimer extends StatefulWidget {
  final DateTime eventStartTime;

  CountdownTimer({required this.eventStartTime});

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Timer _timer;
  late Duration _remainingTime;
  bool _eventStarted = false;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.eventStartTime.difference(DateTime.now());
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _remainingTime = widget.eventStartTime.difference(DateTime.now());
        if (_remainingTime.isNegative) {
          _eventStarted = true;
          _remainingTime = DateTime.now().difference(widget.eventStartTime);
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _eventStarted
          ? "Event has started since ${_remainingTime.inHours} hours ${_remainingTime.inMinutes.remainder(60)} minutes ${_remainingTime.inSeconds.remainder(60)} seconds"
          : "Starts in ${_remainingTime.inHours.remainder(24)} hours ${_remainingTime.inMinutes.remainder(60)} minutes ${_remainingTime.inSeconds.remainder(60)} seconds",
      style: TextStyle(fontSize: 16),
    );
  }
}
