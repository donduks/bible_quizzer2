import 'package:bible_quizzer/first_page.dart';
import 'package:bible_quizzer/topaz/topaz_answers.dart';

import 'package:bible_quizzer/topaz/topaz_brain.dart';
import 'package:bible_quizzer/topaz/topaz_fail.dart';

import 'package:flutter/material.dart';

import '../topaz/topaz_brain.dart';
import 'topaz_pass.dart';
import 'topaz_timer.dart';

int marks3 = 0;
String remark3 = '';
var timer2 = const TopazTimer();

bool answerWasSelected = false;
int questionIndex = 0;
bool end = false;
bool correctAnswerSelected = false;

void reset() {
  marks3 = 0;
  questionIndex = 0;
  end = false;
}

class TopazHome extends StatefulWidget {
  const TopazHome({super.key});

  @override
  State<TopazHome> createState() => _TopazHomeState();
}

class _TopazHomeState extends State<TopazHome> {
  bool answerWasSelected = false;
  int questionIndex = 0;
  bool end = false;
  bool correctAnswerSelected = false;

  void questionAnswered(bool answerScore) {
    setState(
      () {
        answerWasSelected = true;
        correctAnswerSelected = true;
        if (answerScore) {
          marks3 = marks3 + 2;
          remark3 = 'Correct you got 2 points!';
          //player.play(AssetSource('cheers.mp3'));
        } else {
          marks3--;
          correctAnswerSelected = false;
          remark3 = 'Wrong you lost 1 point!';
          // player.play(AssetSource('boo.mp3'));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 40,
                width: double.infinity,
                color: Colors.black,
                child: const Center(
                  child: Text(
                    'TOPAZ',
                    style: TextStyle(
                        color: Colors.white70,
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
                    child: timer2,
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(remark3),
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 30,
                      child: Text(
                        marks3.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
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
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                height: 160,
                width: 300,
                child: Center(
                  child: Text(
                    questionst[questionIndex]['question'].toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ...(questionst[questionIndex]['answers']
                      as List<Map<String, Object>>)
                  .map(
                (answer) => Answerst(
                  answerText: answer['answerText'].toString(),
                  answerColor: answerWasSelected
                      ? answer['score'] as bool
                          ? Colors.green
                          : Colors.white70
                      : Colors.white70,
                  answerTaped: () {
                    if (answerWasSelected) {
                      return;
                    }

                    questionAnswered(answer['score'] as bool);
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    if (!answerWasSelected) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        (const SnackBar(
                          content: Text('Please select an answer'),
                        )),
                      );
                      return;
                    }
                    questionIndex++;
                    correctAnswerSelected = false;

                    answerWasSelected = false;
                    if (questionIndex == questionst.length && marks3 < 19) {
                      questionIndex = 0;

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const TopazFailed()));
                    } else if (questionIndex == questionst.length &&
                        marks3 >= 19) {
                      questionIndex = 0;

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const TopazPassed()));
                    }
                  });
                },
                child: Text(
                  'Next Question',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FirstPage()));

                  reset();
                },
                label: Text('Restart'),
                backgroundColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
