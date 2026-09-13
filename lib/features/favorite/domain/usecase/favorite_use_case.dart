// features/favorite/domain/usecase/favorite_use_case.dart

import 'package:dart_either/dart_either.dart';
import 'package:movie_platform_app/core/networking/failure.dart';
import 'package:movie_platform_app/features/favorite/data/models/favorite_body_request.dart';
import 'package:movie_platform_app/features/favorite/data/models/favorite_response.dart';
import 'package:movie_platform_app/features/favorite/data/models/is_favorite_response.dart';
import 'package:movie_platform_app/features/favorite/domain/repo/favorite_repo.dart';

class FavoriteUseCase
    extends UseCase<FavoriteResponse?, FavoriteBodyRequest> {
  final FavoriteRepo favoriteRepo;

  FavoriteUseCase({required this.favoriteRepo});

  @override
  Future<Either<Failure, FavoriteResponse?>> call(
    FavoriteBodyRequest param,
  ) {
    return favoriteRepo.toggleFavorite(param);
  }

  Future<Either<Failure, IsFavoriteResponse>> isFav(
    int movieId,
  ) {
    return favoriteRepo.isFav(movieId);
  }
  Future<Either<Failure,List<FavoriteResponse>>>getUserFav(){
    return favoriteRepo.GetUserFav();
  }
}

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call(Param param);
}

class NoParam {}