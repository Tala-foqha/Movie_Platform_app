// features/movies/data/repo/movie_repo_impl.dart
import 'package:dart_either/src/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:movie_platform_app/core/networking/api_constant.dart';
import 'package:movie_platform_app/core/networking/api_service.dart';
import 'package:movie_platform_app/core/networking/failure.dart';
import 'package:movie_platform_app/features/movies/data/models/movie_model.dart';
import 'package:movie_platform_app/features/movies/data/models/review_model.dart';
import 'package:movie_platform_app/features/movies/data/models/review_request.dart';
import 'package:movie_platform_app/features/movies/data/models/review_status_model.dart';
import 'package:movie_platform_app/features/movies/data/models/watch_movie_response.dart';
import 'package:movie_platform_app/features/movies/domain/repo/movie_repo.dart';

class MovieRepoImpl extends MovieRepo {
 final ApiServices apiServices;

  MovieRepoImpl({required this.apiServices});
  @override
  @override
Future<Either<Failure, List<MovieModel>>> GetMovie() async {
  try {
    final response = await apiServices.get(
      
     endPoint: ApiConstants.getMovie,
    );

    final List<dynamic> data = response['data']['data'];

    final movies = data
        .map((movie) => MovieModel.fromJson(movie))
        .toList();

    return Right(movies);
  } catch (e) {
    return Left(ServerFailure(e.toString()));
  }
}

  @override
  Future<Either<Failure, WatchMovieResponse>> watchMovie(int movieId)async {
   try{

final response=await apiServices.post(endPoint: '${ApiConstants.watchMovie}/$movieId',
 data: {});
 return Right(WatchMovieResponse.fromJson(response));
   }catch (e) {
    return Left(ServerFailure(e.toString()));
  }
  }

  @override
  Future<Either<Failure, ReviewModel>> addReview(ReviewRequest request, int movieId) async{
    try{
      var result=await apiServices.post(endPoint: ApiConstants.addRev, data: request.toJson());
    return Right(ReviewModel.fromJson(result));
   }catch (e) {
    return Left(ServerFailure(e.toString()));
  }
   
  }

  @override
  Future<Either<Failure, bool>> deleteReview(int movieId)async {
   try{
    var result=await apiServices.delete(endPoint: '${ApiConstants.deleteMovieReview}/$movieId');
  return Right(true);
   }catch (e) {
    return Left(ServerFailure(e.toString()));
  }
  }

 Future<Either<Failure, List<ReviewModel>>> getMovieReviews(
  int movieId,
) async {
  try {
    final response = await apiServices.get(
      endPoint: '${ApiConstants.getMovieReview}/$movieId',
    );

    final List<ReviewModel> reviews = (response as List)
        .map(
          (json) => ReviewModel.fromJson(
            json as Map<String, dynamic>,
          ),
        )
        .toList();

    return Right(reviews);
  } catch (e) {
    return Left(
      ServerFailure(e.toString()),
    );
  }
}
  @override
  Future<Either<Failure, ReviewStatusModel>> getReviewStatus(int movieId) async{
    try{
      final response=await apiServices.get(endPoint: '${ApiConstants.getMovieReviewStatus}/$movieId');
      return Right(ReviewStatusModel.fromJson(response));
    } catch(e){
      return Left(ServerFailure(e.toString()));
    }
   
  }
}