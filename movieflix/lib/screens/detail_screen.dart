import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_detail_model.dart';
import 'package:movieflix/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final int id;

  const DetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieDetailModel> movie;

  @override
  void initState() {
    super.initState();
    movie = ApiService.getMovieById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<MovieDetailModel>(
        future: movie,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return const Center(child: Text("No data available"));
          }

          final movieData = snapshot.data!;

          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(movieData.poster),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(
                              Icons.arrow_back_ios_sharp,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "Back to list",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 200),
                      Text(
                        movieData.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      StarRating(rating: movieData.rating),
                      const SizedBox(height: 10),
                      Text(
                        "${movieData.runtime ~/ 60}h ${movieData.runtime % 60}min | ${movieData.genres.join(", ")}",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        "Storyline",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            movieData.overview,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 80,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text(
                            "Buy ticket",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final double rating;

  const StarRating({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    int fullStars = (rating / 2).floor();
    bool hasHalfStar = ((rating / 2) - fullStars) >= 0.5;

    return Row(
      children: [
        for (var i = 0; i < fullStars; i++)
          const Icon(Icons.star, color: Colors.yellow, size: 24),
        if (hasHalfStar)
          const Icon(Icons.star_half, color: Colors.yellow, size: 24),
        for (var i = 0; i < (5 - fullStars - (hasHalfStar ? 1 : 0)); i++)
          const Icon(Icons.star_border, color: Colors.yellow, size: 24),
        const SizedBox(width: 8),
        Text(
          '${(rating / 2).toStringAsFixed(1)} / 5.0',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
