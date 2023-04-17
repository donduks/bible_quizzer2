import 'package:bible_quizzer/sapphire/sapphire_timer.dart';
import 'package:flutter/material.dart';

int marks2 = 0;
String remark2 = '';
final timer2 = const Timer2();

class SapphireHome extends StatefulWidget {
  const SapphireHome({super.key});

  @override
  State<SapphireHome> createState() => _SapphireHomeState();
}

class _SapphireHomeState extends State<SapphireHome> {
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
                    'LEVEL 02',
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
                height: 50,
                width: 1000,
                color: Colors.brown[50],
                child: Center(
                  child: Text(
                    '',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w800,
                        fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
