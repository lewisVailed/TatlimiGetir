import 'package:flutter/material.dart';
import 'package:getir_clone_app/model/dessert.dart';
import 'package:getir_clone_app/view/category_detail_page.dart';

mixin CategoryDetailMixin on State<CategoryDetailPage>{

   late List<Dessert> desserts;

  @override
  void initState() {
    super.initState();
    desserts = DessertItems()._desserts;
  }
  

}

class DessertItems {
  late final List<Dessert> _desserts;

  DessertItems(){
    _desserts = [
      Dessert(name: "Cheesecake", price: 110.00, imageName: "tatli1",
      sweetshop: "Nur Pastanesi"),
      Dessert(name: "Damat Pastası", price: 149.90, imageName: "tatli2",
      sweetshop: "Burç Fırın"),
      Dessert(name: "Brownie", price: 99.90, imageName: "tatli3",
      sweetshop: "Kahve Dünyası"),
      Dessert(name: "Çikoaltalı Kek", price: 120.00, imageName: "tatli4",
      sweetshop: "Gül Pastanesi"),
      Dessert(name: "Krem Karamel", price: 110.00, imageName: "tatli5",
      sweetshop: "Erva Pastane" ),
      Dessert(name: "Cheesecake", price: 110.00, imageName: "tatli1",
      sweetshop: "Nur Pastanesi"),
      Dessert(name: "Damat Pastası", price: 149.90, imageName: "tatli2",
      sweetshop: "Burç Fırın"),
      Dessert(name: "Brownie", price: 99.90, imageName: "tatli3",
      sweetshop: "Kahve Dünyası"),
      Dessert(name: "Çikoaltalı Kek", price: 120.00, imageName: "tatli4",
      sweetshop: "Gül Pastanesi"),
      Dessert(name: "Krem Karamel", price: 110.00, imageName: "tatli5",
      sweetshop: "Erva Pastane" ),
      Dessert(name: "Cheesecake", price: 110.00, imageName: "tatli1",
      sweetshop: "Nur Pastanesi"),
      Dessert(name: "Damat Pastası", price: 149.90, imageName: "tatli2",
      sweetshop: "Burç Fırın"),
      Dessert(name: "Brownie", price: 99.90, imageName: "tatli3",
      sweetshop: "Kahve Dünyası"),
      Dessert(name: "Çikoaltalı Kek", price: 120.00, imageName: "tatli4",
      sweetshop: "Gül Pastanesi"),
      Dessert(name: "Krem Karamel", price: 110.00, imageName: "tatli5",
      sweetshop: "Erva Pastane" ),
    ];
  }
}