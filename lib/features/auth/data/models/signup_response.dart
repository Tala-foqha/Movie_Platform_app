// features/auth/data/models/signup_response.dart
class SignupResponse {
  final String? error;
  final String message;
  final bool success;

  SignupResponse({
    required this.error,
    required this.message,
    required this.success,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return SignupResponse(
      error: json['error'] as String,
      message: json['message'] as String,
      success: json['success'] as bool,
    );
  }

  

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'message': message,
      'success': success,
    };
  }

  @override
  String toString() {
    return 'SignupResponse(error: $error, message: $message, success: $success)';
  }
}