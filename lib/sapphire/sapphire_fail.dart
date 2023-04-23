import 'package:bible_quizzer/constants.dart';
import 'package:bible_quizzer/sapphire/sapphire_home.dart';
import 'package:flutter/material.dart';

class SapphireFailed extends StatelessWidget {
  const SapphireFailed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 70),
                height: 70,
                width: double.infinity,
                color: Colors.teal[400],
                child: Center(
                  child: Text(
                    'You point ${marks2.toString()} is less than 19',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              kHeigthBox2,
              Container(
                child: Text(
                  'OOPS',
                  style: kLargText,
                ),
              ),
              kHeigthBox2,
              Text('YOU FAILED ', style: kLargerText),
              kHeigthBox2,
              Container(
                height: 250,
                width: 250,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('images/sad.png'),
                )),
              ),
              kHeigthBox2,
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SapphireHome()));
                  reset();
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                      child: Text(
                    'RESTART QUIZ',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
