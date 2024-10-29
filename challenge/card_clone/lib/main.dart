import 'package:flutter/material.dart';
import 'package:card_clone/widgets/round_card.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override // 위젯을 리턴함
  Widget build(BuildContext context) {
    return MaterialApp(
      // 두가지 중 and ios 중 스타일 선택 MaterialApp or CupertinoApp
      home: Scaffold(
        backgroundColor: const Color(0xFF1F1F1F),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.account_circle_rounded,
                          color: Colors.white,
                          size: 88,
                        ),
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 40,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'MONDAY 16',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, top: 10),
                child: const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        'TODAY ',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(
                        Icons.circle,
                        color: Color(0xFFB22580),
                        size: 15,
                      ),
                      Text(
                        ' 17 ',
                        style: TextStyle(
                          color: Color(0xFF8E8E8E),
                          fontFamily: 'Roboto',
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '18 ',
                        style: TextStyle(
                          color: Color(0xFF8E8E8E),
                          fontFamily: 'Roboto',
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '19 ',
                        style: TextStyle(
                          color: Color(0xFF8E8E8E),
                          fontFamily: 'Roboto',
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '20 ',
                        style: TextStyle(
                          color: Color(0xFF8E8E8E),
                          fontFamily: 'Roboto',
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '21 ',
                        style: TextStyle(
                          color: Color(0xFF8E8E8E),
                          fontFamily: 'Roboto',
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '22 ',
                        style: TextStyle(
                          color: Color(0xFF8E8E8E),
                          fontFamily: 'Roboto',
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  RoundCard(
                    fromMonth: '11',
                    fromDay: '30',
                    toMonth: '12',
                    toDay: '20',
                    title: 'DESIGN\nMEETING',
                    background: Colors.yellow,
                    discription: Row(
                      children: [
                        const SizedBox(
                          width: 54,
                        ),
                        Text(
                          'ALEX',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          'HELENA',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                        const SizedBox(
                          width: 45,
                        ),
                        Text(
                          'NANA',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RoundCard(
                    fromMonth: '12',
                    fromDay: '35',
                    toMonth: '14',
                    toDay: '10',
                    title: 'DAILY\nPROJECT',
                    background: Colors.pink.shade200,
                    discription: Row(
                      children: [
                        const SizedBox(
                          width: 54,
                        ),
                        const Text(
                          'ME',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          'RICHARD',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          'CIRY',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                        const SizedBox(
                          width: 45,
                        ),
                        Text(
                          '+4',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RoundCard(
                    fromMonth: '15',
                    fromDay: '00',
                    toMonth: '16',
                    toDay: '30',
                    title: 'WEEKLY\nPLANNING',
                    background: const Color(0xFFbcee4b),
                    discription: Row(
                      children: [
                        const SizedBox(
                          width: 54,
                        ),
                        Text(
                          'DEN',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          'NANA',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                        const SizedBox(
                          width: 45,
                        ),
                        Text(
                          'MARK',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
