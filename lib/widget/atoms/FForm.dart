import 'package:LFS/constants/colors.dart';
import 'package:flutter/material.dart';

class FForm extends StatelessWidget {
  final String error, value;
  final bool obscure, autofocus;
  final String text;
  final Widget icon;
  final TextInputType type;
  final Function onChanged;
  final style = TextStyle(
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: primary);

  FForm(
      {this.text,
      this.type: TextInputType.text,
      this.obscure: false,
      this.onChanged,
      this.autofocus,
      this.icon,
      this.error,
      this.value});

  @override
  Widget build(BuildContext context) {
    print(value);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
      child: TextField(
        controller: value != null
            ? TextEditingController.fromValue(TextEditingValue(text: value))
            : null,
        keyboardType: type,
        autofocus: autofocus,
        obscureText: obscure,
        onChanged: onChanged,
        style: TextStyle(
            color: Colors.black, fontFamily: "Helvetica", fontSize: 18),
        decoration: InputDecoration(
          icon: Padding(
            child: icon,
            padding: EdgeInsets.only(top: 8),
          ),
          hintText: text,
          hintStyle: TextStyle(
              fontFamily: 'Helvetica', fontSize: 16, color: Colors.black54),
          errorText: error,
          errorStyle: TextStyle(
              fontFamily: 'Helvetica',
              fontSize: 12,
              color: errorColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.8),
          focusedErrorBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: errorColor)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: primary)),
        ),
      ),
    );
  }
}
