import 'package:checkout_app/core/utils/styles.dart';
import 'package:checkout_app/features/checkout/presentation/widgets/card_info_widget.dart';
import 'package:checkout_app/features/checkout/presentation/widgets/payment_item_info.dart';
import 'package:checkout_app/features/checkout/presentation/widgets/total_price_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Color(0xffEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 22, right: 22),
        child: Column(
          children: [
            Text(
              'Thank You!',
              style: Styles.style25,
              textAlign: TextAlign.center,
            ),
            Text(
              textAlign: TextAlign.center,
              'Your Transaction was successful',
              style: Styles.style20,
            ),
            SizedBox(height: 30),
            PaymentItemInfo(
              title: 'Date',
              value: '01/24/2023',
            ),
            SizedBox(height: 10),
            PaymentItemInfo(
              title: 'Time',
              value: '10:15 PM',
            ),
            SizedBox(height: 10),
            PaymentItemInfo(
              title: 'To',
              value: 'Sam Louis',
            ),
            Divider(
              height: 40,
              thickness: 2,
            ),
            TotalPrice(title: 'Total', value: '50,97'),
            SizedBox(height: 20),
            CardInfoWidget(),
            Spacer(
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(FontAwesomeIcons.barcode, size: 64),
                Container(
                  height: 58,
                  width: 113,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1.50,
                        color: Color(0xff34A853),
                      ),
                      borderRadius: BorderRadiusGeometry.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      style: Styles.style24.copyWith(
                        color: Color(0xff34A853),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
