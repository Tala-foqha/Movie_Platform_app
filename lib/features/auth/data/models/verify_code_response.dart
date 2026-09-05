// features/auth/data/models/verify_code_response.dart

class VerifyCodeResponse {
 
  final String message;
 

  VerifyCodeResponse({
    
    required this.message,

  });

  factory VerifyCodeResponse.fromJson(Map<String, dynamic> json) {
    return VerifyCodeResponse(
     
      message: json['message'] as String,
   
    );
  }

  

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }

  @override
  String toString() {
    return 'SignupResponse(message: $message)';
  }
}