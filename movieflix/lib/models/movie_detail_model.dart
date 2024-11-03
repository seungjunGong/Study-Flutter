class MovieDetailModel {
  final String poster, title, overview;
  final double rating;
  final int runtime;
  final List<String> genres;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : poster = "https://image.tmdb.org/t/p/w500${json['poster_path']}",
        title = json['title'],
        overview = json['overview'],
        rating = json['vote_average']?.toDouble() ?? 0.0, // null 대비 기본값 설정
        runtime = json['runtime'],
        genres = (json['genres'] as List<dynamic>)
            .map((genre) => genre['name'] as String)
            .toList();
}
