import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.episode,
    required this.webtoonId,
  });

  final String webtoonId;
  final WebtoonEpisodeModel episode;

  onButtonTap() async {
    await launchUrlString(
        "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.green.shade400,
            width: 2,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              // 그림자 위치 지정
              offset: const Offset(1, 1),
              color: Colors.black.withOpacity(0.5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                episode.title,
                style: TextStyle(
                  color: Colors.green.shade400,
                  fontSize: 16,
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: Colors.green.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
