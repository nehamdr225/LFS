import 'package:flutter/material.dart';

class FForm extends StatelessWidget {
  final String text;
  final bool obscure;
  final IconData icon;
  final TextInputType type;
  FForm({this.text, this.obscure, this.type, this.icon});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      keyboardType: type,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.orangeAccent[400]),
        ),
        icon: Icon(icon, color: Color(0xff00e676)),
        focusColor: Color(0xff00e676),
        labelText: text,
        labelStyle: TextStyle(color: Color(0xff00e676)),
        hintText: 'Type your $text here',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.greenAccent[400]),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red[800]),
        ),
      ),
    );
  }
}
