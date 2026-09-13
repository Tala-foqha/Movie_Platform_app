// features/checkout/presentation/manager/checkout/checkout_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_platform_app/core/networking/failure.dart';
import 'package:movie_platform_app/features/checkout/data/model/checkout_request.dart';
import 'package:movie_platform_app/features/checkout/data/model/checkout_response.dart';
import 'package:movie_platform_app/features/checkout/domain/usecase/checkout_usecase.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.checkoutUsecase) : super(CheckoutInitial());
final CheckoutUsecase checkoutUsecase;
Future<void>checkout()async{
  emit(CheckoutLoading());
  final result=await checkoutUsecase.call(CheckoutRequest(paymentMethod: 1

  ));
  result.fold(ifLeft: (failure){
    emit(CheckoutFailure(message: failure.message));
  }, ifRight: (success){
    emit(CheckoutSuccess(checkoutResponse: success));

  });
}
  
}
