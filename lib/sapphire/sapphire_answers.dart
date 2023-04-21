import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final String answerText;
  final Color answerColor;

  Answers({required this.answerText, required this.answerColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          color: answerColor,
          border: Border.all(color: Colors.teal),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          answerText,
          style: TextStyle(fontSize: 13),
        ),
      ),
    );
  }
}
