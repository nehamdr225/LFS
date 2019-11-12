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
          print(result);
          if (result == "token expired") {
            delKeyVal("token").then(() {
              state['token'] = null;
              notifyListeners();
            });
          } else if (result['nerror'] != null) {
            print("Not connected to internet!");
          } else {
            print(result);
            state["user"] = result;
            if (result["favourites"].length > 0)
              state["favourites"].addAll(result["favourites"]);
          }
          notifyListeners();
        });
      }
    });
  }

  Map<String, dynamic> state = {
    "user": {},
    "token": null,
    "location": null,
    "favourites": []
  };

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

  favourite(String id) {
    if (id != null && id.length > 0) {
      if (!favourites.contains(id)) {
        state["favourites"].add(id);
      } else
        return "error";
      // notifyListeners();
      setFavourites(id, token).then((response) {
        print(response);
      });
    }
  }

  removeFromFav(String id) {
    if (id != null && id.length > 0 && favourites.length > 0) {
      deleteFavourites(id, token).then((response) {
        if (response["result"] != null) {
          if (favourites.contains(id)) state["favourites"].remove(id);
          notifyListeners();
          return response;
        }
      });
    }
  }

  void userLocation() async {
    try {
      location = await getPosition();
    } catch (err) {
      print(err);
    }
  }

  Future<dynamic> userDistance(List merchant) async {
    try {
      return await getDistance(location, merchant);
    } catch (err) {
      return "N/A";
    }
  }

  Future<Position> getPosition() async => await Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  Future<double> getDistance(Position user, List merchant) async =>
      await Geolocator().distanceBetween(user.latitude, user.longitude,
          double.parse(merchant[0]), double.parse(merchant[1])) /
      1000;

  void logOut() {
    logout().then((result) {
      state["user"] = {};
      state["token"] = null;
      notifyListeners();
    });
  }
}
