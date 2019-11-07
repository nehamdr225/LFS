//import 'package:LFS/constants/colors.dart';
import 'package:LFS/constants/colors.dart';
import 'package:LFS/widget/atoms/FancyText.dart';
import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  final BorderSide side = BorderSide(width: 1.0, color: Colors.grey[300]);
  final TextStyle textStyle = TextStyle(
    fontFamily: 'Helvetica',
    color: primary,
    fontSize: 15.0,
  );
  final BorderRadius borderRadius = BorderRadius.all(Radius.circular(30.0));

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
              side: side,
              borderRadius: borderRadius,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        elevation: 2.0,
                        content: Container(
                          alignment: Alignment.center,
                          height: 70.0,
                          width: 200.0,
                          child: FancyText(
                            text: 'Coming Soon !!!',
                            size: 18.0,
                            textAlign: TextAlign.center,
                            textColor: primary,
                          ),
                        ),
                      ));
            },
            child: Text('Merchant', style: textStyle),
          ),
          FlatButton(
            shape: RoundedRectangleBorder(
              side: side,
              borderRadius: borderRadius,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        elevation: 2.0,
                        content: Container(
                          alignment: Alignment.center,
                          
                          height: 70.0,
                          width: 200.0,
                          child: FancyText(
                            text: 'Coming Soon !!!',
                            size: 18.0,
                            textAlign: TextAlign.center,
                            textColor: primary,
                          ),
                        ),
                      ));
            },
            child: Text('Gift Card', style: textStyle),
          ),
          FlatButton(
            shape: RoundedRectangleBorder(
              side: side,
              borderRadius: borderRadius,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        elevation: 2.0,
                        content: Container(
                          alignment: Alignment.center,
                          height: 70.0,
                          width: 200.0,
                          child: FancyText(
                            text: 'Coming Soon !!!',
                            size: 18.0,
                            textAlign: TextAlign.center,
                            textColor: primary,
                          ),
                        ),
                      ));
            },
            child: Text('Vouchers', style: textStyle),
          ),
        ],
      ),
    );
  }
}
