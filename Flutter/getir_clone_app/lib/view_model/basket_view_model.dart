import 'package:flutter/material.dart';

class BasketViewModel extends ChangeNotifier{
  List<String> items = [];

  void AddBasket(String itemName){
    items.stringValue(itemName);
    print("STRİNG GELDİ");
    notifyListeners();
  }
}

extension listAddAndRemove on List<String>{
  void stringValue(String product){
    return contains(product) ? remove(product) : add(product);
  }
}