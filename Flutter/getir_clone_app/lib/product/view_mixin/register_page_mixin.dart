import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:getir_clone_app/view/register_page.dart';
import 'package:url_launcher/url_launcher.dart';

mixin RegisterPageMixin on State<RegisterPage> {

  static const String agreement1 = "Kullanım Koşulları'nı";
  static const String agreement2 = " okudum kabul ediyorum.";
  static const String informativeText1 = "KVKK Aydınlatma Metni";
  static const String informativeText2 = " kapsamında verilerin bana özel teklifler ve kampanyalar için kullanılmasına, tarafıma ticari elektronik ileti gönderilmesine izin veriyorum.";
  static const String appbarTitle = "Üye ol";
  static const String nameHintText = "Ad Soyad";
  static const String epostHintText = "E-posta";
  static const String passwordHintText = "Şifre";
  static const String numberHintText = "Telefon Numarası";
  static const String textFormFildisNotEmtyText = "Bu alan boş geçilemez.";
  static const String registerButtonName = "Üye ol";
  static const String urlAgreementLink = 'https://getir.com/yardim/kullanim-kosullari/';
  static const String urlInformativeLink = 'https://getir.com/yardim/kvkk/';

  GlobalKey<FormState> key = GlobalKey();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController epostController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

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


  late final TapGestureRecognizer tapGestureRecognizerAgreement;
  late final TapGestureRecognizer tapGestureRecognizerInformative;

  late final Uri urlAgreement;
  late final Uri urlInformative;
  
  // URL LAUNCHER
  @override
  void initState() {
    super.initState();
    urlAgreement = Uri.parse(urlAgreementLink);
    urlInformative = Uri.parse(urlInformativeLink);
    tapGestureRecognizerAgreement = TapGestureRecognizer()
      ..onTap = () {
        launchUrl(urlAgreement);
      };
    
     tapGestureRecognizerInformative = TapGestureRecognizer()
      ..onTap = () {
        launchUrl(urlInformative);
      };
  }
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    epostController.dispose();
    passwordController.dispose();
    numberController.dispose();
  }
}