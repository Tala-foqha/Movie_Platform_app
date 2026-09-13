// features/cart/presentation/manager/cart/cart_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_platform_app/features/cart/data/models/cart_body_request.dart';
import 'package:movie_platform_app/features/cart/data/models/cart_response.dart';
import 'package:movie_platform_app/features/cart/domain/usecase/cart_use_case.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartUseCase) : super(CartInitial());
  final CartUseCase cartUseCase;
  double totalPrice=0;
  Future<void>addMovieToCart(int movieId)async{
    emit(CartLoading());
    final result=await cartUseCase.call(
      CartBodyRequest(
      MovieId: movieId));
      result.fold(ifLeft: (failure){
        emit(CartFailure(message: failure.message));

      }, ifRight: (success){
        emit(CartSuccess(cartResponse: success));

      });

  }
  Future<void>getCartMovie()async{
    emit(GetCartLoading());
    final result=await cartUseCase.getMovieCart();
    result.fold(ifLeft: (failure){
      emit(GetCartFailure(message: failure.message));
    }, ifRight: (success){
      totalPrice=success.fold(0,(sum,cart)=>
        sum+(cart!.movie.price??0)
      );
       emit(GetCartSuccess(carts: success,totalPrice));
    });
  }
 Future<void> deletMovieFromCart(int movieId) async {
  emit(DeleteCartLoading());

  final result = await cartUseCase.deletMovieFromCart(
    movieId,
  );

  result.fold(
    ifLeft: (failure) {
      emit(DeleteCartFailure(message: failure.message));
    },
    ifRight: (_) {
      emit(DeleteCartSuccess());
    },
  );
}

  
}
