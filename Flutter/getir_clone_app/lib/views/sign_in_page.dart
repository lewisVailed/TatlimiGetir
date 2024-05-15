import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {

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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(appbarTitle),
      ),
      body: Padding(
        padding:   const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 2,),
             textField(hintText: textFieldUserName,),
             const Spacer(flex: 1,),
            textField(hintText: textFieldEposta,inputType: TextInputType.emailAddress,),
            const Spacer(flex: 1,),
            textField(hintText: textFieldPassword,obscureText: true,),
            const Spacer(flex: 1,),
            _richText(text1: agreement1,text2: agreement2,),
            
            _richText(text1: informativeText1, text2: informativeText2),
            const Spacer(flex: 8,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: loginButton(buttonName: buttonName),
            ),
            const Spacer(flex: 2,)
          ],
        ),
      ),
    );
  }
}

class loginButton extends StatelessWidget {
  const loginButton({
    super.key,
    required this.buttonName,
  });

  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
    
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff7b2cbf)
      ),
      child:  Text(buttonName,style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),),);
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
      textInputAction: TextInputAction.next,
    );
  }
}