// import '../helpers/api.dart';
// import './store.dart';
import 'package:flutter/cupertino.dart';

class MerchantsModel extends ChangeNotifier {
  MerchantsModel();

  List _merchants = [];

  List get merchants => _merchants;

  set merchants(data) => _merchants.addAll(data);

  category(cat) => _merchants.where((card) => card["category"].contains(cat));
}
