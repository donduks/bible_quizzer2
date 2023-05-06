import 'package:bible_quizzer/diamond/diamond1.dart';
import 'package:bible_quizzer/first_page.dart';
import 'package:bible_quizzer/home_page.dart';
import 'package:bible_quizzer/sapphire/sapphire_fail.dart';
import 'package:bible_quizzer/sapphire/sapphire_home.dart';
import 'package:bible_quizzer/second_page.dart';
import 'package:bible_quizzer/topaz/topaz_fail.dart';
import 'package:bible_quizzer/topaz/topaz_home.dart';
import 'package:flutter/material.dart';

import 'sapphire/sapphire_pass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}
