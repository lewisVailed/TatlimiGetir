import 'package:flutter/material.dart';
import 'package:getir_clone_app/model/category.dart';
import 'package:getir_clone_app/view/home_page.dart';

mixin HomePageMixin on State<HomePage>{
  late List<Category> category;

  @override
  void initState() {
    super.initState();
    category = CategoryItems()._categoryItems;
  }
}

class CategoryItems{
  late final List<Category> _categoryItems;

  CategoryItems(){
    _categoryItems = [
      Category(name: "Atıştımalık", imageName: "snack"),
      Category(name: "Dondurma", imageName: "icecream"),
      Category(name: "Çikolata", imageName: "chocolate"),
      Category(name: "Fırın", imageName: "bakery"),
      Category(name: "Pasta", imageName: "cake"),
      Category(name: "Sütlü", imageName: "milky"),
      Category(name: "Şekerleme", imageName: "candy"),
      Category(name: "Şerbetli", imageName: "syrupy")
    ];
  }
}