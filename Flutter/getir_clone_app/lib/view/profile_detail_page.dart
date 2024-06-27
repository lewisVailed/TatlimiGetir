import 'package:flutter/material.dart';
import 'package:getir_clone_app/product/extensions/build_context_extension.dart';
import 'package:getir_clone_app/product/view_mixin/profile_detail_mixin.dart';
import 'package:getir_clone_app/product/widget/elevated_button.dart';

class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({super.key, required this.tfText, required this.labelText, required this.appBarTitle,required this.validate,required this.keyboardType});

  final String tfText;
  final String labelText;
  final String appBarTitle;
  final String? Function(String?)? validate;
  final TextInputType? keyboardType;

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> with ProfileDetailMixin{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.90),
      appBar: AppBar(
        title: Text("${widget.appBarTitle} Düzenle"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_backspace_rounded,color: Colors.white,),
         onPressed: () { 
          Navigator.pop(context);
          },
        ),
      ),
      body:  Form(
        key: key,
        child: Column(
          children: [
            const Spacer(flex: 5,),
            Container(
              color: Colors.white,
              child: Padding(
                padding: context.paddingAllLow2,
                child: TextFormField(
                  validator: widget.validate,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: tfController,
                  keyboardType: widget.keyboardType,
                  decoration: InputDecoration(
                    labelText: widget.labelText,
                    suffixIcon: IconButton(
                      onPressed: (){
                        tfController.clear();
                      }, 
                      icon: const Icon(Icons.cancel_rounded))
                  ),
                ),
              ),
            ),
            const Spacer(flex: 95,),
            Padding(
              padding: context.paddingAllLow2,
              child: Elevatedbutton(
                onPressed: (){
                  if(key.currentState?.validate() ?? false){
                    Navigator.pop(context);
                  }
                },
                buttonName: ProfileDetailMixin.saveButtonText
                ),
            )
          ],
        ),
      ),
    );
  }
}