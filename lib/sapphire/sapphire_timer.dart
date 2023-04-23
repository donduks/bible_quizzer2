import 'package:bible_quizzer/sapphire/sapphire_fail.dart';
import 'package:bible_quizzer/sapphire/sapphire_home.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class Timer2 extends StatefulWidget {
  const Timer2({super.key});

  @override
  State<Timer2> createState() => _Timer2State();
}

class _Timer2State extends State<Timer2> {
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
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SapphireFailed()));
        },
      )),
    );
  }
}
