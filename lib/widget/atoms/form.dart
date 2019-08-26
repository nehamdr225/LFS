import 'package:flutter/material.dart';

class FForm extends StatelessWidget {
  final String text, keyboardType;
  final bool obscure;
  FForm({this.text, this.obscure, this.keyboardType});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        icon: Icon(Icons.people),
        labelText: text,
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