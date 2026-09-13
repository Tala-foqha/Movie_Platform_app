// features/search/data/model/recent_movie_model.dart
class RecentMovieModel {
  final int id;
  final String name;
  final String mainImage;

  RecentMovieModel({
    required this.id,
    required this.name,
    required this.mainImage,
  });

  factory RecentMovieModel.fromJson(Map<String, dynamic> json) {
    return RecentMovieModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      mainImage: json['mainImage'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'mainImage': mainImage,
    };
  }
}