import 'package:flutter/material.dart';
import 'package:getir_clone_app/product/extensions/build_context_extension.dart';
import 'package:getir_clone_app/product/widget/elevated_button.dart';
import 'package:getir_clone_app/product/widget/text_form_field.dart';
import 'package:getir_clone_app/services/auth_services.dart';
import 'package:getir_clone_app/view_model/forgat_password_view_model.dart';

class ForgarPassword extends StatefulWidget {
  const ForgarPassword({super.key});

  @override
  State<ForgarPassword> createState() => _ForgarPasswordState();
}

class _ForgarPasswordState extends State<ForgarPassword> {

  final GlobalKey<FormState> _key = GlobalKey();
  late TextEditingController _tfController;
  // Simple email verification
  String? validateEmail(String? data) {
    if (data == null || data.isEmpty) {
      return 'E-posta boş bırakılamaz';
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(data)) {
      return 'Geçerli bir e-posta giriniz';
    }
    return null;
  }
  @override
  void initState() {
    super.initState();
    _tfController=TextEditingController();
  }

  @override
  Widget build(BuildContext context) {

    final ForgatPasswordViewModel viewModel = ForgatPasswordViewModel(context, authServices: AuthServices());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Şifre yenileme"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_backspace_rounded,color: Colors.white,),
         onPressed: () { 
          Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key: _key,
        child: Padding(
          padding: context.paddingColumnHorizontal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormFieldIsNotEmpty(
                controller: _tfController,
                validator: validateEmail, 
                hintText: "E-mailinizi giriniz",
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: context.buttonHeightValue,),
              Elevatedbutton(
                buttonName: "E-maili gönder",
                onPressed: (){
                  if(_key.currentState?.validate() ?? false){
                    viewModel.updatePasword(_tfController.text);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}