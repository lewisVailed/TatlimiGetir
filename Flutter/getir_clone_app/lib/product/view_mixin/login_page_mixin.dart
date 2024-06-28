import 'package:flutter/material.dart';
import 'package:getir_clone_app/view/login_page.dart';

mixin LoginPageMixin on State<LoginPage>{
  static const String appBarTitle = "Giriş Yap";
  static const String titleText = "Tatlımı Getir'e Hoşgeldiniz";
  static const String epostHintText = "E-posta";
  static const String passwordHintText = "Şifre";
  static const String passwordTextButtonText = "Şifremi Unuttum";
  static const String loginButtonText = "Giriş Yap";
  static const String registerPageTextButtonText = "Henüz hesabın yok mu? Hemen Kayıt ol!";
  static const String textFormFildisNotEmtyText = "Bu alan boş geçilemez.";

  GlobalKey<FormState> key = GlobalKey();

  final TextEditingController epostController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
  // Simple password verification
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Şifre boş bırakılamaz';
    }
    if (value.length < 6) {
      return 'Şifre en az 6 karakter olmalıdır';
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    epostController.dispose();
    passwordController.dispose();
  }
}