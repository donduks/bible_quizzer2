import 'package:bible_quizzer/constants.dart';
import 'package:bible_quizzer/first_page.dart';

import 'package:flutter/material.dart';

import 'topaz_home.dart';

class TopazPassed extends StatelessWidget {
  const TopazPassed({super.key});

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
                    marks3.toString(),
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
                  'CONGRATULATIONS',
                  style: kLargText,
                ),
              ),
              kHeigthBox2,
              Text('YOU PASSED ', style: kLargerText),
              kHeigthBox2,
              Container(
                height: 250,
                width: 250,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('images/happy.png'),
                )),
              ),
              kHeigthBox2,
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FirstPage()));
                  reset();
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Text(
                    'Home',
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
