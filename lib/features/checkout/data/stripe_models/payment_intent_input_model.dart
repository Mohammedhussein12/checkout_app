class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String customerId;

  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
    required this.customerId,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': '${amount}00',
      'currency': currency,
      'customer': customerId,
    };
  }
}
