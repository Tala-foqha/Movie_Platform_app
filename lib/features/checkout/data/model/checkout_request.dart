// features/checkout/data/model/checkout_request.dart
class CheckoutRequest {
  final int paymentMethod;

  CheckoutRequest({
    required this.paymentMethod,
  });

  Map<String, dynamic> toJson() {
    return {
      'PaymentMethod': paymentMethod,
    };
  }
}