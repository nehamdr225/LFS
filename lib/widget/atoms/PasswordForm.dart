import 'package:LFS/constants/colors.dart';
import 'package:flutter/material.dart';

class PasswordForm extends StatefulWidget {
  final String error;
  final String text;
  final Function onChanged;
  final bool readOnly;

  PasswordForm({this.text, this.onChanged, this.error, this.readOnly: false});

  @override
  _PasswordFormState createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  final style = TextStyle(
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: primary);

  TextInputType type = TextInputType.visiblePassword;
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
      child: TextField(
        readOnly: widget.readOnly,
        keyboardType: type,
        obscureText: obscure,
        onChanged: widget.onChanged,
        style: TextStyle(
            color: Colors.black, fontFamily: "Helvetica", fontSize: 18),
        decoration: InputDecoration(
          suffixIcon: InkWell(
            child: Icon(type == TextInputType.visiblePassword
                ? Icons.visibility_off
                : Icons.visibility),
            onTap: () {
              if (type == TextInputType.visiblePassword)
                setState(() {
                  type = TextInputType.text;
                  obscure = false;
                });
              else
                setState(() {
                  type = TextInputType.visiblePassword;
                  obscure = true;
                });
            },
          ),
          icon: Padding(
            child: Icon(Icons.vpn_key),
            padding: EdgeInsets.only(top: 8),
          ),
          hintText: widget.text,
          hintStyle: TextStyle(
              fontFamily: 'Helvetica', fontSize: 16, color: Colors.black54),
          errorText: widget.error,
          errorMaxLines: 3,
          errorStyle: TextStyle(
            fontFamily: 'Helvetica',
            fontSize: 12,
            color: errorColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
          ),
          focusedErrorBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: errorColor)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: primary)),
        ),
      ),
    );
  }
}
