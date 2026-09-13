// features/movies/domain/use_case/movie_use_case.dart

import 'package:dart_either/dart_either.dart';
import 'package:movie_platform_app/core/networking/failure.dart';
import 'package:movie_platform_app/features/movies/data/models/movie_model.dart';
import 'package:movie_platform_app/features/movies/data/models/review_model.dart';
import 'package:movie_platform_app/features/movies/data/models/review_request.dart';
import 'package:movie_platform_app/features/movies/data/models/review_status_model.dart';
import 'package:movie_platform_app/features/movies/data/models/watch_movie_response.dart';
import 'package:movie_platform_app/features/movies/domain/repo/movie_repo.dart';

class MovieUseCase extends UseCase<List<MovieModel>, NoParam> {
  final MovieRepo movieRepo;

  MovieUseCase({required this.movieRepo});

  @override
  Future<Either<Failure, List<MovieModel>>> call(NoParam param) {
    return movieRepo.GetMovie();
  }

  // Watch Movie
  Future<Either<Failure, WatchMovieResponse>> watchMovie(
    int movieId,
  ) {
    return movieRepo.watchMovie(movieId);
  }

  // Get Movie Reviews
  Future<Either<Failure, List<ReviewModel>>> getMovieReviews(
    int movieId,
  ) {
    return movieRepo.getMovieReviews(movieId);
  }

  // Add Review
  Future<Either<Failure, ReviewModel>> addReview(
    ReviewRequest request,
    int movieId,
  ) {
    return movieRepo.addReview(request, movieId);
  }

  // Get Review Status
  Future<Either<Failure, ReviewStatusModel>> getReviewStatus(
    int movieId,
  ) {
    return movieRepo.getReviewStatus(movieId);
  }

  // Delete Review
  Future<Either<Failure, bool>> deleteReview(
    int movieId,
  ) {
    return movieRepo.deleteReview(movieId);
  }
}

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call(Param param);
}

class NoParam {}