// features/auth/data/models/verify_code_request.dart
import 'package:movie_platform_app/features/auth/data/models/pass_reset_request.dart';

class VerifyCodeRequest {
  final String Code;
  final String Email;

  VerifyCodeRequest({required this.Code, required this.Email});

   factory VerifyCodeRequest.fromJson(Map<String, dynamic> json) {
    return VerifyCodeRequest(
      Email: json['Email'] as String,
       Code: json['Code'] as String,
    );}

     
   

  Map<String, dynamic> toJson() {
    return {
      'Email': Email,
      'Code':Code
    };
  }


}