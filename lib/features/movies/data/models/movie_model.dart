// features/movies/data/models/movie_model.dart

class MovieModel {
  final int id;
  final String name;
  final String ageRating;
  final String mainImage;
  final List<String> images;
  final List<CategoryModel> categories;
  final List<ActorModel> actors;
  final String description;
  final String releaseDate;
  final String duration;
  final String movieUrl;
  final bool isExclusive;
  final double? price;
  final bool hasAccess;

  MovieModel({
    required this.id,
    required this.name,
    required this.ageRating,
    required this.mainImage,
    required this.images,
    required this.categories,
    required this.actors,
    required this.description,
    required this.releaseDate,
    required this.duration,
    required this.movieUrl,
    required this.isExclusive,
    required this.price,
    required this.hasAccess,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? 0,

      name: json['name'] ?? '',

      ageRating: json['ageRating'] ?? '',

      mainImage: json['mainImage'] ?? '',

      images: List<String>.from(
        json['images'] ?? [],
      ),

      categories: (json['categories'] as List? ?? [])
          .map(
            (category) => CategoryModel.fromJson(category),
          )
          .toList(),

      actors: (json['actors'] as List? ?? [])
          .map(
            (actor) => ActorModel.fromJson(actor),
          )
          .toList(),

      description: json['description'] ?? '',

      releaseDate: json['releaseDate'] ?? '',

      duration: json['duration'] ?? '',

      movieUrl: json['movieUrl'] ?? '',

      isExclusive: json['isExclusive'] ?? false,

      price: json['price'] != null
          ? (json['price'] as num).toDouble()
          : null,

      hasAccess: json['hasAccess'] ?? false,
    );
  }
}

class CategoryModel {
  final int categoryId;
  final String name;
  final String mainImage;

  CategoryModel({
    required this.categoryId,
    required this.name,
    required this.mainImage,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['category_Id'] ?? 0,
      name: json['name'] ?? '',
      mainImage: json['mainImage'] ?? '',
    );
  }
}

class ActorModel {
  final int actorId;
  final String firstName;
  final String lastName;
  final String mainImage;

  ActorModel({
    required this.actorId,
    required this.firstName,
    required this.lastName,
    required this.mainImage,
  });

  factory ActorModel.fromJson(Map<String, dynamic> json) {
    return ActorModel(
      actorId: json['actorId'] ?? 0,
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      mainImage: json['mainImage'] ?? '',
    );
  }
}