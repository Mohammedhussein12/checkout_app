import 'package:checkout_app/core/error/failure.dart';
import 'package:checkout_app/features/checkout/data/stripe_models/payment_intent_input_model.dart';
import 'package:dartz/dartz.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  });
}
