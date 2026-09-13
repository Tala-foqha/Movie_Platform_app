// features/checkout/domain/usecase/checkout_usecase.dart

import 'package:dart_either/dart_either.dart';
import 'package:movie_platform_app/core/networking/failure.dart';
import 'package:movie_platform_app/features/checkout/data/model/checkout_request.dart';
import 'package:movie_platform_app/features/checkout/data/model/checkout_response.dart';
import 'package:movie_platform_app/features/checkout/domain/repo/checkout_repo.dart';


class CheckoutUsecase
    extends UseCase<CheckoutResponse, CheckoutRequest> {
  final CheckoutRepo checkoutRepo;

  CheckoutUsecase({required this.checkoutRepo});

  @override
  Future<Either<Failure, CheckoutResponse>> call(
    CheckoutRequest param,
  ) {
    return checkoutRepo.checkout(param);
  }

    }

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call(Param param);
}

class NoParam {}