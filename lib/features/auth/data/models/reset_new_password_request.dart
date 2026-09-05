// features/auth/data/models/reset_new_password_request.dart
class ResetNewPasswordRequest {
 final String Email;
 final String Code;
 final String NewPassword;

 
   factory ResetNewPasswordRequest.fromJson(Map<String, dynamic> json) {
    return ResetNewPasswordRequest(
      Email: json['Email'] as String, 
      Code: json['Code'] as String,
       NewPassword: json['NewPassword'] as String,
    );}

  ResetNewPasswordRequest({required this.Email, required this.Code, required this.NewPassword});

     
   

  Map<String, dynamic> toJson() {
    return {
      'Email': Email,
      'Code':Code,
      'NewPassword':NewPassword
    };
  }
}