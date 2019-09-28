import 'package:LFS/constants/colors.dart';
import 'package:flutter/material.dart';

class FButton extends StatelessWidget {
  final String text, info;
  final Function onPressed, onTap;
  final Color color;
  final Color textColor;
  FButton({this.text, this.textColor:primary, this.color:primary,this.onPressed, this.info, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
            width: 250.0,
            height: 40.0,
            child: RaisedButton(
              elevation: 4.0,
              hoverColor: Colors.blue[900],
              hoverElevation: 12.0,
                color: color, //Colors.indigo[700],
                child: Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'Crimson',
                    color: textColor,
                    // fontFamily: 'Roboto',
                    fontSize: 24.0,
                  ),
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                onPressed: onPressed,
                )),
              Padding(
                      padding: EdgeInsets.all(4.0),
                    ),
        // FancyText(
        //     text: info,
        //     size: 15.0,
        //     onTap: onTap
        // )
      ],
    );
  }
}
