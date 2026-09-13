// features/movies/domain/repo/movie_repo.dart
import 'package:dart_either/dart_either.dart';
import 'package:movie_platform_app/core/networking/failure.dart';
import 'package:movie_platform_app/features/movies/data/models/movie_model.dart';
import 'package:movie_platform_app/features/movies/data/models/review_model.dart';
import 'package:movie_platform_app/features/movies/data/models/review_request.dart';
import 'package:movie_platform_app/features/movies/data/models/review_status_model.dart';
import 'package:movie_platform_app/features/movies/data/models/watch_movie_response.dart';

abstract class MovieRepo {
  Future<Either<Failure,List<MovieModel>>>GetMovie();
  Future<Either<Failure, WatchMovieResponse>> watchMovie(int movieId);
  Future<Either<Failure, List<ReviewModel>>> getMovieReviews(int movieId);

Future<Either<Failure, ReviewModel>> addReview(ReviewRequest request,int movieId);

Future<Either<Failure, ReviewStatusModel>> getReviewStatus(int movieId);

Future<Either<Failure, bool>> deleteReview(int movieId);

  
}