import 'package:flutter/material.dart';
import 'package:getir_clone_app/views/sign_in_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String _appbarTitle = "Giriş Yap";
  final String _textFieldEposta = "E mail";
  final String _textFieldPassword = "Şifre";
  final String _buttonName = "Giriş Yap";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appbarTitle),
      ),
      body: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            textField(hintText: _textFieldEposta,inputType: TextInputType.emailAddress),
            textField(hintText: _textFieldPassword,obscureText: true,),
            loginButton(buttonName: _buttonName)
          ],
        ),
      ),
    );
  }
}