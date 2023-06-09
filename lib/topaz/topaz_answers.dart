import 'package:flutter/material.dart';

class Answerst extends StatelessWidget {
  final String answerText;
  final Color answerColor;
  final Function answerTaped;

  Answerst(
      {required this.answerText,
      required this.answerColor,
      required this.answerTaped});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: answerTaped as void Function()?,
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          color: answerColor,
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
