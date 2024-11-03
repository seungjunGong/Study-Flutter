import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/services/api_service.dart';
import 'package:movieflix/widgets/movie_widget.dart';
import 'package:movieflix/widgets/popular_movie_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<MoviePopularModel>> popularMovies =
      ApiService.getPopularMovies();
  final Future<List<MovieModel>> nowMovies = ApiService.getNowMovies();
  final Future<List<MovieModel>> comingMovies = ApiService.getComingMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Column(
            children: [
              SizedBox(
                height: 280,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Popular Movies",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    FutureBuilder(
                      future: popularMovies,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Expanded(child: makePopularMovies(snapshot));
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 325,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Now in Cinemas",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    FutureBuilder(
                      future: nowMovies,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Expanded(child: makeMoviesAndTitle(snapshot));
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 325,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Coming soon",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    FutureBuilder(
                      future: comingMovies,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Expanded(child: makeMoviesAndTitle(snapshot));
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView makePopularMovies(AsyncSnapshot<List<MoviePopularModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return PopularMovie(
          imageUrl: movie.imageUrl,
          id: movie.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 15),
    );
  }

  ListView makeMoviesAndTitle(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return Movie(
          imageUrl: movie.imageUrl,
          id: movie.id,
          title: movie.title,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 15),
    );
  }
}
