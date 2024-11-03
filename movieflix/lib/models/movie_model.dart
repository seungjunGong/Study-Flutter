class MoviePopularModel {
  final int id;
  final String imageUrl;

  MoviePopularModel.fromJsom(Map<String, dynamic> json)
      : id = json['id'],
        imageUrl = "https://image.tmdb.org/t/p/w500${json['backdrop_path']}";
}

class MovieModel {
  final int id;
  final String imageUrl, title;

  MovieModel.fromJsom(Map<String, dynamic> json)
      : id = json['id'],
        imageUrl = "https://image.tmdb.org/t/p/w500${json['backdrop_path']}",
        title = json['title'];
}
