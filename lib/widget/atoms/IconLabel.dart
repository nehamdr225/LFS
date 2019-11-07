import 'package:flutter/material.dart';

class IconLabel extends StatelessWidget {
  final IconData icon;
  final bg;
  final text;
  final alignment;
  const IconLabel(
      {Key key,
      this.icon,
      this.text,
      this.alignment,
      this.bg: Colors.transparent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        child: Row(
          children: [
            Padding(
              child: Icon(icon, color: Colors.white, size: 16),
              padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
            ),
            Padding(
              child: Text(
                text,
                style: TextStyle(fontSize: 17, backgroundColor: bg),
              ),
              padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
            )
          ],
        ),
        alignment: Alignment.bottomLeft,
      ),
    );
  }
}
