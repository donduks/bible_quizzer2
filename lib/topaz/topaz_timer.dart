import 'package:bible_quizzer/sapphire/sapphire_fail.dart';
import 'package:bible_quizzer/sapphire/sapphire_home.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

import 'topaz_fail.dart';

class TopazTimer extends StatefulWidget {
  const TopazTimer({super.key});

  @override
  State<TopazTimer> createState() => _TopazTimerState();
}

class _TopazTimerState extends State<TopazTimer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CircularCountDownTimer(
        duration: 45,
        initialDuration: 2,
        controller: CountDownController(),
        width: MediaQuery.of(context).size.width / 8,
        height: MediaQuery.of(context).size.height / 8,
        ringColor: Colors.white70,
        ringGradient: null,
        fillColor: Colors.black,
        fillGradient: null,
        backgroundColor: Colors.white70,
        isReverse: true,
        isReverseAnimation: false,
        isTimerTextShown: true,
        autoStart: true,
        onComplete: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const TopazFailed()));
        },
      )),
    );
  }
}
