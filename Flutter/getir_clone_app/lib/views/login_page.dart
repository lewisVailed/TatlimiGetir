import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        title: const Text("Üye ol"),
      ),
      body: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 1,),
            const Expanded(
              flex: 3,
              child: textField(hintText: "Ad Soyad",)),
            const Expanded(
              flex: 3,
              child: textField(hintText: "E posta",inputType: TextInputType.emailAddress,)),
            const Expanded(
              flex: 3,
              child: textField(hintText: "Şifre",obscureText: true,)),
            _richText(text1: "Kullanım Koşulları'nı",text2: " okudum kabul ediyorum.",),
            
            _richText(text1: "KVKK Aydınlatma Metni", text2: " kapsamında verilerin bana özel teklifler ve kampanyalar için kullanılmasına, tarafıma ticari elektronik ileti gönderilmesine izin veriyorum."),
            const Spacer(flex: 8,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
              
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff7b2cbf)
                ),
                child:  Text("Üye ol",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),),),
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
        recognizer: Gesture
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