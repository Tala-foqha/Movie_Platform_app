// features/checkout/presentation/manager/checkout/checkout_state.dart
part of 'checkout_cubit.dart';

@immutable
abstract class CheckoutState {}

class CheckoutInitial extends CheckoutState {}
class CheckoutLoading extends CheckoutState {}
class CheckoutSuccess extends CheckoutState {
  final CheckoutResponse checkoutResponse;

  CheckoutSuccess({required this.checkoutResponse});

}
class CheckoutFailure extends CheckoutState 
{
  final String message;

  CheckoutFailure({required this.message});

}






