// features/movies/data/models/review_model.dart
class ReviewModel {
  final int? id;
  final String? comment;
  final String? userName;
  final int? movieId;
  final String? movieTitle;
  final String? status;
  final DateTime? createdAt;

  ReviewModel({
    this.id,
    this.comment,
    this.userName,
    this.movieId,
    this.movieTitle,
    this.status,
    this.createdAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      comment: json['comment'],
      userName: json['userName'],
      movieId: json['movieId'],
      movieTitle: json['movieTitle'],
      status: json['status'],
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
    );
  }
}