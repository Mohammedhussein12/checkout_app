import 'package:checkout_app/features/checkout/data/paypal_models/amount_details_model.dart';
import 'package:checkout_app/features/checkout/data/paypal_models/amount_model.dart';
import 'package:checkout_app/features/checkout/data/paypal_models/item_list_model.dart';
import 'package:checkout_app/features/checkout/data/paypal_models/order_item_model.dart';

({AmountModel amount, ItemListModel itemList}) getTransactionsData() {
  var amount = AmountModel(
    currency: 'USD',
    total: '100',
    details: AmountDetailsModel(
      subtotal: '100',
      shipping: '0',
      shippingDiscount: 0,
    ),
  );
  List<OrderItemModel> orders = [
    OrderItemModel(
      name: 'Apple',
      quantity: 4,
      price: '10',
      currency: 'USD',
    ),
    OrderItemModel(
      name: 'Pineapple',
      quantity: 5,
      price: '12',
      currency: 'USD',
    ),
  ];
  var itemList = ItemListModel(orders: orders);
  return (amount: amount, itemList: itemList);
}
