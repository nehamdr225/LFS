import 'package:LFS/helpers/api.dart';
import 'package:LFS/widget/atoms/FancyText.dart';
import 'package:flutter/material.dart';
import 'package:LFS/state/merchants.dart';
import 'package:provider/provider.dart';

class ConnError extends StatefulWidget {
  ConnError({Key key}) : super(key: key);

  _ConnErrorState createState() => _ConnErrorState();
}

class _ConnErrorState extends State<ConnError> {
  AnimatedIconData icona = AnimatedIcons.arrow_menu;
  IconData icon = Icons.rotate_left;
  bool isRefreshing = false;

  @override
  Widget build(BuildContext context) {
    final merchants = Provider.of<MerchantsModel>(context);
    onPressed() {
      if (!isRefreshing) {
        setState(() {
          icon = Icons.blur_circular;
          isRefreshing = true;
        });
        getMerchants().then((data) {
          if (data["result"] != null) {
            merchants.merchants = data["result"];
          }
        });
      }
    }

    return Container(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FancyText(
              text: 'Error ocurred! Try again later.',
              textColor: Colors.black54,
              size: 16.0,
              textAlign: TextAlign.center,
            ),
            // AnimatedIcon(icon: icona, progress: Animation.,),
            IconButton(
              icon: Icon(
                icon,
                color: Colors.black54,
              ),
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
