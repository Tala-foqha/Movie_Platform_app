// features/cart/domain/usecase/cart_use_case.dart
import 'package:dart_either/dart_either.dart';
import 'package:movie_platform_app/core/networking/failure.dart';
import 'package:movie_platform_app/features/cart/data/models/cart_body_request.dart';
import 'package:movie_platform_app/features/cart/data/models/cart_response.dart';
import 'package:movie_platform_app/features/cart/domain/repo/cart_repo.dart';

class CartUseCase extends UseCase <CartResponse, CartBodyRequest> {
 final  CartRepo cartRepo;

  CartUseCase({required this.cartRepo});
  @override
  Future<Either<Failure,CartResponse >> call(param) {
    return cartRepo.addMovieToCart(param);
  }
   Future<Either<Failure,List<CartResponse> >> getMovieCart() {
    return cartRepo.GetCartMovie();
  }
Future<Either<Failure, void>> deletMovieFromCart(int movieId) {
  return cartRepo.deleteMovieFromCart(movieId);
}

}



abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call(Param param);
}

class NoParam {}