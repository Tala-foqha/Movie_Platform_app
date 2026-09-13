// features/search/domain/repo/search_repo.dart
import 'package:dart_either/dart_either.dart';
import 'package:movie_platform_app/core/networking/failure.dart';
import 'package:movie_platform_app/features/movies/data/models/movie_model.dart';

abstract class SearchRepo {
  Future<Either<Failure,List<MovieModel>>>serchMovie(String movieName);
}