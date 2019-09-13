import 'package:LFS/widget/atoms/FIcon.dart';
import 'package:flutter/material.dart';

class Choices extends StatelessWidget {
  final Color decoColor;
  final IconData icon;
  final String text;
  Choices({this.decoColor, this.text, this.icon});
  @override
  Widget build(BuildContext context) {
    return Material(
          child: InkWell(
            splashColor: Colors.blue[900],
            onTap: (){},
            child: Container(
                height: 70.0,
                width: 100.0,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FIcon(
                        icon: icon,
                      ),
                      Padding(padding: EdgeInsets.all(2.0),),
                      Text(
                        text,
                        style: TextStyle(
                          fontFamily: 'Crimson',
                          fontSize: 20.0,
                          color: Colors.blue[900]
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue[900],
                    width: 2.0
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                
                ),


        ),
      ),
    );
  }
}