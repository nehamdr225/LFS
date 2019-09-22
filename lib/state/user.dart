import '../helpers/api.dart';
import './store.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {
  UserModel() {
    getValue('token').then((token) {
      if (token != null && token != state["token"]) {
        state["token"] = token;
        getUser(token).then((result) {
          if (result == "token expired") {
            delKeyVal("token").then(() {
              state["token"] = null;
              return;
            });
          }
          user = result;
        });
        notifyListeners();
      }
    });
  }

  Map state = {"user": {}, "token": null};

  String get token => state["token"];
  Map get user => state["user"];

  set token(String token) {
    if (token != state["token"]) {
      state["token"] = token;
      notifyListeners();
    }
  }

  set user(Map user) {
    if (user != null && user != state["user"]) {
      state["user"] = user;
      notifyListeners();
    }
  }
}
