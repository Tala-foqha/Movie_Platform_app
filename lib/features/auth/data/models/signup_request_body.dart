// features/auth/data/models/signup_request_body.dart
class SignupRequestBody {
  final String Email;
  final String Password;
  final String PhoneNumber;
  final String FullName;
  final String UserName;


  SignupRequestBody( {
    required this.Email,
    required this.FullName,
    required this.UserName,
    required this.PhoneNumber,
    required this.Password,
  });
   /// Factory constructor: يحوّل Map (JSON) → Object
  factory SignupRequestBody.fromJson(Map<String, dynamic> json) {
    return SignupRequestBody(
     
     
   
      Email: json['Email'] as String,
      Password: json['Password'] as String, 
      FullName: json['FullName'] as String,
       UserName: json['UserName'] as String,
       PhoneNumber: json['PhoneNumber'] as String,
    );
  }
  
  /// Method: يحوّل Object → Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'Email': Email,
      'Password': Password,
      'PhoneNumber': PhoneNumber,
      'FullName': FullName,
      'UserName': UserName,
    };
  }
}