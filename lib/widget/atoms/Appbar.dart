import 'package:LFS/constants/colors.dart';
import 'package:LFS/widget/atoms/FLogo.dart';
//import 'package:LFS/widget/atoms/FancyText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FAppbar extends StatelessWidget {
  final heart;
  final leadingChoice;
  const FAppbar({Key key, this.leadingChoice: true, this.heart: false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        backgroundColor: lfsWhite,
        leading: leadingChoice == true
            ? FLogo()

            // FancyText(
            //     text: 'LFS',
            //     textColor: primary,
            //     textAlign: TextAlign.center,
            //     fontFamily: 'Crimson',
            //     size: 28.0,
            //   )
            : IconButton(
                icon: Icon(CupertinoIcons.back, color: primary,),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: primary,
            ),
            onPressed: () {},
            splashColor: splash,
          ),
          heart == true
              ? IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: primary,
                  ),
                  onPressed: () {},
                  splashColor: splash,
                )
              : Text('')
        ],
      ),
    );
  }
}
