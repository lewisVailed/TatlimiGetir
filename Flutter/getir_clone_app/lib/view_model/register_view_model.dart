import 'package:flutter/material.dart';
import 'package:getir_clone_app/services/auth_services.dart';

class RegisterViewModel{
  RegisterViewModel(this.context, {required this.authService}); 

  final AuthServices authService;
  final BuildContext context;

  Future<void> saveUserToFirebase(String name, String email, String password, String number)async {
    authService.signUp(context,name: name, email: email, password: password, number: number);
  }
}