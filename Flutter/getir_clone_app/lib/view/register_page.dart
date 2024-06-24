  import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:getir_clone_app/product/color/color_schema.dart';
import 'package:getir_clone_app/product/extensions/build_context_extension.dart';
import 'package:getir_clone_app/product/view_mixin/register_page_mixin.dart';
import 'package:getir_clone_app/product/widget/elevated_button.dart';
import 'package:getir_clone_app/product/widget/password_text_form_field.dart';
import 'package:getir_clone_app/product/widget/text_form_field.dart';

class RegisterPage extends StatefulWidget {
    const RegisterPage({super.key});
  
    @override
    State<RegisterPage> createState() => _RegisterPageState();
  }
  
  class _RegisterPageState extends State<RegisterPage> with RegisterPageMixin{
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(RegisterPageMixin.appbarTitle),
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: context.paddingColumnHorizontal,
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 10,),
                TextFormFieldIsNotEmpty(validator: validateName, controller: nameController, hintText: RegisterPageMixin.nameHintText, keyboardType: TextInputType.name),
                const Spacer(flex: 4,),
                TextFormFieldIsNotEmpty(validator: validateEmail, controller: epostController, hintText: RegisterPageMixin.epostHintText, keyboardType: TextInputType.emailAddress),
                const Spacer(flex: 4,),
                PasswordTextFormfieldNotEmpty(validator: validatePassword, controller: passwordController, hintText: RegisterPageMixin.passwordHintText, keyboardType: TextInputType.visiblePassword),
                const Spacer(flex: 4,),
                TextFormFieldIsNotEmpty(validator: validatePhoneNumber, controller: numberController, hintText: RegisterPageMixin.numberHintText, keyboardType: TextInputType.number),
                const Spacer(flex: 4,),
                _RichText(text1:RegisterPageMixin.agreement1,text2:RegisterPageMixin.agreement2,
                tapGestureRecognizer: tapGestureRecognizerAgreement,),
                _RichText(text1: RegisterPageMixin.informativeText1, text2: RegisterPageMixin.informativeText2, 
                tapGestureRecognizer: tapGestureRecognizerInformative),
                const Spacer(flex: 40,),
                Elevatedbutton(
                  onPressed: (){
                    if(key.currentState?.validate() ?? false){
                    print("okey");
                    }
                  },
                  buttonName: RegisterPageMixin.registerButtonName,
                  ),
                  const Spacer(flex: 10,)
              ],
            ),
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
          color: ProjectColors.appbarColor,
          fontWeight: FontWeight.bold
        ),
        children: <TextSpan> [
          TextSpan(text: text2,style: const TextStyle(color: Colors.black)),
        ]
      ),
    );
  }
}
