import 'package:LFS/constants/colors.dart';
import 'package:flutter/material.dart';

class FForm extends StatelessWidget {
  final bool obscure, autofocus;
  final String text;
  final icon;
  final TextInputType type;
  final Function onChanged;
  final style = TextStyle(
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: primary);
  FForm(
      {this.text,
      this.type,
      this.obscure: false,
      this.onChanged,
      this.autofocus: false,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: type,
      autofocus: autofocus,
      obscureText: obscure,
      onChanged: onChanged,
      style:
          TextStyle(color: Colors.black, fontFamily: "Helvetica", fontSize: 18),
      decoration: InputDecoration(
          icon: Padding(
            child: icon,
            padding: EdgeInsets.only(top: 8),
          ),
          contentPadding: type == TextInputType.phone
              ? EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)
              : null,
          hintText: text,
          hintStyle: TextStyle(
              fontFamily: 'Helvetica', fontSize: 16, color: Colors.black54),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: primary))),
    );
  }
}
