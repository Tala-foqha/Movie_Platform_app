// features/movies/presentation/maneger/reviews/reviews_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_platform_app/features/movies/data/models/review_model.dart';
import 'package:movie_platform_app/features/movies/data/models/review_request.dart';
import 'package:movie_platform_app/features/movies/data/models/review_status_model.dart';
import 'package:movie_platform_app/features/movies/domain/use_case/movie_use_case.dart';
part 'reviews_state.dart';
class ReviewsCubit extends Cubit<ReviewsState> {
  final MovieUseCase movieUseCase;
  ReviewsCubit(this.movieUseCase) : super(ReviewsInitial());
  // Get Reviews + Review Status
  Future<void> getMovieReviews(int movieId) async {
    emit(ReviewsLoading());
    final reviewsResult = await movieUseCase.getMovieReviews(movieId);
    reviewsResult.fold(
      ifLeft: (failure) {
        emit(
          ReviewsFailure(
            message: failure.message,
          ),
        );
      },
      ifRight: (reviews) async {
        // Get review status
        final statusResult =
            await movieUseCase.getReviewStatus(movieId);
        statusResult.fold(
          ifLeft: (failure) {
            emit(
              ReviewsFailure(
                message: failure.message,
              ),
            );
          },
          ifRight: (status) {
            emit(
              ReviewsSuccess(
                reviews: reviews,
                canReview: status.canReview,
                hasReviewed: status.hasReviewed,
              ),
            );
          },
        );
      },
    );
  }
  // Add Review
  Future<void> addReview(
    ReviewRequest request,
    int movieId,
  ) async {
    emit(AddReviewLoading());
    final result = await movieUseCase.addReview(
      request,
      movieId,
    );
    result.fold(
      ifLeft: (failure) {
        emit(
          AddReviewFailure(
            message: failure.message,
          ),
        );
      },
      ifRight: (review)async {
        emit(
          AddReviewSuccess(
            review: review,
          ),

        );
        // Refresh reviews + status after adding
     await   getMovieReviews(movieId);
      },
    );
  }
  // Get Review Status
  Future<void> getReviewStatus(int movieId) async {
    emit(ReviewStatusLoading());
    final result = await movieUseCase.getReviewStatus(movieId);
    result.fold(
      ifLeft: (failure) {
        emit(
          ReviewStatusFailure(
            message: failure.message,
          ),
        );
      },
      ifRight: (status) {
        emit(
          ReviewStatusSuccess(
            status: status,
          ),
        );
      },
    );
  }
  // Delete Review
  Future<void> deleteReview(int movieId) async {
    emit(DeleteReviewLoading());
    final result = await movieUseCase.deleteReview(movieId);
    result.fold(
      ifLeft: (failure) {
        emit(
          DeleteReviewFailure(
            message: failure.message,
          ),
        );
      },
      ifRight: (_) {
        emit(DeleteReviewSuccess());
        // Refresh reviews + status after deleting
        getMovieReviews(movieId);
      },
    );
  }
}