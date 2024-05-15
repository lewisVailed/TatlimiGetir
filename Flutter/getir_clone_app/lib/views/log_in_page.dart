import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        title: Text(_appbarTitle),
      ),
      body: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          
          children: [
            const Spacer(flex: 5,),
            textField(hintText: _textFieldEposta,inputType: TextInputType.emailAddress),
            const Spacer(flex: 1,),
            textField(hintText: _textFieldPassword,obscureText: true,),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: (){}, 
                child:   Text("Şifremi unuttum",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.purple,decoration: TextDecoration.underline, decorationColor: Colors.purple
                ),)),
            ),
            const Spacer(flex: 20,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: loginButton(buttonName: _buttonName)),
            
            const Spacer(flex: 5,),
          ],
        ),
      ),
    );
  }
}