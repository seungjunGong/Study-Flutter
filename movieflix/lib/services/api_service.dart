import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieflix/models/movie_detail_model.dart';
import 'package:movieflix/models/movie_model.dart';

typedef ID = int;
typedef Imageurl = String;

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";

  static const String popular = "popular";
  static const String now = "now-playing";
  static const String coming = "coming-soon";

  static Future<List<MoviePopularModel>> getPopularMovies() async {
    final url = Uri.parse('$baseUrl/$popular');
    final response = await http.get(url);

    if (response.statusCode != 200) throw Error();

    final decodedData = json.decode(response.body);
    final List<dynamic> movies = decodedData['results'];

    return movies.map((movie) => MoviePopularModel.fromJsom(movie)).toList();
  }

  static Future<List<MovieModel>> getNowMovies() async {
    final url = Uri.parse('$baseUrl/$now');
    final response = await http.get(url);

    if (response.statusCode != 200) throw Error();

    final decodedData = json.decode(response.body);
    final List<dynamic> movies = decodedData['results'];

    return movies.map((movie) => MovieModel.fromJsom(movie)).toList();
  }

  static Future<List<MovieModel>> getComingMovies() async {
    final url = Uri.parse('$baseUrl/$coming');
    final response = await http.get(url);

    if (response.statusCode != 200) throw Error();

    final decodedData = json.decode(response.body);
    final List<dynamic> movies = decodedData['results'];

    return movies.map((movie) => MovieModel.fromJsom(movie)).toList();
  }

  static Future<MovieDetailModel> getMovieById(int id) async {
    final url = Uri.parse("$baseUrl/movie?id=$id");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      return MovieDetailModel.fromJson(movie);
    }
    throw Error();
  }
}
