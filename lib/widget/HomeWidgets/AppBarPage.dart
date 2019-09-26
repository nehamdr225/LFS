import 'package:LFS/constants/colors.dart';
import 'package:LFS/widget/atoms/FancyText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarPage extends StatelessWidget {
  final bgcolor;
  final select;
  final elevation;
  final search;
  final text;
  AppBarPage({this.select: false, this.bgcolor: Colors.white, this.elevation: 0.0, this.search: false, this.text:''});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      iconTheme: IconThemeData(
        color: primary
      ),
      backgroundColor: Colors.white,
      title: Text(text, style: TextStyle(color: primary, fontFamily: 'Bree'),),
      leading: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.all(0.0),),
          select == true?
          FancyText(
            text: "LFS",
            size: 24.0,
            textColor: Colors.blue[900],
          ): 
          IconButton(
            icon: Icon(CupertinoIcons.back),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
      actions: <Widget>[
        search == true?
        IconButton(
          icon: Icon(CupertinoIcons.search, color: primary,),
          onPressed: (){    
          },
        ):
        Text('data', style: TextStyle(color: Colors.transparent),),
      ],
    );
  }
}
