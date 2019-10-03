// import './store.dart';
import 'package:LFS/helpers/api.dart';
import 'package:flutter/cupertino.dart';

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

  set merchants(List data) {
    _merchants.addAll(data);
    notifyListeners();
  }

  category(String cat) =>
      _merchants.where((card) => card["category"].contains(cat)).toList();
}
