import 'package:LFS/widget/atoms/choices.dart';
import 'package:flutter/material.dart';

class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,        
        children: <Widget>[
          Choices(
            text: 'Merchants',
            icon: Icons.fastfood,
            decoColor: Colors.purple[200],
          ),
          Choices(
            text: 'Gift Cards',
            icon: Icons.card_giftcard,
            decoColor: Colors.blue[200],
          ),
          Choices(
            text: 'Vouchers',
            icon: Icons.credit_card,
            decoColor: Colors.orange[200],
          ),
          
        ],
      ),
      
      
    );
  }
}