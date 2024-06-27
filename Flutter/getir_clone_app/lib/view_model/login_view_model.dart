import 'package:flutter/material.dart';
import 'package:getir_clone_app/services/auth_services.dart';

class LoginViewModel{
  LoginViewModel(this.context, {required this.authServices});

  final AuthServices authServices;
  final BuildContext context;

  Future<void> loginUser(String email, String password)async {
    await authServices.signIn(context, email: email, password: password);
  }
  
}