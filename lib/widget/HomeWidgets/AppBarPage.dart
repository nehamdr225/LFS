import 'package:LFS/widget/atoms/FancyText.dart';
import 'package:flutter/material.dart';

class AppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.blue[900]
      ),
      elevation: 2.0,
      backgroundColor: Colors.white,
     
      leading: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //FIcon(),
          Padding(padding: EdgeInsets.all(5.0),),
          FancyText(
            text: "LFS",
            size: 24.0,
            textColor: Colors.blue[900],
          ),
        ],
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: (){
            
          },
        )
      ],
    );
  }
}
