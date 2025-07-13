class AmountDetailsModel {
  dynamic tip;

  AmountDetailsModel({
    this.tip,
  });

  AmountDetailsModel.fromJson(dynamic json) {
    tip = json['tip'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tip'] = tip;
    return map;
  }
}
