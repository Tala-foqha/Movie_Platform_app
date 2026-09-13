// features/movies/data/models/category_model.dart
class CategoryModel {
  final int Category_Id;
  final String Name;
  final String MainImage;



  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      Category_Id: json['Category_Id'],
      Name: json['Name'],
         MainImage: json['MainImage'],
    );
  }

  CategoryModel({required this.Category_Id, required this.Name, required this.MainImage});
}