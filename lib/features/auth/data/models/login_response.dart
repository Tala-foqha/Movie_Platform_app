// features/auth/data/models/login_response.dart
class LoginResponse {
  final String accessToken;
  final String message;
  final bool success;

  LoginResponse({
    required this.accessToken,
    required this.message,
    required this.success,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['accessToken'] as String,
      message: json['message'] as String,
      success: json['success'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'message': message,
      'success': success,
    };
  }

  @override
  String toString() {
    return 'LoginResponse(accessToken: $accessToken, message: $message, success: $success)';
  }
}