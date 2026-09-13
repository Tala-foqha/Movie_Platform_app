// features/cart/data/models/cart_body_request.dart
class CartBodyRequest {
  final int MovieId;

  CartBodyRequest({required this.MovieId});



 factory CartBodyRequest.fromJson(Map<String, dynamic> json) {
    return CartBodyRequest(
      MovieId: json['MovieId'] as int,
     
    );
  }
  
  /// Method: يحوّل Object → Map (JSON)
  Map<String, dynamic> toJson() {
    return {'MovieId': MovieId,};
  }
}