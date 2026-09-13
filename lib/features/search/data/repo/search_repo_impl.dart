// features/search/data/repo/search_repo_impl.dart
import 'package:dart_either/src/dart_either.dart';
import 'package:movie_platform_app/core/networking/api_constant.dart';
import 'package:movie_platform_app/core/networking/api_service.dart';
import 'package:movie_platform_app/core/networking/failure.dart';
import 'package:movie_platform_app/features/movies/data/models/movie_model.dart';
import 'package:movie_platform_app/features/search/domain/repo/search_repo.dart';

class SearchRepoImpl  extends SearchRepo{
  final ApiServices apiServices;

  SearchRepoImpl({required this.apiServices});
  @override
  Future<Either<Failure, List<MovieModel>>> serchMovie(String movieName)async {
    try{
      final response=await apiServices.get(endPoint: '${ApiConstants.getMovie}?Search=$movieName',);
    final List<dynamic> data = response['data']['data'];

    final movies = data
        .map((movie) => MovieModel.fromJson(movie))
        .toList();

    return Right(movies);
  } catch (e) {
    return Left(ServerFailure(e.toString()));
  }
  }
}