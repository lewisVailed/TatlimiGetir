import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getir_clone_app/product/color/color_schema.dart';
import 'package:getir_clone_app/product/extensions/build_context_extension.dart';
import 'package:getir_clone_app/product/view_mixin/profile_page_mixin.dart';
import 'package:getir_clone_app/services/auth_services.dart';
import 'package:getir_clone_app/view/profile_detail_page.dart';
import 'package:getir_clone_app/view_model/profile_view_model.dart';

part '../product/part_of/alert_dialog.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.userId, this.updated});
  final String userId;
  final bool? updated;

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
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('users').doc(widget.userId).get(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('No data found'));
          }

          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
           return Column(
        children: [
          _ListTile(icon: Icons.person_rounded, titleText: data["name"],
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => ProfileDetailPage(
                tfText: data["name"], labelText: ProfilePageMixin.namePageDetailLabelText,
                 appBarTitle: ProfilePageMixin.namePageDetailAppbarTitle,validate: validateName,keyboardType: TextInputType.name,userId: widget.userId, updateData: name,
              )));

          },),
          const Divider(),
          _ListTile(icon: Icons.email_rounded, titleText: data["email"],onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileDetailPage(tfText: data["email"], labelText: ProfilePageMixin.emailPageDetailLabelText, 
            appBarTitle: ProfilePageMixin.emailPageDetailAppbarTitle,validate: validateEmail,keyboardType: TextInputType.emailAddress,userId: widget.userId, updateData: email,)));
          },),
          const Divider(),
          _ListTile(icon: Icons.phone_rounded, titleText: data["number"],onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileDetailPage(tfText: data["number"], labelText: ProfilePageMixin.numberPageDetailAppbarText, appBarTitle: ProfilePageMixin.numberPageDetailAppbarText,validate: validatePhoneNumber,keyboardType: TextInputType.number,userId: widget.userId, updateData: number,))) ),
          const Divider(),
          _ListTile(icon: Icons.home_work_rounded, titleText: data["adress"],
          onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileDetailPage(tfText: data["adress"], labelText: ProfilePageMixin.adressPageDetailLabelText, 
            appBarTitle: ProfilePageMixin.adressPageDetailAppbarText,validate: validateAdress,keyboardType: TextInputType.streetAddress,userId: widget.userId, updateData: adress,)));
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
        ],);
        }
      )
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