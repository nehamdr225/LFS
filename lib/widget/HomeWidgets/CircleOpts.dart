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
      height: 70.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton(
            elevation: 5.0,
            heroTag: 'Merchant',
            backgroundColor: Colors.red[100],
            onPressed: () {},
            child: Image.asset('assets/images/SocialMedia/merchantFAB.png', height: 30.0, width: 30.0,),
          ),
          FloatingActionButton(
            elevation: 5.0,
            heroTag: 'Gift Card',
            backgroundColor: Colors.green[200],
            onPressed: () {},
            child: Image.asset('assets/images/SocialMedia/giftcardFAB.png', height: 30.0, width: 30.0,),
          ),
          FloatingActionButton(
            elevation: 5.0,
            heroTag: 'Vouchers',
            backgroundColor: Colors.yellow[400],
            onPressed: () {},
            child: Image.asset('assets/images/SocialMedia/voucherFAB.png', height: 30.0, width: 30.0,),
          )
        ],
      ),
    );
  }
}
