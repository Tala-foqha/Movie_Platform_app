// features/auth/data/models/reset_new_password_response.dart

class ResetNewPasswordResponse {
  final String message;
  final bool success;

  ResetNewPasswordResponse({required this.message, required this.success});
factory ResetNewPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ResetNewPasswordResponse(
      message: json['message'] as String,
      success: json['success'] as bool,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'success': success,
    };
  }
  @override
  String toString() {
    return 'ResetNewPasswordResponse(message: $message, success: $success)';
  }
}