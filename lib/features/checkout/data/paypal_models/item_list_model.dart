import 'package:checkout_app/features/checkout/data/paypal_models/order_item_model.dart';

class ItemListModel {
  List<OrderItemModel>? orders;

  ItemListModel({
    this.orders,
  });

  ItemListModel.fromJson(dynamic json) {
    if (json['items'] != null) {
      orders = [];
      json['items'].forEach((v) {
        orders?.add(OrderItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (orders != null) {
      map['items'] = orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
