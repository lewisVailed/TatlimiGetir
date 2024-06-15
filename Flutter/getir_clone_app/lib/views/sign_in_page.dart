import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getir_clone_app/views/tab_view.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final String textFieldPhone = "Telefon Numarası";
  

  final String agreement1 = "Kullanım Koşulları'nı";
  final String agreement2 = " okudum kabul ediyorum.";

  final String informativeText1 = "KVKK Aydınlatma Metni";
  final String informativeText2 = " kapsamında verilerin bana özel teklifler ve kampanyalar için kullanılmasına, tarafıma ticari elektronik ileti gönderilmesine izin veriyorum.";

  final String buttonName = "Üye ol";

  late final TapGestureRecognizer _tapGestureRecognizerAgreement;
  late final TapGestureRecognizer _tapGestureRecognizerInformative;

  late final Uri _urlAgreement;
  late final Uri _urlInformative;
  @override
  void initState() {
    super.initState();
    _urlAgreement = Uri.parse('https://getir.com/yardim/kullanim-kosullari/');
    _urlInformative = Uri.parse('https://getir.com/yardim/kvkk/');
    _tapGestureRecognizerAgreement = TapGestureRecognizer()
      ..onTap = () {
        launchUrl(_urlAgreement);
      };
    
     _tapGestureRecognizerInformative = TapGestureRecognizer()
      ..onTap = () {
        launchUrl(_urlInformative);
      };
  }

  
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
            const Spacer(flex: 2,),
             textField(hintText: textFieldUserName,),
             const Spacer(flex: 1,),
            textField(hintText: textFieldEposta,inputType: TextInputType.emailAddress,),
            const Spacer(flex: 1,),
            textField(hintText: textFieldPassword,obscureText: true,),
            const Spacer(flex: 1,),
            textField(hintText: textFieldPhone,inputType: TextInputType.phone,),
            const Spacer(flex: 1,),
            _RichText(text1:agreement1,text2:agreement2,
            tapGestureRecognizer: _tapGestureRecognizerAgreement,),
            _RichText(text1: informativeText1, text2: informativeText2, 
            tapGestureRecognizer: _tapGestureRecognizerInformative),
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

class _RichText extends StatelessWidget {
  const _RichText({
    super.key,
    required TapGestureRecognizer tapGestureRecognizer, required this.text1, required this.text2,
  }) : _tapGestureRecognizer = tapGestureRecognizer;

  
  final String text1 ;
  final String text2 ; 
  final TapGestureRecognizer _tapGestureRecognizer;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        recognizer: _tapGestureRecognizer,
        text: text1,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Colors.purple[900],
          fontWeight: FontWeight.bold
        ),
        children: <TextSpan> [
          TextSpan(text: text2,style: const TextStyle(color: Colors.black)),
        ]
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
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TabView()));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff7b2cbf)
      ),
      child:  Text(buttonName,style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),),);
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