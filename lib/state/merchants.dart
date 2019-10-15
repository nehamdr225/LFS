// import './store.dart';
import 'package:LFS/helpers/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class MerchantsModel extends ChangeNotifier {
  MerchantsModel() {
    //Cache data locally and retrieve if not network
    getMerchants().then((data) {
      if (data["result"] != null) {
        merchants = data["result"];
      }
    });
  }

  List _merchants = [];
  List get merchants => _merchants;

  Map one(id) => _merchants.firstWhere((merchant) => merchant["_id"] == id);

  getDistance(Position user, List merchant) async =>
      await Geolocator().distanceBetween(user.latitude, user.longitude,
          double.parse(merchant[0]), double.parse(merchant[1])) /
      1000;

  getPosition() async => await Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  set merchants(List data) {
    _merchants.addAll(data);
    notifyListeners();
  }

  location(merchants) async {
    var filters = [];
    var pos = await getPosition();
    if (pos == null) return null;
    for (var merchant in merchants) {
      if (merchant["location"] != null && merchant["location"].length > 0) {
        var distance = await getDistance(pos, merchant["location"]);
        filters.add([merchant["_id"], distance]);
      }
    }
    filters.sort((a, b) {
      return a[1].compareTo(b[1]);
    });
    return filters;
  }

  category(String cat) =>
      _merchants.where((card) => card["category"].contains(cat)).toList();
}
