// features/favorite/data/models/favorite_response.dart
import 'package:movie_platform_app/features/movies/data/models/movie_model.dart';

class FavoriteResponse {
  final String userName;
  final int favId;
  final String createdAt;
  final MovieModel movie;

  FavoriteResponse({
    required this.userName,
    required this.favId,
    required this.createdAt,
    required this.movie,
  });

  factory FavoriteResponse.fromJson(Map<String, dynamic> json) {
    return FavoriteResponse(
      userName: json['userName'] ?? '',
      favId: json['favId'] ?? 0,
      createdAt: json['createdAt'] ?? '',
      movie: MovieModel.fromJson(
        json['movie'] ?? {},
      ),
    );
  }

  
  }
