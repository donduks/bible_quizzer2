import 'package:bible_quizzer/diamond/diamond1.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class DiamondTimer extends StatefulWidget {
  const DiamondTimer({super.key});

  @override
  State<DiamondTimer> createState() => _DiamondTimerState();
}

class _DiamondTimerState extends State<DiamondTimer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CircularCountDownTimer(
        duration: 60,
        initialDuration: 2,
        controller: CountDownController(),
        width: MediaQuery.of(context).size.width / 8,
        height: MediaQuery.of(context).size.height / 8,
        ringColor: Colors.grey[300]!,
        ringGradient: null,
        fillColor: Colors.red,
        fillGradient: null,
        backgroundColor: Colors.white,
        isReverse: true,
        isReverseAnimation: false,
        isTimerTextShown: true,
        autoStart: true,
        onComplete: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Diamond1()));
              reset1();
        },
      )),
    );
  }
}
