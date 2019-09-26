import 'package:LFS/constants/colors.dart';
import 'package:flutter/material.dart';

class FForm extends StatelessWidget {
  final bool obscure;
  final String text;
  final TextInputType type;
  final Function onChanged;
  final style = TextStyle(
      fontFamily: 'Crimson',
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.black54);
  FForm({this.text, this.type, this.obscure: false, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: type,
      autofocus: false,
      obscureText: obscure,
      onChanged: onChanged,
      decoration: InputDecoration(
          icon: type == TextInputType.phone ? Icon(Icons.call) : null,
          contentPadding: type == TextInputType.phone
              ? EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)
              : null,
          hintText: text,
          labelStyle: style,
          labelText: text,
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: primary))),
    );
  }
}
