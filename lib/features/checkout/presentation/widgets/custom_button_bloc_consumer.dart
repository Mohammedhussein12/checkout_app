import 'dart:developer';

import 'package:checkout_app/core/functions/get_transactions.dart';
import 'package:checkout_app/core/utils/api_keys.dart';
import 'package:checkout_app/core/widgets/custom_button.dart';
import 'package:checkout_app/features/checkout/data/paypal_models/amount_model.dart';
import 'package:checkout_app/features/checkout/data/paypal_models/item_list_model.dart';
import 'package:checkout_app/features/checkout/data/stripe_models/payment_intent_input_model.dart';
import 'package:checkout_app/features/checkout/presentation/manager/payment_cubit.dart';
import 'package:checkout_app/features/checkout/presentation/views/my_cart_view.dart';
import 'package:checkout_app/features/checkout/presentation/views/thank_you_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  final bool isPaypal;

  const CustomButtonBlocConsumer({
    super.key,
    required this.isPaypal,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ThankYouView();
              },
            ),
          );
        } else if (state is PaymentFailure) {

          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            if (isPaypal) {
              var transactionsData = getTransactionsData();
              executePaypalPayment(context, transactionsData);
            } else {
              executeStripePayment(context);
            }
          },
          isLoading: state is PaymentLoading ? true : false,
          title: 'Continue',
        );
      },
    );
  }

  void executeStripePayment(BuildContext context) {
    final paymentIntentInputModel = PaymentIntentInputModel(
      amount: '1000',
      currency: 'USD',
      customerId: 'cus_Sez9tS3Cz58ota',
    );
    BlocProvider.of<PaymentCubit>(context).makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );
  }

  void executePaypalPayment(
    BuildContext context,
    ({AmountModel amount, ItemListModel itemList}) transactionsData,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeys.paypalClientId,
          secretKey: ApiKeys.paypalSecretKey,
          transactions: [
            {
              "amount": transactionsData.amount.toJson(),
              "description": "The payment transaction description.",
              "item_list": transactionsData.itemList.toJson(),
            },
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const ThankYouView(),
              ),
              (route) {
                if (route.settings.name == '/') {
                  return true;
                }
                return false;
              },
            );
          },
          onError: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error.toString()),
              ),
            );
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const MyCartView(),
              ),
              (route) {
                return false;
              },
            );
          },
          onCancel: () {
            print('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
