import 'package:bible_quizzer/home_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GestureDetector(
            onTap: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
            },
            child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.teal[200],
                  child: Center(
            child: Container(
              padding: EdgeInsets.only(top: 130, left: 40),
              height: 250,
              width: 150,
              color: Colors.white,
              child: Text(
                'b',
                style: TextStyle(color: Colors.teal[200], fontSize: 130),
              ),
            ),
                  ),
                ),
          )),
    );
  }
}
