import 'package:bible_quizzer/sapphire/sapphire_answers.dart';
import 'package:bible_quizzer/sapphire/sapphire_brain.dart';
import 'package:bible_quizzer/sapphire/sapphire_timer.dart';
import 'package:flutter/material.dart';

int marks2 = 0;
String remark2 = '';
var timer2 = const Timer2();

class SapphireHome extends StatefulWidget {
  const SapphireHome({super.key});

  @override
  State<SapphireHome> createState() => _SapphireHomeState();
}

class _SapphireHomeState extends State<SapphireHome> {
  String? scores;
  int questionIndex = 0;
  bool answerWasSelected = false;

  bool end = false;
  bool correctAnswerSelected = false;

  void reset() {
    setState(() {
      questionIndex = 0;
      answerWasSelected = false;
      correctAnswerSelected = false;

      marks2;
      end = false;
    });
  }

  void questionAnswered(bool answerScore) {
    setState(
      () {
        answerWasSelected = true;
        correctAnswerSelected = true;
        if (answerScore) {
          marks2 = marks2 + 2;
          //player.play(AssetSource('cheers.mp3'));
        } else {
          marks2--;
          correctAnswerSelected = false;
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
                margin: const EdgeInsets.only(top: 50),
                height: 70,
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
                    child: Text(remark2),
                    width: 170,
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
                      answerTaped: (){
                        if (answerWasSelected) {
                    return;
                  }

                  questionAnswered(answer['score'] as bool);
                      },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {},
                child: Text('Next Question'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
