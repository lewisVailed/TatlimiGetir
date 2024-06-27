import 'package:flutter/material.dart';
import 'package:getir_clone_app/product/color/color_schema.dart';
import 'package:getir_clone_app/product/extensions/build_context_extension.dart';
import 'package:getir_clone_app/product/view_mixin/profile_page_mixin.dart';
import 'package:getir_clone_app/services/auth_services.dart';
import 'package:getir_clone_app/view/login_page.dart';
import 'package:getir_clone_app/view/profile_detail_page.dart';
import 'package:getir_clone_app/view_model/profile_view_model.dart';

part '../product/part_of/alert_dialog.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with ProfilePageMixin{

  @override
  Widget build(BuildContext context) {
    final ProfileViewModel viewModel = ProfileViewModel(context, authServices: AuthServices());
    return Scaffold(
      appBar: AppBar(
        title:  const Text(ProfilePageMixin.appBarTitle),
      ),
      body:  Column(
        children: [
          _ListTile(icon: Icons.person_rounded, titleText: name,
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => ProfileDetailPage(
                tfText: name, labelText: ProfilePageMixin.namePageDetailLabelText,
                 appBarTitle: ProfilePageMixin.namePageDetailAppbarTitle,validate: validateName,keyboardType: TextInputType.name,
              )));
          },),
          const Divider(),
          _ListTile(icon: Icons.email_rounded, titleText: email,onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileDetailPage(tfText: email, labelText: ProfilePageMixin.emailPageDetailLabelText, 
            appBarTitle: ProfilePageMixin.emailPageDetailAppbarTitle,validate: validateEmail,keyboardType: TextInputType.emailAddress,)));
          },),
          const Divider(),
          _ListTile(icon: Icons.phone_rounded, titleText: number,onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileDetailPage(tfText: number, labelText: ProfilePageMixin.numberPageDetailAppbarText, appBarTitle: ProfilePageMixin.numberPageDetailAppbarText,validate: validatePhoneNumber,keyboardType: TextInputType.number,))) ),
          const Divider(),
          _ListTile(icon: Icons.home_work_rounded, titleText: adress,
          onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileDetailPage(tfText: adress, labelText: ProfilePageMixin.adressPageDetailLabelText, 
            appBarTitle: ProfilePageMixin.adressPageDetailAppbarText,validate: validateAdress,keyboardType: TextInputType.streetAddress,)));
          } ,),
          const Divider(),
          _ListTile(icon: Icons.output_rounded, titleText: ProfilePageMixin.appOutText,
          onTap: () async {
            final result = await showDialog(
              context: context, 
              builder: (context){
                return const _AlertDialog();
              });
            if(result is bool){
              viewModel.outUser();
            }
          },)
        ],),
    );
  }
}


//
class _ListTile extends StatelessWidget {
  const _ListTile({
    super.key, required this.icon, required this.titleText, this.onTap,
  });
  final IconData icon;
  final String titleText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,size: _IconSizes().listTileLeading,),
      title:  Text(titleText),
      titleTextStyle: context.textTheme().titleMedium,
      trailing: Icon(Icons.chevron_right_rounded,size: _IconSizes().listTileTrailing,),
      iconColor: ProjectColors.appbarColor,
      onTap: onTap,
      
      );
  }
}

class _IconSizes{
  double listTileLeading = 40.0;
  double listTileTrailing = 30.0;
}