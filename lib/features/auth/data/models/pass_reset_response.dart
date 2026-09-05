// features/auth/data/models/pass_reset_response.dart
class PassResetResponse {
  final String message;
  final bool success;

  PassResetResponse({required this.message, required this.success});
factory PassResetResponse.fromJson(Map<String, dynamic> json) {
    return PassResetResponse(
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
    return 'PassResetResponse(message: $message, success: $success)';
  }
}