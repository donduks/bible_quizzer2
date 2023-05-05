import 'package:bible_quizzer/constants.dart';
import 'package:bible_quizzer/diamond/diamond1.dart';
import 'package:bible_quizzer/sapphire/sapphire_home.dart';

import 'package:bible_quizzer/widgets.dart';
import 'package:flutter/material.dart';

import 'topaz/topaz_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentIndex == 0
          ? Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 90),
                  padding: const EdgeInsets.all(40),
                  height: 200,
                  width: 350,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                    color: Colors.teal[400],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: const Text(
                    '''FOR GOD SO LOVE THE WORLD THAT HE GAVE HIS ONLY BEGOTTEN SON THAT WHOEVER BELIEVES IN HIM SHOULD NOT PERISH BUT HAVE EVERLASTING LIFE 
            JOHN 3:16''',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 230),
                  child: const Text(
                    'Quiz Classes',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        MyWidget(
                            text: Text(
                              'RUBY',
                              style: kLargeText,
                            ),
                            text2: Text(
                              '4-6',
                              style: kSmallText,
                            ),
                            color: Colors.red,
                            onTap: () {},
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/girl1.png'),
                              ),
                            )),
                      ],
                    ),
                    kWidthBox,
                    Container(
                      child: MyWidget(
                        text: Text(
                          'Diamond',
                          style: kLargeText,
                        ),
                        text2: Text(
                          '7-9',
                          style: kSmallText,
                        ),
                        color: Colors.yellow,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Diamond1()));
                        },
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/ipad.png'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                kHeigthBox,
                Row(
                  children: [
                    MyWidget(
                      text: const Text('Sapphire'),
                      text2: const Text('10-12'),
                      color: Colors.blue,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SapphireHome()));
                      },
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/joy.png'),
                        ),
                      ),
                    ),
                    kWidthBox,
                    MyWidget(
                        text: const Text('Topaz'),
                        text2: const Text('13 + '),
                        color: Colors.brown,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const TopazHome()));
                        },
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/teen.png'),
                          ),
                        ))
                  ],
                ),
              ],
            )
          : const SizedBox(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'chart',
            icon: Icon(Icons.bar_chart),
          ),
          BottomNavigationBarItem(
            label: 'setting',
            icon: Icon(Icons.settings),
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
