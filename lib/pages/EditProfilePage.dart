import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:LFS/widget/atoms/FForm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:LFS/state/user.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key key}) : super(key: key);

  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool isEditingName = false;
  bool isEditingMail = false;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context).user;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: FAppbar(
          leadingChoice: false,
          search: false,
          title: "Edit Profile",
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 200.0,
            child: IconButton(
              icon: Icon(Icons.add_a_photo),
              onPressed: () {},
            ),
          ),
          FForm(
              value: isEditingName == false ? user['name'] : null,
              autofocus: false,
              readOnly: isEditingName == false ? true : false),
          Container(
            width: 200.0,
            padding: EdgeInsets.only(right: 10.0),
            alignment: Alignment.centerRight,
            child: RaisedButton(
              splashColor: Colors.black12,
              child: Text(
                "Edit",
                style: TextStyle(color: Colors.white, fontFamily: "Helvetica"),
              ),
              onPressed: () {
                setState(() {
                  isEditingName = !isEditingName;
                });
              },
            ),
          ),
          FForm(
            value: isEditingMail == false ? user['email'] : null,
            autofocus: false,
            readOnly: isEditingMail == false ? true : false,
          ),
          Container(
            width: 200.0,
            padding: EdgeInsets.only(right: 10.0),
            alignment: Alignment.centerRight,
            child: RaisedButton(
              splashColor: Colors.black12,
              child: Text(
                "Edit",
                style: TextStyle(color: Colors.white, fontFamily: "Helvetica"),
              ),
              onPressed: () {
                setState(() {
                  isEditingMail = !isEditingMail;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
