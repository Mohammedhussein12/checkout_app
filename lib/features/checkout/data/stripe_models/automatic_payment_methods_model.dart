class AutomaticPaymentMethodsModel {
  bool? enabled;

  AutomaticPaymentMethodsModel({
    this.enabled,
  });

  AutomaticPaymentMethodsModel.fromJson(dynamic json) {
    enabled = json['enabled'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['enabled'] = enabled;
    return map;
  }
}
