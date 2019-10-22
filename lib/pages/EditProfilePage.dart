import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key key}) : super(key: key);

  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: FAppbar(
          leadingChoice: false,
          search: false,
          title: "Edit Profile",
        ),
      ),
      body: Container(
        child: Text("Hi"),
      ),
    );
  }
}
