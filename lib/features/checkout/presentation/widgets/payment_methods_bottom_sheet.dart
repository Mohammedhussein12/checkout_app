import 'package:checkout_app/core/utils/enums.dart';
import 'package:checkout_app/features/checkout/presentation/widgets/custom_button_bloc_consumer.dart';
import 'package:checkout_app/features/checkout/presentation/widgets/payments_methods_list_view.dart';
import 'package:flutter/material.dart';

class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  State<PaymentMethodsBottomSheet> createState() =>
      _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  PaymentMethodsType? paymentMethodTypes;

  updatePaymentMethod({required int index}) {
    if (index == 0) {
      paymentMethodTypes = PaymentMethodsType.stripe;
    } else {
     paymentMethodTypes = PaymentMethodsType.paypal;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentsMethodsListView(
            updatePaymentMethod: updatePaymentMethod,
          ),
          SizedBox(height: 16),
          CustomButtonBlocConsumer(
            selectedPaymentMethod: paymentMethodTypes ?? PaymentMethodsType.stripe,
          ),
        ],
      ),
    );
  }
}
