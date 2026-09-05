// features/auth/data/models/pass_reset_request.dart

// ignore: unused_field
class PassResetRequest {
 final String Email;

  PassResetRequest({required this.Email});
   factory PassResetRequest.fromJson(Map<String, dynamic> json) {
    return PassResetRequest(
      Email: json['Email'] as String,
    );}

     
   

  Map<String, dynamic> toJson() {
    return {
      'Email': Email,
    };
  }
}