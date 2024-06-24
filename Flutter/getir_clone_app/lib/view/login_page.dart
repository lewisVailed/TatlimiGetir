import 'package:flutter/material.dart';
import 'package:getir_clone_app/product/color/color_schema.dart';
import 'package:getir_clone_app/product/extensions/build_context_extension.dart';
import 'package:getir_clone_app/product/view_mixin/login_page_mixin.dart';
import 'package:getir_clone_app/product/widget/elevated_button.dart';
import 'package:getir_clone_app/product/widget/password_textfield.dart';
import 'package:getir_clone_app/product/widget/text_button.dart';
import 'package:getir_clone_app/product/widget/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginPageMixin {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Giriş Yap"),
      ),
      body: Padding(
        padding: context.paddingColumnHorizontal,
        child: Column(
          children: [
            const Spacer(flex: 10,),
            Text(LoginPageMixin.titleText,style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: ProjectColors.appbarColor),),
            const Spacer(flex: 5,),
            Textfield(controller:epostController,hintText: LoginPageMixin.epostHintText,keyboardType: TextInputType.emailAddress,),
            const Spacer(flex: 2,),
             PasswordTextfield(controller: passwordController,hintText: LoginPageMixin.passwordHintText, keyboardType: TextInputType.visiblePassword),
            Align(
              alignment: Alignment.topRight,
              child: Textbutton(onPressed: (){},buttonName: "Şifremi Unuttum",textDecoration: TextDecoration.underline,),
            ),
            const Spacer(flex:50,),
            Elevatedbutton(onPressed: (){},buttonName: "Giriş Yap",),
            const Spacer(flex: 2),
            Textbutton(onPressed:(){},buttonName: LoginPageMixin.registerPageTextButtonText),
            const Spacer(flex: 8,)
          ],
        ),
      ),
    );
  }
}





