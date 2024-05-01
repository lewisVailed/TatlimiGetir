import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final String appbarTitle = "Üye ol";

  final String textFieldUserName = "Ad Soyad";
  final String textFieldEposta = "E posta";
  final String textFieldPassword = "Şifre";
  

  final String agreement1 = "Kullanım Koşulları'nı";
  final String agreement2 = " okudum kabul ediyorum.";

  final String informativeText1 = "KVKK Aydınlatma Metni";
  final String informativeText2 = " kapsamında verilerin bana özel teklifler ve kampanyalar için kullanılmasına, tarafıma ticari elektronik ileti gönderilmesine izin veriyorum.";

  final String buttonName = "Üye ol";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appbarTitle),
      ),
      body: Padding(
        padding:   const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 1,),
             Expanded(
              flex: 3,
              child: textField(hintText: textFieldUserName,)),
            Expanded(
              flex: 3,
              child: textField(hintText: textFieldEposta,inputType: TextInputType.emailAddress,)),
             Expanded(
              flex: 3,
              child: textField(hintText: textFieldPassword,obscureText: true,)),
            _richText(text1: agreement1,text2: agreement2,),
            
            _richText(text1: informativeText1, text2: informativeText2),
            const Spacer(flex: 8,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
              
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff7b2cbf)
                ),
                child:  Text(buttonName,style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),),),
            ),
            const Spacer(flex: 1,)
          ],
        ),
      ),
    );
  }
}

class _richText extends StatelessWidget {
  const _richText({
    super.key, required this.text1, required this.text2,
  });
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1,
        
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Colors.purple[900],
          fontWeight: FontWeight.bold
        ),
        children:  <TextSpan>[
          TextSpan(
            text: text2,
            style: const TextStyle(color: Colors.black)
          ),
        ]
        
      )
    );
  }
}

class textField extends StatelessWidget {
  const textField({
    super.key, 
    required this.hintText, 
    this.inputType = TextInputType.name,
    this.obscureText = false,
  });
  final String hintText;
  final bool obscureText;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
      
      ),
      obscureText: obscureText,
      keyboardType: inputType,
    );
  }
}