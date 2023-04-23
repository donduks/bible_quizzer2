import 'package:bible_quizzer/diamond/dia_failled.dart';
import 'package:bible_quizzer/diamond/dia_passed.dart';
import 'package:bible_quizzer/diamond/diamond_ans.dart';
import 'package:bible_quizzer/diamond/diamond_time.dart';
import 'package:flutter/material.dart';

Brain brain = Brain();
int marks = 0;
var timerDia = const DiamondTimer();
void reset1() {
  marks = 0;
  brain.reset();
}

class Diamond1 extends StatefulWidget {
  const Diamond1({super.key});

  @override
  State<Diamond1> createState() => _Diamond1State();
}

class _Diamond1State extends State<Diamond1> {
  String remark = '';

  void checkAnswer(bool userPicked) {
    setState(() {
      dynamic correctAnswer = brain.getAnswer();

      if (brain.isFinished() == true && marks >= 19) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const DiaPassed()));

        remark = '';
      } else if (brain.isFinished() == true && marks < 19) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const DiaFaild()));

        remark = '';
      } else {
        if (userPicked == correctAnswer) {
          marks = marks + 2;
          remark = 'Correct!  2 points';
        } else {
          marks--;
          remark = 'Wrong! you loss 1 point';
        }
        brain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50),
              height: 70,
              width: double.infinity,
              color: Colors.teal[400],
              child: const Center(
                child: Text(
                  'DIAMOND',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 35),
                  height: 100,
                  width: 100,
                  child: timerDia,
                ),
                SizedBox(
                  child: Text(remark),
                  width: 170,
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: CircleAvatar(
                    backgroundColor: Colors.teal[400],
                    radius: 30,
                    child: Text(
                      marks.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                  color: Colors.teal[400],
                  borderRadius: BorderRadius.circular(10)),
              height: 150,
              width: 300,
              child: Center(
                child: Text(
                  brain.getQuestions(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                checkAnswer(true);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                height: 50,
                width: 300,
                child: const Center(
                  child: Text(
                    'true',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                checkAnswer(false);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                height: 50,
                width: 300,
                child: const Center(
                  child: Text(
                    'false',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
