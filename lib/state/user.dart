import '../helpers/api.dart';
import './store.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class UserModel extends ChangeNotifier {
  UserModel() {
    getValue('token').then((localToken) {
      if (localToken != null && localToken != state["token"]) {
        state["token"] = localToken;
        getUser(localToken).then((result) {
          if (result == "token expired") {
            delKeyVal("token").then(() {
              token = null;
              return;
            });
          }
          user = result;
        });
        notifyListeners();
      }
    });
  }

  Map state = {"user": {}, "token": null, "location": null, "favourites": []};

  String get token => state["token"];
  Map get user => state["user"];
  get location {
    if (state["location"] != null) return state["location"];
    userLocation();
    return state["location"];
  }

  List get favourites => state["favourites"];

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

  set location(loc) {
    if (loc != null && loc != location) {
      state["location"] = loc;
      notifyListeners();
    }
  }

  favourite(List ids) {
    if (ids != null && ids.length > 0) {
      int idsError = 0;
      ids.forEach((id) {
        if (state["favourites"] == null) state["favourites"] = [];
        if (!state["favourites"].contains(id)) {
          state["favourites"].add(id);
        } else {
          idsError += 1;
        }
      });
      if (idsError == ids.length) return "error";
      notifyListeners();
    }
  }

  removeFromFav(List ids) {
    if (ids != null && ids.length > 0) {
      ids.forEach((id) {
        if (state["favourites"] == null) {
          state["favourites"] = [];
          return;
        }
        if (state["favourites"].contains(id)) {
          state["favourites"].remove(id);
        }
      });
      notifyListeners();
    }
  }

  void userLocation() async {
    try {
      location = await getPosition();
    } catch (err) {
      print(err);
    }
  }

  userDistance(List merchant) async {
    try {
      return await getDistance(location, merchant);
    } catch (err) {
      return "N/A";
    }
  }

  getPosition() async => await Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  getDistance(Position user, List merchant) async =>
      await Geolocator().distanceBetween(user.latitude, user.longitude,
          double.parse(merchant[0]), double.parse(merchant[1])) /
      1000;
}
