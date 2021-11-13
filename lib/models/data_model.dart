class Movie {
  final String? posterPath;
  final String? title;
  final String? voteAverage;

  Movie({
    this.posterPath,
    this.title,
    this.voteAverage,
  });

  factory Movie.formJson(Map<String, dynamic> json) {
    return Movie(
      posterPath: json['poster_path'],
      title: json['title'],
      voteAverage: json['vote_average'].toString(),
    );
  }
}
