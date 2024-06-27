import 'package:flutter/material.dart';
import 'package:getir_clone_app/services/auth_services.dart';

class ProfileViewModel{
  ProfileViewModel(this.context, {required this.authServices});
  final AuthServices authServices;
  final BuildContext context;

  Future<void> outUser() async {
    await authServices.signOut(context);
  }
  
}