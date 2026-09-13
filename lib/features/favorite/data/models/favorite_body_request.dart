// features/favorite/data/models/favorite_body_request.dart
class FavoriteBodyRequest {
  final int movieId;

  FavoriteBodyRequest({
    required this.movieId,
  });

  factory FavoriteBodyRequest.fromJson(Map<String, dynamic> json) {
    return FavoriteBodyRequest(
      movieId: json['movieId'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'movieId': movieId,
    };
  }
}