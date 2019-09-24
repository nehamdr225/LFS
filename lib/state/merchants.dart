// import './store.dart';
import 'package:LFS/helpers/api.dart';
import 'package:flutter/cupertino.dart';

class MerchantsModel extends ChangeNotifier {
  MerchantsModel() {
    getMerchants().then((data) {
      if (data["error"] != null)
        print(data);
      else
        merchants = data["result"];
    });
  }

  List _merchants = [];

  List get merchants => _merchants;

  set merchants(List data) {
    _merchants.addAll(data);
    notifyListeners();
  }

  category(String cat) => _merchants
      .where((card) => card["category"].split(";").any((el) => el == cat));
}