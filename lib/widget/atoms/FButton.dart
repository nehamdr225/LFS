import 'package:flutter/material.dart';
import 'package:uno/widget/atoms/FancyText.dart';

class FButton extends StatelessWidget {
  final String text, info;
  final Function onPressed, onTap;

  FButton({this.text, this.onPressed, this.info, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
            width: 200.0,
            height: 50.0,
            child: RaisedButton(
                color: Colors.greenAccent[400],
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    // fontFamily: 'Roboto',
                    fontSize: 24.0,
                  ),
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                onPressed: onPressed,
                )),
              Padding(
                      padding: EdgeInsets.all(4.0),
                    ),
        FancyText(
            text: info,
            size: 15.0,
            onTap: onTap
        )
      ],
    );
  }
}
