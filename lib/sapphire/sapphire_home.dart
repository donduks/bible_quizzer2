import 'package:bible_quizzer/first_page.dart';
import 'package:bible_quizzer/sapphire/sapphire_answers.dart';
import 'package:bible_quizzer/sapphire/sapphire_brain.dart';
import 'package:bible_quizzer/sapphire/sapphire_fail.dart';
import 'package:bible_quizzer/sapphire/sapphire_pass.dart';
import 'package:bible_quizzer/sapphire/sapphire_timer.dart';
import 'package:flutter/material.dart';

import '../diamond/diamond1.dart';
import '../home_page.dart';

int marks2 = 0;
String remark2 = '';
var timer2 = const Timer2();

bool answerWasSelected = false;
int questionIndex = 0;
bool end = false;
bool correctAnswerSelected = false;

void reset() {
  marks2 = 0;
  questionIndex = 0;
  end = false;
}

class SapphireHome extends StatefulWidget {
  const SapphireHome({super.key});

  @override
  State<SapphireHome> createState() => _SapphireHomeState();
}

class _SapphireHomeState extends State<SapphireHome> {
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
          marks2 = marks2 + 2;
          remark2 = 'Correct you got 2 points!';
          //player.play(AssetSource('cheers.mp3'));
        } else {
          marks2--;
          correctAnswerSelected = false;
          remark2 = 'Wrong you lost 1 point!';
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
                color: Colors.teal[400],
                child: const Center(
                  child: Text(
                    'SAPPHIRE',
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
                    child: timer2,
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(remark2),
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: CircleAvatar(
                      backgroundColor: Colors.teal[400],
                      radius: 30,
                      child: Text(
                        marks2.toString(),
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
                    color: Colors.teal[400],
                    borderRadius: BorderRadius.circular(10)),
                height: 100,
                width: 300,
                child: Center(
                  child: Text(
                    questions[questionIndex]['question'].toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ...(questions[questionIndex]['answers']
                      as List<Map<String, Object>>)
                  .map(
                (answer) => Answers(
                  answerText: answer['answerText'].toString(),
                  answerColor: answerWasSelected
                      ? answer['score'] as bool
                          ? Colors.green
                          : Colors.white
                      : Colors.white,
                  answerTaped: () {
                    if (answerWasSelected) {
                      return;
                    }

                    questionAnswered(answer['score'] as bool);
                  },
                ),
              ),
              SizedBox(
                height: 15,
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
                    if (questionIndex == questions.length && marks2 < 19) {
                      questionIndex = 0;

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SapphireFailed()));
                    } else if (questionIndex == questions.length &&
                        marks2 >= 19) {
                      questionIndex = 0;

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SapphirePassed()));
                    }
                  });
                },
                child: Text('Next Question'),
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FirstPage()));
                  reset1();
                  reset();
                },
                label: Text('Restart'),
                backgroundColor: Colors.teal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
