// features/movies/data/models/watch_movie_response.dart
class WatchMovieResponse {
  final bool canWatch;
  final String message;
  final String? movieUrl;

  WatchMovieResponse({
    required this.canWatch,
    required this.message,
    required this.movieUrl,
  });

  factory WatchMovieResponse.fromJson(Map<String, dynamic> json) {
    return WatchMovieResponse(
      canWatch: json['canWatch'] ?? false,
      message: json['message'] ?? '',
      movieUrl: json['movieUrl'],
    );
  }
}