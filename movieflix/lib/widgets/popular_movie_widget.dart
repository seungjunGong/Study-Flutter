import 'package:flutter/material.dart';
import 'package:movieflix/screens/detail_screen.dart';

class PopularMovie extends StatelessWidget {
  const PopularMovie({
    super.key,
    required this.imageUrl,
    required this.id,
  });

  final String imageUrl;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = const Offset(0.0, 1.0);
              var end = Offset.zero;
              var curve = Curves.ease;
              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            pageBuilder: (context, anmation, secondaryAnimation) =>
                DetailScreen(
              id: id,
            ),
          ),
        );
      },
      child: Container(
        width: 300,
        clipBehavior: Clip.hardEdge,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
          BoxShadow(
            blurRadius: 5,
            // 그림자 위치 지정
            offset: const Offset(5, 5),
            color: Colors.black.withOpacity(0.5),
          ),
        ]),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
