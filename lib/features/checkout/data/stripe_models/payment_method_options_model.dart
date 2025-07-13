import 'package:checkout_app/features/checkout/data/stripe_models/card_model.dart';
import 'package:checkout_app/features/checkout/data/stripe_models/link_model.dart';

class PaymentMethodOptionsModel {
  CardModel? card;
  LinkModel? link;

  PaymentMethodOptionsModel({
    this.card,
    this.link,
  });

  PaymentMethodOptionsModel.fromJson(dynamic json) {
    card = json['card'] != null ? CardModel.fromJson(json['card']) : null;
    link = json['link'] != null ? LinkModel.fromJson(json['link']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (card != null) {
      map['card'] = card?.toJson();
    }
    if (link != null) {
      map['link'] = link?.toJson();
    }
    return map;
  }
}
