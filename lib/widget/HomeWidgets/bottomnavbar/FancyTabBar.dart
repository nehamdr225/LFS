import 'package:LFS/widget/HomeWidgets/bottomnavbar/TabItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/rendering.dart';
import 'package:vector_math/vector_math.dart' as radians;



class FancyTabBar extends StatefulWidget {
  @override
  _FancyTabBarState createState() => _FancyTabBarState();
}

class _FancyTabBarState extends State<FancyTabBar> with TickerProviderStateMixin {
  AnimationController _animationController;
  Tween<double> _positionTween;
  Animation<double> _positionAnimation;
  AnimationController _fadeOutController;
  Animation<double> _fadeFabOutAnimation;
  Animation<double> _fadeFabInAnimation;

  double fabIconAlpha =1.0;
  IconData nextIcon = Icons.home;
  IconData activeIcon =Icons.home;

  int currentSelected = 1;

  @override
  void initState(){
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: ANIM_DURATION) );
    
    _fadeOutController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: ANIM_DURATION) );
    
    _positionTween = Tween<double> (begin: 0.0, end: 0.0);
    
    _positionAnimation = _positionTween.animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut)
    )..addListener((){
      setState((){});
    });

    _fadeFabOutAnimation = Tween<double> (begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut)
    )..addListener((){
      setState((){
        fabIconAlpha = _fadeFabOutAnimation.value;
      });
    })..addStatusListener(( AnimationStatus status){
      if (status == AnimationStatus.completed){
        setState(() {
          activeIcon = nextIcon;
        });
      }
    });


    _fadeFabInAnimation = Tween<double> (
      begin: 0.0,
      end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController, 
        curve: Curves.easeOut)
    )..addListener((){
      setState((){
        fabIconAlpha = _fadeFabInAnimation.value;
      });
  });

   _initAnimationAndStart(double from, double to){
      _positionTween.begin = from;
      _positionTween.end = to;

      _animationController.reset();
      _fadeOutController.reset();
      _animationController.forward();
      _fadeOutController.forward();
    }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          height: 65.0,
          margin: EdgeInsets.only(top: 45.0),
          decoration: BoxDecoration(
            color: prefix0.Colors.white,
            boxShadow: [
              BoxShadow(
                color: prefix0.Colors.black12,
                offset: Offset(0.0, -1.0),
                blurRadius: 8.0
              )
            ]
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TabItem(
                selected: currentSelected ==0,
                iconData: Icons.category,
                title: "Category",
                callbackFunction: (){
                  setState(() {
                    nextIcon = Icons.category;
                    currentSelected = 0;
                  });
                  _initAnimationAndStart(_positionAnimation.value, -1.0);
                }
              ),
              TabItem(
                selected: currentSelected ==0,
                iconData: Icons.home,
                title: "Home",
                callbackFunction: (){
                  setState(() {
                    nextIcon = Icons.home;
                    currentSelected = 0;
                  });
                  _initAnimationAndStart(_positionAnimation.value, 0.0);
                }
              ),
              TabItem(
                selected: currentSelected ==0,
                iconData: Icons.account_circle,
                title: "Account",
                callbackFunction: (){
                  setState(() {
                    nextIcon = Icons.account_circle;
                    currentSelected = 0;
                  });
                  _initAnimationAndStart(_positionAnimation.value, 1.0);
                }
              ),
            ],
          ),
        ),
        IgnorePointer(
          child: Container(
            decoration: BoxDecoration(color: prefix0.Colors.transparent),
            child: Align(
              heightFactor: 1.0,
              alignment: Alignment(_positionAnimation.value, 0.0),
              child: FractionallySizedBox(
                widthFactor: 1/3,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 90.0,
                      width: 90.0,
                      child: ClipRect(
                        clipper: HalfClipper(),
                        child: Container(
                          child: Center(
                            child: Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: prefix0.Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: prefix0.Colors.black12,
                                    blurRadius: 8.0,
                                  )
                                ]
                              ),
                            ),
                          )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70.0,
                      width: 90.0,
                      child: CustomPaint(
                        painter: HalfPainter(
                          rad0: radians.radians(0),
                          rad90: radians.radians(90.0),
                          rad180: radians.radians(180.0)

                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60.0,
                      width: 60.0,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: BLUE,
                          border: Border.all(
                            color: prefix0.Colors.white,
                            width: 5.0,
                            style: BorderStyle.none
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Opacity(
                            opacity: fabIconAlpha,
                            child: Icon(
                              activeIcon,
                              color: prefix0.Colors.white,),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
  }  

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class HalfClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size){
    final rect = prefix0.Rect.fromLTWH(0.0, 0.0, size.width, size.height/2);
    return rect;
  }

  @override
  bool shouldReclip(prefix0.CustomClipper<Rect> oldClipper){
    return true;
  }
}

class HalfPainter extends CustomPainter{
  double rad0;
  double rad90;
  double rad180;
  HalfPainter({this.rad0, rad90,rad180});

  @override

  void paint( Canvas canvas, Size size){
    final Rect beforeRect = Rect.fromLTRB(0.0, (size.height/2)-10, 10.0, 10.0);
    final Rect largeRect = Rect.fromLTWH(10.0, 0.0, size.width-20, 70.0);
    final Rect afterRect = Rect.fromLTRB(size.width-10, (size.height/2)-10, 10.0, 10.0);
    final path = Path();

    path.arcTo(beforeRect, rad0, rad90, false);
    path.lineTo(20.0, size.height/2);

    path.arcTo(largeRect, rad0, -rad180, false);
    path.moveTo(size.width-10, (size.height/2));

    path.lineTo(size.width-10, (size.height/2)-10);
    path.arcTo(afterRect, rad180, -rad90, false);
    path.close();

    canvas.drawPath(path, Paint()..color=prefix0.Colors.white);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return true;
  }
}