class AmountDetailsModel {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  AmountDetailsModel({
    this.subtotal,
    this.shipping,
    this.shippingDiscount,
  });

  AmountDetailsModel.fromJson(dynamic json) {
    subtotal = json['subtotal'];
    shipping = json['shipping'];
    shippingDiscount = json['shipping_discount'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subtotal'] = subtotal;
    map['shipping'] = shipping;
    map['shipping_discount'] = shippingDiscount;
    return map;
  }
}
