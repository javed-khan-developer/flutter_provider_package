import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> _items = [];
  List<int> get items => _items;
  void addItems(int val) {
    _items.add(val);
    notifyListeners();
  }

  void removeItems(int val) {
    _items.remove(val);
    notifyListeners();
    notifyListeners();
  }
}
