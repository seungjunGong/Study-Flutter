import 'package:flutter/material.dart';

class RoundCard extends StatelessWidget {
  final String fromMonth, fromDay, toMonth, toDay;
  final String title;
  final Color background;
  final Row discription;

  const RoundCard(
      {super.key,
      required this.fromMonth,
      required this.fromDay,
      required this.toMonth,
      required this.toDay,
      required this.title,
      required this.background,
      required this.discription});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, bottom: 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      fromMonth,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      fromDay,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      '|',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Text(
                      toMonth,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      toDay,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    height: 1,
                    fontSize: 56,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            discription,
          ],
        ),
      ),
    );
  }
}
