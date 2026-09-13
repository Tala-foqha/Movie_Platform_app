// features/favorite/data/models/is_favorite_response.dart
class IsFavoriteResponse {
  final int movieId;
  final bool isFavorite;

  IsFavoriteResponse({
    required this.movieId,
    required this.isFavorite,
  });

  factory IsFavoriteResponse.fromJson(Map<String, dynamic> json) {
    return IsFavoriteResponse(
      movieId: json['movieId'],
      isFavorite: json['isFavorite'],
    );
  }
}