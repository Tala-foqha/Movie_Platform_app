// features/cart/presentation/manager/cart/cart_state.dart
part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}
class CartLoading extends CartState {}
class CartFailure extends CartState {
  final String message;

  CartFailure({required this.message});


}
class CartSuccess extends CartState {
  final CartResponse cartResponse;

  CartSuccess({required this.cartResponse});

}
class GetCartLoading extends CartState {}
class GetCartFailure extends CartState {
  final String message;

  GetCartFailure({required this.message});

}
class GetCartSuccess extends CartState {
  final List<CartResponse>carts;
  final double totalPrice;

  GetCartSuccess(this.totalPrice, {required this.carts});


}

class DeleteCartSuccess extends CartState {
}

  class DeleteCartLoading extends CartState {
  }
class DeleteCartFailure extends CartState {
  final String message;

  DeleteCartFailure({required this.message});

}













