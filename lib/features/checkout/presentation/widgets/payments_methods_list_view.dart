import 'package:checkout_app/features/checkout/presentation/widgets/payment_details_method_item.dart';
import 'package:flutter/material.dart';

class PaymentsMethodsListView extends StatefulWidget {
  final Function({required int index}) updatePaymentMethod;
  static const List<String> paymentMethodItems = [
    'assets/images/card.svg',
    'assets/images/paypal.svg',
  ];

  const PaymentsMethodsListView({super.key, required this.updatePaymentMethod});

  @override
  State<PaymentsMethodsListView> createState() =>
      _PaymentsMethodsListViewState();
}

class _PaymentsMethodsListViewState extends State<PaymentsMethodsListView> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  activeIndex = index;
                });
                widget.updatePaymentMethod(index: activeIndex);
              },
              child: PaymentDetailsMethodItem(
                image: PaymentsMethodsListView.paymentMethodItems[index],
                isActive: index == activeIndex,
              ),
            ),
          );
        },
        itemCount: PaymentsMethodsListView.paymentMethodItems.length,
      ),
    );
  }
}
