import 'package:flutter/material.dart';
import 'package:getir_clone_app/services/auth_services.dart';

class ForgatPasswordViewModel{

  final AuthServices authServices;
  final BuildContext context;

  ForgatPasswordViewModel(this.context, {required this.authServices});

  Future<void> updatePasword(String email) async {
    await authServices.sendPasswordResetLink(context,email);
  }
}