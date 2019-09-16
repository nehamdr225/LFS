import 'package:LFS/constants/colors.dart';
import 'package:flutter/material.dart';

class FForm extends StatelessWidget {
  final String text;
  final bool obscure;
  final IconData icon;
  final TextInputType type;
  FForm({this.text, this.obscure, this.type, this.icon});
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: p_dark),
          child: TextFormField(
        // cursorColor: Color(0xff0D47A1),
        obscureText: obscure,
        keyboardType: type,
        decoration: InputDecoration(
          // fillColor: Color(0xff0D47A1),
          // hoverColor: Color(0xff0D47A1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.blue,
          ),),
          // icon: Icon(icon, color: Color(0xff0D47A1)),
          // focusColor: Color(0xff0D47A1),
          labelText: text,
          labelStyle: TextStyle(
            fontFamily: 'Crimson',
            // color: Color(0xff0D47A1)
          ),
          hintText: 'Type your $text here',
          //hintStyle: TextStyle(color: Color(0xff4FC3F7)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            //borderSide: BorderSide(color: Colors.blue[900]),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red[800]),
          ),
        ),
      ),
    );
  }
}
