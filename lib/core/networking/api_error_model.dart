// core/networking/api_error_model.dart
class ApiErrorModel {
  final String? message;
  final int? code;

  ApiErrorModel({required this.message, required this.code});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      message: json['message'] as String?,
      code: json['code'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'code': code};
  }

  @override
  String toString() => 'ApiErrorModel(message: $message, code: $code)';
}
