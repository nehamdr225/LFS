// import '../helpers/api.dart';
// import './store.dart';
import 'package:flutter/cupertino.dart';

class CardsModel extends ChangeNotifier {
  CardsModel();

  List _cards = [];

  List get cards => _cards;

  set cards(data) => _cards.addAll(data);

  category(cat) => _cards.where((card) => card["category"].contains(cat));
}
