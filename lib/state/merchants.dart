// import './store.dart';
import 'package:LFS/helpers/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class MerchantsModel extends ChangeNotifier {
  MerchantsModel() {
    //Cache data locally and retrieve if not network
    getMerchants(_page).then((data) {
      if (data["result"] != null) {
        print(data["count"]);
        maxCount = data["count"];
        merchants = data["result"];
      }
    });
  }

  List _merchants = [];
  List get merchants => _merchants;
  int _page = 1;
  int _maxCount;
  Map one(id) => _merchants.firstWhere((merchant) => merchant["_id"] == id);
  get maxCount => _maxCount;
  get page => _page;

  set page(pageNo) {
    _page = pageNo;
    notifyListeners();
  }

  set maxCount(count) {
    _maxCount = count;
    notifyListeners();
  }

  getDistance(Position user, List merchant) async =>
      await Geolocator().distanceBetween(user.latitude, user.longitude,
          double.parse(merchant[0]), double.parse(merchant[1])) /
      1000;

  getPosition() async => await Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  set merchants(List data) {
    if (_merchants.length > 0)
      data.forEach((el) {
        final check =
            _merchants.any((merchant) => merchant['_id'] == el['_id']);
        if (!check) _merchants.add(el);
      });
    else {
      _merchants.addAll(data);
    }

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

  refresh() async {
    if (maxCount != null && merchants.length < maxCount) {
      page = page + 1;
      final res = await getMerchants(page);
      if (res['result'].length > 0) {
        merchants = res['result'];
        notifyListeners();
        return "success";
      }
      return "done";
    }
    return "done";
  }
}
