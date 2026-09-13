// features/favorite/domain/repo/favorite_repo.dart
import 'package:dart_either/dart_either.dart';
import 'package:movie_platform_app/core/networking/failure.dart';
import 'package:movie_platform_app/features/favorite/data/models/favorite_body_request.dart';
import 'package:movie_platform_app/features/favorite/data/models/favorite_response.dart';
import 'package:movie_platform_app/features/favorite/data/models/is_favorite_response.dart';

abstract class FavoriteRepo {
  Future<Either<Failure,FavoriteResponse?>>toggleFavorite(FavoriteBodyRequest request);
  Future<Either<Failure,IsFavoriteResponse>>isFav(int movieId);
  Future<Either<Failure,List<FavoriteResponse>>>GetUserFav();

}