import 'package:checkout_app/core/widgets/custom_button.dart';
import 'package:checkout_app/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:checkout_app/features/checkout/presentation/manager/payment_cubit.dart';
import 'package:checkout_app/features/checkout/presentation/widgets/order_info_item.dart';
import 'package:checkout_app/features/checkout/presentation/widgets/payment_methods_bottom_sheet.dart';
import 'package:checkout_app/features/checkout/presentation/widgets/total_price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 18,
          ),
          Expanded(child: Image.asset('assets/images/basket_image.png')),
          SizedBox(
            height: 25,
          ),
          OrderInfoItem(
            title: 'Order Subtotal',
            value: '42.97',
          ),
          SizedBox(
            height: 3,
          ),
          OrderInfoItem(
            title: 'Discount',
            value: '0',
          ),
          SizedBox(
            height: 3,
          ),
          OrderInfoItem(
            title: 'Shipping',
            value: '8',
          ),
          Divider(
            height: 34,
            thickness: 2,
            color: Color(0xffC7C7C7),
          ),
          TotalPrice(title: 'Total', value: '50.97'),
          SizedBox(
            height: 16,
          ),
          CustomButton(
            title: 'Complete Payment',
            onTap: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => PaymentDetailsView(),
              //   ),
              // );
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(16),
                ),
                builder: (context) {
                  return BlocProvider(
                    create: (context) =>
                        PaymentCubit(checkoutRepo: CheckoutRepoImpl()),
                    child: PaymentMethodsBottomSheet(),
                  );
                },
              );
            },
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
