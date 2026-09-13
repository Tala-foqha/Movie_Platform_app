// features/checkout/domain/repo/checkout_repo.dart
import 'package:dart_either/dart_either.dart';
import 'package:movie_platform_app/core/networking/failure.dart';
import 'package:movie_platform_app/features/checkout/data/model/checkout_request.dart';
import 'package:movie_platform_app/features/checkout/data/model/checkout_response.dart';

abstract class CheckoutRepo {

  Future<Either<Failure,CheckoutResponse>>checkout(CheckoutRequest request);

}