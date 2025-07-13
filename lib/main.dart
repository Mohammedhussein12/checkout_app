import 'package:checkout_app/core/utils/api_keys.dart';
import 'package:checkout_app/features/checkout/presentation/views/my_cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() {
  Stripe.publishableKey = ApiKeys.stripePublishableKey;
  runApp(const CheckOutAPP());
}

class CheckOutAPP extends StatelessWidget {
  const CheckOutAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}

// PaymentIntentModel <----- createPaymentIntent (amount, currency, customerId)
// createEphemeralKey (customerId)
// initPaymentSheet (merchantDisplayName, paymentIntentClientSecret,ephemeralKeySecret)
// presentPaymentSheet
