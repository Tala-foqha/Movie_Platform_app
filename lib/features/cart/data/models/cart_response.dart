// features/cart/data/models/cart_response.dart
import 'package:movie_platform_app/features/movies/data/models/movie_model.dart';

class CartResponse {
  final int id;
  final int movieId;
  final MovieModel movie;

  CartResponse({
    required this.id,
    required this.movieId,
    required this.movie,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      id: json['id'] as int,
      movieId: json['movieId'] as int,
      movie: MovieModel.fromJson(
        json['movie'] as Map<String, dynamic>,
      ),
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'movieId': movieId,
  //     'movie': movie.toJson(),
  //   };
  // }
}