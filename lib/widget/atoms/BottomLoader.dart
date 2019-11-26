import 'package:LFS/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:LFS/state/merchants.dart';
import 'package:provider/provider.dart';

class BottomLoader extends StatefulWidget {
  BottomLoader({Key key}) : super(key: key);

  _BottomLoaderState createState() => _BottomLoaderState();
}

class _BottomLoaderState extends State<BottomLoader> {
  String status = "success";
  @override
  Widget build(BuildContext context) {
    final result = Provider.of<MerchantsModel>(context).refresh();
    result.then((data) {
      if (data != null)
        setState(() {
          status = data;
        });
    });
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: status == "done"
          ? Column(
              children: <Widget>[
                Icon(
                  Icons.check_circle,
                  color: primary,
                ),
                Text(
                  'Nothing more to show!',
                  style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0),
                )
              ],
            )
          : CircularProgressIndicator(),
    );
  }
}
