import 'package:flutter/material.dart';
import 'package:getir_clone_app/views/sign_in_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Giriş Yap"),
      ),
      body: const Padding(
        padding:  EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            textField(hintText: "E mail",inputType: TextInputType.emailAddress),
            textField(hintText: "Şifre",obscureText: true,),
            loginButton(buttonName: "Giriş Yap")
          ],
        ),
      ),
    );
  }
}