import 'package:flutter/material.dart';
import 'package:getir_clone_app/views/log_in_page.dart';
import 'package:getir_clone_app/views/profile_detail_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final String name = "Mustafa Narin";
  final String namePageDetailLabelText = "Ad ve Soyadı";
  final String namePageDetailAppbarTitle = "İsmi";
  
  final String email = "mustafa.narin1132@gmail.com";
  final String emailPageDetailLabelText = "E-posta adresi";
  final String emailPageDetailAppbarTitle = "E-posta Adresi";

  final String adress = "Fatih Mahallesi 99. sokak Isparta/Merkez";
  final String adressPageDetailLabelText = "Sipariş adresi";
  final String adressPageDetailAppbarText = "Sipariş Adresi";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
      ),
      body:  Column(
        children: [
          _ListTile(icon: Icons.person_rounded, titleText: name,
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => ProfileDetailPage(
                tfText: name, labelText: namePageDetailLabelText,
                 appBarTitle: namePageDetailAppbarTitle,
              )));
          },),
          const Divider(),
          _ListTile(icon: Icons.email_rounded, titleText: email,onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileDetailPage(tfText: email, labelText: emailPageDetailLabelText, 
            appBarTitle: emailPageDetailAppbarTitle)));
          },),
          const Divider(),
          const _ListTile(icon: Icons.phone_rounded, titleText: "+90 555 444 33 22"),
          const Divider(),
          _ListTile(icon: Icons.home_work_rounded, titleText: adress,
          onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileDetailPage(tfText: adress, labelText: adressPageDetailLabelText, 
            appBarTitle: adressPageDetailAppbarText)));
          } ,),
          const Divider(),
          _ListTile(icon: Icons.output_rounded, titleText: "Çıkış Yap",
          onTap: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginPage()), (route) => false);
          },)
        ],),
    );
  }
}

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
      leading: Icon(icon,size: 40,),
      title:  Text(titleText),
      titleTextStyle: Theme.of(context).textTheme.titleMedium,
      trailing: const Icon(Icons.chevron_right_rounded,size: 30,),
      iconColor: const Color(0xff7b2cbf),
      onTap: onTap,
      
      );
  }
}