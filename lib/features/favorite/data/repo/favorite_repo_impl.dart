// features/favorite/data/repo/favorite_repo_impl.dart

import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:movie_platform_app/core/networking/api_constant.dart';
import 'package:movie_platform_app/core/networking/api_service.dart';
import 'package:movie_platform_app/core/networking/failure.dart';
import 'package:movie_platform_app/features/favorite/data/models/favorite_body_request.dart';
import 'package:movie_platform_app/features/favorite/data/models/favorite_response.dart';
import 'package:movie_platform_app/features/favorite/data/models/is_favorite_response.dart';
import 'package:movie_platform_app/features/favorite/domain/repo/favorite_repo.dart';

class FavoriteRepoImpl extends FavoriteRepo {
  final ApiServices apiServices;

  FavoriteRepoImpl({
    required this.apiServices,
  });

  @override
  Future<Either<Failure, FavoriteResponse?>> toggleFavorite(
    FavoriteBodyRequest request,
  ) async {
    try {
      final data = await apiServices.post(
        endPoint: ApiConstants.toogleFav,
        data: request.toJson(),
      );

      // Add Favorite
      if (data is Map<String, dynamic>) {
        return Right(
          FavoriteResponse.fromJson(data),
        );
      }

      // Remove Favorite
      return const Right(null);
    } on DioException catch (e) {
      return Left(
        ServerFailure.fromDioError(e),
      );
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, IsFavoriteResponse>> isFav(
    int movieId,
  ) async {
    try {
      final data = await apiServices.get(
        endPoint: '${ApiConstants.isFav}/$movieId',
      );

      return Right(
        IsFavoriteResponse.fromJson(data),
      );
    } on DioException catch (e) {
      return Left(
        ServerFailure.fromDioError(e),
      );
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<FavoriteResponse>>> GetUserFav()async {
     try {
      final data = await apiServices.get(
        endPoint: ApiConstants.getUserFav,
      );

      final List favoritesJson = data['date'] ?? [];

    final favorites = favoritesJson

        .map(

          (favorite) => FavoriteResponse.fromJson(

            favorite,

          ),

        )

        .toList();

    return Right(favorites);
    } on DioException catch (e) {
      return Left(
        ServerFailure.fromDioError(e),
      );
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
}