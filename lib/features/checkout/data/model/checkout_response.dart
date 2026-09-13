// features/checkout/data/model/checkout_response.dart
class CheckoutResponse {
  final int orderId;
  final String? stripeUrl;
  final bool success;
  final String? error;

  CheckoutResponse({
    required this.orderId,
    required this.stripeUrl,
    required this.success,
    required this.error,
  });

  factory CheckoutResponse.fromJson(Map<String, dynamic> json) {
    return CheckoutResponse(
      orderId: json['orderId'] ?? 0,
      stripeUrl: json['stripeUrl'],
      success: json['success'] ?? false,
      error: json['error'],
    );
  }
}