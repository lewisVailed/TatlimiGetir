import 'package:flutter/material.dart';
import 'package:getir_clone_app/view/profile_detail_page.dart';

mixin ProfileDetailMixin on State<ProfileDetailPage>{

  static const String saveButtonText = "Değişiklikleri Kaydet";
  
  GlobalKey<FormState> key = GlobalKey();
  late final TextEditingController tfController;
  
  @override
  void initState() {
    super.initState();
    tfController = TextEditingController();
    tfController.text = widget.tfText;
  }


  @override
  void dispose() {
    super.dispose();
    tfController.dispose();
  }
}