//import 'package:LFS/constants/colors.dart';
import 'package:flutter/material.dart';

class CircleOpts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          Options(),
        ],
      ),
    );
  }
}

class Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'Merchant',
            backgroundColor: Colors.red,
            onPressed: () {},
            child: Image.asset('assets/images/SocialMedia/merchantFAB.png'),
          ),
          FloatingActionButton(
            heroTag: 'Gift Card',
            backgroundColor: Colors.green,
            onPressed: () {},
            child: Image.asset('assets/images/SocialMedia/giftcardFAB.png'),
          ),
          // FloatingActionButton(
          //   heroTag: 'Vouchers',
          //   backgroundColor: Colors.yellow,
          //   onPressed: () {},
          //   child: Image.asset('assets/images/SocialMedia/vouchersFAB.svg'),
          // )
        ],
      ),
    );
  }
}
