// features/movies/data/models/review_status_model.dart
class ReviewStatusModel {
  final bool canReview;
  final bool hasReviewed;

  ReviewStatusModel({
    required this.canReview,
    required this.hasReviewed,
  });

  factory ReviewStatusModel.fromJson(Map<String, dynamic> json) {
    return ReviewStatusModel(
      canReview: json['canReview'] ?? false,
      hasReviewed: json['hasReviewed'] ?? false,
    );
  }
}