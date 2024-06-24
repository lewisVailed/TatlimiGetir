import 'package:flutter/material.dart';
import 'package:getir_clone_app/view/login_page.dart';

mixin LoginPageMixin on State<LoginPage>{
  static const String titleText = "Tatlımı Getir'e Hoşgeldiniz";
  static const String epostHintText = "E-posta";
  static const String passwordHintText = "Şifre";
  static const String passwordTextButtonText = "Şifremi Unuttum";
  static const String registerPageTextButtonText = "Henüz hesabın yok mu? Hemen Kayıt ol!";

  final TextEditingController epostController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  void dispose() {
    super.dispose();
    epostController.dispose();
    passwordController.dispose();
  }
}