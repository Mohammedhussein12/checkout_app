import 'package:checkout_app/core/utils/api_keys.dart';
import 'package:checkout_app/core/utils/api_service.dart';
import 'package:checkout_app/features/checkout/data/stripe_models/create_customer_input_model.dart';
import 'package:checkout_app/features/checkout/data/stripe_models/customer_model.dart';
import 'package:checkout_app/features/checkout/data/stripe_models/ephemeral_key_model.dart';
import 'package:checkout_app/features/checkout/data/stripe_models/init_payment_sheet_input_model.dart';
import 'package:checkout_app/features/checkout/data/stripe_models/payment_intent_input_model.dart';
import 'package:checkout_app/features/checkout/data/stripe_models/payment_intent_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final apiService = ApiService();

  Future<CustomerModel> createCustomer({
    required CreateCustomerInputModel createCustomerInputModel,
  }) async {
    final response = await apiService.post(
      url: 'https://api.stripe.com/v1/customers',
      contentType: Headers.formUrlEncodedContentType,
      body: {
        'name': createCustomerInputModel.name,
      },
      token: ApiKeys.stripeSecretKey,
    );
    return CustomerModel.fromJson(response.data);
  }

  Future<PaymentIntentModel> createPaymentIntent({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    final response = await apiService.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      contentType: Headers.formUrlEncodedContentType,
      body: paymentIntentInputModel.toJson(),
      token: ApiKeys.stripeSecretKey,
    );
    return PaymentIntentModel.fromJson(response.data);
  }

  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    final response = await apiService.post(
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      contentType: Headers.formUrlEncodedContentType,
      body: {'customer': customerId},
      headers: {
        'Stripe-Version': '2025-06-30.basil',
        'Authorization': 'Bearer ${ApiKeys.stripeSecretKey}',
      },
      token: ApiKeys.stripeSecretKey,
    );
    return EphemeralKeyModel.fromJson(response.data);
  }

  Future<void> initPaymentSheet({
    required InitPaymentSheetInputModel initPaymentSheetInputModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'mohammed hussein',
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
      ),
    );
  }

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    var ephemeralKeyModel = await createEphemeralKey(
      customerId: paymentIntentInputModel.customerId,
    );
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      clientSecret: paymentIntentModel.clientSecret!,
      customerId: paymentIntentInputModel.customerId,
      ephemeralKeySecret: ephemeralKeyModel.secret!,
    );
    await initPaymentSheet(
      initPaymentSheetInputModel: initPaymentSheetInputModel,
    );
    await displayPaymentSheet();
  }
}
