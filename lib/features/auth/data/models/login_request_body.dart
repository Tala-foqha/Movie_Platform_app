// features/auth/data/models/login_request_body.dart
class LoginRequestBody {
  final String Email;
  final String Password;

  LoginRequestBody({
    required this.Email,
    required this.Password,
  });
   /// Factory constructor: يحوّل Map (JSON) → Object
  factory LoginRequestBody.fromJson(Map<String, dynamic> json) {
    return LoginRequestBody(
      Email: json['Email'] as String,
      Password: json['Password'] as String,
    );
  }
  
  /// Method: يحوّل Object → Map (JSON)
  Map<String, dynamic> toJson() {
    return {'Email': Email, 'Password': Password};
  }
}