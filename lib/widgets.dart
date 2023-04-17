import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget(
      {super.key,
      required this.text,
      required this.text2,
      required this.color,
      required this.onTap,
      required this.decoration});

  final Text text;
  final Text text2;
  final Color color;
  final Function() onTap;
  final BoxDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 20),
        height: 130,
        width: 150,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 8, left: 10),
              child: text,
            ),
            Container(
                padding: const EdgeInsets.only(top: 2, left: 10), child: text2),
            Container(
              margin: const EdgeInsets.only(left: 60),
              height: 80,
              width: 80,
              decoration: decoration,
            ),
          ],
        ),
      ),
    );
  }
}
