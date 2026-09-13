// features/movies/data/models/review_request.dart

class ReviewRequest {
  final int movieId;
  final String comment;

  ReviewRequest({
    required this.movieId,
    required this.comment,
  });

  Map<String, dynamic> toJson() {
    return {
      'MovieId': movieId,
      'Comment': comment,
    };
  }
}