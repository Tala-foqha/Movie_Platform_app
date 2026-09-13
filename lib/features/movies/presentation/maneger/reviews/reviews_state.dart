// features/movies/presentation/maneger/reviews/reviews_state.dart
part of 'reviews_cubit.dart';

abstract class ReviewsState {}

class ReviewsInitial extends ReviewsState {}

// Get Reviews

class ReviewsLoading extends ReviewsState {}
class ReviewsSuccess extends ReviewsState {
  final List<ReviewModel> reviews;
  final bool canReview;
  final bool hasReviewed;

  ReviewsSuccess({
    required this.reviews,
    required this.canReview,
    required this.hasReviewed,
  });
}

class ReviewsFailure extends ReviewsState {
  final String message;

  ReviewsFailure({
    required this.message,
  });
}

// Add Review

class AddReviewLoading extends ReviewsState {}

class AddReviewSuccess extends ReviewsState {
  final ReviewModel review;

  AddReviewSuccess({
    required this.review,
  });
}

class AddReviewFailure extends ReviewsState {
  final String message;

  AddReviewFailure({
    required this.message,
  });
}

// Review Status

class ReviewStatusLoading extends ReviewsState {}

class ReviewStatusSuccess extends ReviewsState {
  final ReviewStatusModel status;

  ReviewStatusSuccess({
    required this.status,
  });
}

class ReviewStatusFailure extends ReviewsState {
  final String message;

  ReviewStatusFailure({
    required this.message,
  });
}

// Delete Review

class DeleteReviewLoading extends ReviewsState {}

class DeleteReviewSuccess extends ReviewsState {}

class DeleteReviewFailure extends ReviewsState {
  final String message;

  DeleteReviewFailure({
    required this.message,
  });
}