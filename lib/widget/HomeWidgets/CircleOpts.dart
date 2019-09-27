//import 'package:LFS/constants/colors.dart';
import 'package:LFS/constants/colors.dart';
import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FlatButton(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 2.0, color: Colors.grey[300]),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
            onPressed: () {},
            child: Text('Merchant', style: TextStyle(fontFamily: 'Bree', color: primary)),
            //child: Image.asset('assets/images/SocialMedia/merchantFAB.png', height: 30.0, width: 30.0,),
          ),
          FlatButton(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 2.0, color: Colors.grey[300]),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
            onPressed: () {},
            child: Text('Gift Card', style: TextStyle(fontFamily: 'Bree', color: primary)),
            //child: Image.asset('assets/images/SocialMedia/merchantFAB.png', height: 30.0, width: 30.0,),
          ),
          FlatButton(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 2.0, color: Colors.grey[300]),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
            onPressed: () {},
            child: Text('Vouchers', style: TextStyle(fontFamily: 'Bree', color: primary)),
            //child: Image.asset('assets/images/SocialMedia/merchantFAB.png', height: 30.0, width: 30.0,),
          ),
          // FloatingActionButton(
          //   tooltip: 'Gift Card',
          //   elevation: 5.0,
          //   heroTag: 'Gift Card',
          //   backgroundColor: Colors.green[200],
          //   onPressed: () {},
          //   child: Image.asset('assets/images/SocialMedia/giftcardFAB.png', height: 30.0, width: 30.0,),
          // ),
          // FloatingActionButton(
          //   tooltip: 'Vouchers',
          //   elevation: 5.0,
          //   heroTag: 'Vouchers',
          //   backgroundColor: Colors.yellow[400],
          //   onPressed: () {},
          //   child: Image.asset('assets/images/SocialMedia/voucherFAB.png', height: 30.0, width: 30.0,),
          // )
        ],
      ),
    );
  }
}
