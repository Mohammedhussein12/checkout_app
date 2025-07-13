import 'amount_details_model.dart';

class AmountModel {
  final String? total;
  final String? currency;
  final AmountDetailsModel? details;

  AmountModel({
    required this.total,
    required this.currency,
    required this.details,
  });

  factory AmountModel.fromJson(Map<String, dynamic> json) {
    return AmountModel(
      total: json['total'] as String?,
      currency: json['currency'] as String?,
      details: json['details'] != null
          ? AmountDetailsModel.fromJson(json['details'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['currency'] = currency;
    if (details != null) {
      map['details'] = details?.toJson();
    }
    return map;
  }
}
