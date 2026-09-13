// features/cart/domain/repo/cart_repo.dart
import 'package:dart_either/dart_either.dart';
import 'package:movie_platform_app/core/networking/failure.dart';
import 'package:movie_platform_app/features/cart/data/models/cart_body_request.dart';
import 'package:movie_platform_app/features/cart/data/models/cart_response.dart';

abstract class CartRepo {
  Future<Either<Failure,CartResponse>>addMovieToCart(CartBodyRequest request);
Future<Either<Failure, void>> deleteMovieFromCart(int movieId);
  Future<Either<Failure,List<CartResponse>>>GetCartMovie();

}