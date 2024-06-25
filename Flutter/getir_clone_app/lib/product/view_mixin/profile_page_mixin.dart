import 'package:flutter/material.dart';
import 'package:getir_clone_app/view/profile_page.dart';

mixin ProfilePageMixin on State<ProfilePage>{
  static const String appBarTitle = "Profil";

  final String name = "Mustafa Narin";
  static const String namePageDetailLabelText = "Adınız ve Soyadız";
  static const String namePageDetailAppbarTitle = "İsmi";
  
  final String email = "mustafa.narin1132@gmail.com";
  static const String emailPageDetailLabelText = "E-posta adresiniz";
  static const String emailPageDetailAppbarTitle = "E-posta Adresi";

  final String number = "+90 555 444 33 22";
  static const String numberPageDetailLabelText = "Telefon Numaranız";
  static const String numberPageDetailAppbarText = "Sipariş Adresi";

  final String adress = "Fatih Mahallesi 99. sokak Isparta/Merkez";
  static const String adressPageDetailLabelText = "Sipariş adresiniz";
  static const String adressPageDetailAppbarText = "Sipariş Adresi";

  static const String appOutText = "Çıkış Yap";


  String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Ad soyad boş bırakılamaz';
  }
  //Checks that it consists of letters only, regex
  final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
  if (!nameRegex.hasMatch(value)) {
    return 'Ad soyad sadece harflerden oluşmalıdır';
  }
  return null;
}

  // Simple email verification
  String? validateEmail(String? data) {
    if (data == null || data.isEmpty) {
      return 'E-posta boş bırakılamaz';
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(data)) {
      return 'Geçerli bir e-posta giriniz';
    }
    return null;
  }
  String? validateAdress(String? value){
    return (value?.isNotEmpty ?? false) ? null : "Adres boş bırakılamaz";
  }
  // only numbers and up to 11 characters
  String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Telefon numarası boş bırakılamaz';
  }
  
  final phoneRegex = RegExp(r'^\d{1,11}$');
  if (!phoneRegex.hasMatch(value)) {
    return 'Geçerli bir telefon numarası giriniz (en fazla 11 karakter)';
  }
  return null;
  }

}